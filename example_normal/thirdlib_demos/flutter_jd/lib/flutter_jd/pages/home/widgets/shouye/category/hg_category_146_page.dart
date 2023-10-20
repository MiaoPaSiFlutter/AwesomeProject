import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

import '../../../vm/home_viewmodel.dart';

class HGCategory146Page extends StatefulWidget {
  const HGCategory146Page({Key? key}) : super(key: key);

  @override
  State createState() => _HGCategory146PageState();
}

class _HGCategory146PageState extends State<HGCategory146Page>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) async {
            // //获取webView原始高度
            // var originalHeight = await _controller
            //     .runJavaScriptReturningResult("document.body.offsetHeight;");
            // _originalHeight = double.parse(originalHeight.toString());
            // setState(() {
            // });
            // print('网页高度-----$_originalHeight');
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

    // _controller.loadRequest(Uri.parse(
    //     'https://prodev.m.jd.com/mall/active/3d2Z4zCNKB88JLZp2D2Vv1RbRs6f/index.html?invoke=MD_Mac&ver=3.21.996.0&tttparams=1cvNZwIneyJnTGF0IjoiMzEuMTc5OTI0IiwidW5fYXJlYSI6IjJfMjgzMF81MTgxMF8wIiwiZExhdCI6IiIsInByc3RhdGUiOiIwIiwiYWRkcmVzc0lkIjoiMCIsImxhdCI6IjMxLjE3OTk2NiIsInBvc0xhdCI6IjMxLjE3OTkyNCIsInBvc0xuZyI6IjEyMS41OTk3NTQiLCJncHNfYXJlYSI6IjJfMjgzMF81MTgxMF8wIiwibG5nIjoiMTIxLjU5OTgyOSIsImdMbmciOiIxMjEuNTk5NzU0IiwibW9kZWwiOiJpUGhvbmU5LDIiLCJkTG5nIjoiIn80%3D'));
    _controller.loadRequest(Uri.parse('https://flutter.cn/'));
    // _controller.loadRequest(Uri.parse('https://www.baidu.com/'));
    // _controller.loadRequest(Uri.parse('https://m.jd.com/'));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Consumer<HomeViewModel>(
          builder: (context, model, widget) {
            return Container(
              height: model.appBarHeight + model.segmentHeight,
            );
          },
        ),
        Expanded(child: WebViewWidget(controller: _controller))
      ],
    );
  }
}
