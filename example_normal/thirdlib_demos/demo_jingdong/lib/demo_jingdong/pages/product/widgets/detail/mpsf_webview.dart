import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MpsfWebView extends StatefulWidget {
  final String? url;
  const MpsfWebView({Key? key, this.url}) : super(key: key);

  @override
  State createState() => _MpsfWebViewState();
}

class _MpsfWebViewState extends State<MpsfWebView> {
  late final WebViewController _controller;
  double _webHeight = 0; //去计算得到网页的高度，然后设置高度

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS || Platform.isAndroid) {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted) //启用JS
        ..setBackgroundColor(const Color(0x00000000))
        ..addJavaScriptChannel(
            "jsMethodName1", //方法名，与H5中的名称一致。H5中调用方式：js方法名1.postMessage("字符串");
            onMessageReceived: (JavaScriptMessage message) {
          //接收H5发过来的数据
          String json = message.message;
          print("H5发过来的数据1: $json");
        })
        ..addJavaScriptChannel(
            "jsMethodName2", //方法名，与H5中的名称一致。H5中调用方式：js方法名2.postMessage("字符串");
            onMessageReceived: (JavaScriptMessage message) {
          //接收H5发过来的数据
          String json = message.message;
          print("H5发过来的数据1: $json");
        })
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              //加载H5页面时触发多次，progress值为0-100
            },
            onPageStarted: (String url) {
              //H5页面开始加载时触发
            },
            onPageFinished: (String url) async {
              //H5页面加载完成时触发
              //获取webView原始高度
              var scrollHeight = await _controller
                  .runJavaScriptReturningResult("document.body.scrollHeight;");
              var originalHeight = double.parse(scrollHeight.toString());
              setState(() {
                _webHeight = originalHeight <= 0 ? 300 : originalHeight;
              });
              print('网页高度-----$_webHeight');
            },
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              //控制页面是否进入下页
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent; //禁止跳下页
              }
              return NavigationDecision.navigate; //放行跳下页
            },
          ),
        );
      if (!HyzyTextTools.isEmpty(widget.url)) {
        _controller.loadRequest(Uri.parse(widget.url!));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isAndroid) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 44,
              color: Colors.green,
              child: const Text("---网页开始---"),
            ),

            /// TODO 在Android平台上，无法使用网页的真实高度（_webHeight数值太大，直接造
            /// 成程序崩溃，暂时不知道怎么解决）
            SizedBox(
              height: Platform.isIOS ? _webHeight : 666,
              child: WebViewWidget(controller: _controller),
            ),
            Container(
              height: 100,
              color: Colors.yellow,
              child: const Text("---网页结束---"),
            ),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 44,
              color: Colors.green,
              child: const Text("---网页开始---"),
            ),
            Container(
              height: 100,
              color: Colors.yellow,
              child: const Text("---网页结束---"),
            ),
          ],
        ),
      );
    }
  }
}
