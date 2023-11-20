import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'complex/home_page.dart';
import 'nested/webview.dart';
import 'simple/pinned_box.dart';
import 'simple/pinned_header.dart';
import 'simple/sliver_app_bar.dart';

class TestExtendedSliverApp extends GetView<TestExtendedSliverAppController> {
  const TestExtendedSliverApp({super.key});

  @override
  TestExtendedSliverAppController get controller =>
      Get.put(TestExtendedSliverAppController());

  @override
  Widget build(BuildContext context) {
    return const MyAppWrapper();
  }
}

class TestExtendedSliverAppController extends GetxController {
  TestExtendedSliverAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyAppWrapper extends StatefulWidget {
  const MyAppWrapper({super.key});

  @override
  State<MyAppWrapper> createState() => _MyAppWrapperState();
}

class _MyAppWrapperState extends State<MyAppWrapper> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test - ExtendedSliver',
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  final List<DemoRouteResult> routeLIST = <DemoRouteResult>[
    DemoRouteResult(description: 'simple pinned box.', page: PinnedBox()),
    DemoRouteResult(
        description: 'show how to nested webview in customscrollview.',
        page: NestedWebviewDemo()),
    DemoRouteResult(
        description: 'pinned header without minExtent and maxExtent.',
        page: PinnedHeader()),
    DemoRouteResult(
        description: 'A complex demo with extended_sliver..', page: HomePage()),
    DemoRouteResult(
        description: 'extended SliverAppbar.', page: SliverAppbarDemo())
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('extended_sliver'),
        actions: <Widget>[
          ButtonTheme(
            minWidth: 0.0,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
              child: const Text(
                'Github',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                launchUrl(Uri.parse(
                    'https://github.com/fluttercandies/extended_sliver'));
              },
            ),
          ),
          ButtonTheme(
            padding: const EdgeInsets.only(right: 10.0),
            minWidth: 0.0,
            child: TextButton(
              child: kIsWeb
                  ? const Text('QQ')
                  : Image.network(
                      'https://pub.idqqimg.com/wpa/images/group.png'),
              onPressed: () {
                launchUrl(Uri.parse('https://jq.qq.com/?_wv=1027&k=5bcc0gy'));
              },
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext c, int index) {
          return Container(
              margin: const EdgeInsets.all(20.0),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${index + 1}. ${routeLIST[index].description}'),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return routeLIST[index].page;
                  }));
                },
              ));
        },
        itemCount: routeLIST.length,
      ),
    );
  }
}

class DemoRouteResult {
  final String description;
  final Widget page;

  DemoRouteResult({required this.description, required this.page});
}
