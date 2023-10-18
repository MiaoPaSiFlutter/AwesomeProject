import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonWebPage extends StatefulWidget {
  const CommonWebPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CommonWebPageState();
  }
}

class _CommonWebPageState extends CommonState<CommonWebPage> {
  /// 属性
  ///
  ///

  String webtitle = "";
  @override
  String? get appBarTitle => webtitle;

  PageState webstate = PageState.initializedState;
  @override
  PageState get pageState => webstate;
  @override
  bool get safeAreabottm => false;

  int failnum = 1;
  bool isfail = false;
  WebViewController webViewController = WebViewController();

  /// 网页url
  String url = "";
  int lineProgress = 0;

  /// 生命周期
  ///
  ///

  /// 界面初始化
  @override
  void initDefaultState() {
    super.initDefaultState();
    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            setState(() {
              lineProgress = progress;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) async {
            String? title = await webViewController.getTitle();
            webtitle = title ?? '';
            configSetState(() {});
            print("title---$title");
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    print(currentGetParams());
    Map parameters = currentGetParams();
    url = parameters["url"] ?? "https://www.baidu.com/";
    webViewController.loadRequest(Uri.parse(url));
  }

  /// 界面销毁
  @override
  void initDefaultDispose() {
    super.initDefaultDispose();
  }

  /// 网路请求
  ///
  ///

  /// 构建视图
  ///
  ///
  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return Expanded(
      child: Column(
        children: [
          _progressBar(lineProgress, context),
          Expanded(child: WebViewWidget(controller: webViewController))
        ],
      ),
    );
  }

  _progressBar(int progress, BuildContext context) {
    double value = progress / 100;
    if (progress == 100) {
      return Container();
    } else {
      return SizedBox(
        height: 2,
        child: LinearProgressIndicator(
          backgroundColor: Colors.white70.withOpacity(0),
          value: value,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      );
    }
  }

  /// 触发方法
  ///
  ///

  /// 返回键
  @override
  configgoback(BuildContext context) async {
    if (await webViewController.canGoBack()) {
      await webViewController.goBack();
    } else {
      return super.configgoback(context);
    }
  }

  @override
  tapPlaceHoldWidgetMethod({required CommonPlaceHoldType placeHoldType}) {
    configSetState(() {
      webstate = PageState.initializedState;
    });
    reload();
  }

  void reload() {
    failnum++;
    webViewController.reload();
  }
}
