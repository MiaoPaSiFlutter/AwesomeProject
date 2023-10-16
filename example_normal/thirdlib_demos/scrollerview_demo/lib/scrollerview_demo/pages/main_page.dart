import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'scroll_demo/DouYinPingLunDemo.dart';
import 'scroll_demo/PullToRefreshDemo1.dart';
import 'scroll_demo/PullToRefreshDemo2.dart';
import 'scroll_demo/PullToRefreshDemo3.dart';
import 'scroll_demo/PullToRefreshDemo4.dart';
import 'scroll_demo/PullToRefreshDemo5.dart';
import 'scroll_demo/Q_NestedScrollView001.dart';
import 'scroll_demo/customscroll_demo1_page.dart';
import 'scroll_demo/customscroll_demo2_page.dart';
import 'scroll_demo/customscroll_demo3_page.dart';
import 'scroll_demo/scroll_dynamic_pinnedHeaderHeight_demo.dart';
import 'scroll_demo/scroll_extended_nested_scrollview_demo.dart';
import 'scroll_demo/scroll_loadmore_demo.dart';
import 'scroll_demo/scroll_official_demo.dart';
import 'scroll_demo/scroll_pull_down_to_scale_image_demo.dart';
import 'scroll_demo/scroll_pull_down_to_scale_image_demo2.dart';
import 'scroll_demo/scroll_scroll_direction_demo.dart';
import 'scroll_demo/scroll_scroll_to_top_demo.dart';

class ScrollerDemoModuleMainPage extends StatelessWidget {
  final List<DemoRouteResult> routeLIST = <DemoRouteResult>[
    DemoRouteResult(description: '下拉刷新Demo1 .', page: PullToRefreshDemo1()),
    DemoRouteResult(
        description: '下拉刷新Demo2 - pull_to_refresh_notification.',
        page: PullToRefreshDemo2()),
    DemoRouteResult(
        description: '下拉刷新Demo3 - CupertinoSliverRefreshControl.',
        page: PullToRefreshDemo3()),
    DemoRouteResult(
        description: '下拉刷新Demo4 - RefreshIndicator.',
        page: PullToRefreshDemo4()),
    DemoRouteResult(
        description: '下拉刷新Demo5 - liquid_pull_to_refresh.',
        page: PullToRefreshDemo5()),
    DemoRouteResult(description: '抖音评论Demo .', page: DouYinPingLunDemo()),
    DemoRouteResult(
        description: 'CustomScrollDemo1 .', page: CustomScrollDemo1Page()),
    DemoRouteResult(
        description: 'CustomScrollDemo2 .', page: CustomScrollDemo2Page()),
    DemoRouteResult(
        description: 'CustomScrollDemo3 .', page: CustomScrollDemo3Page()),
    DemoRouteResult(
        description: '下拉放大顶部图片Demo.', page: ScrollPullDownToScaleImageDemo()),
    DemoRouteResult(
        description: '下拉放大顶部图片Demo2.', page: ScrollPullDownToScaleImageDemo2()),
    DemoRouteResult(
        description: '多个ScrollView嵌套 .',
        page: ScrollExtendedNestedScrollViewDemo()),
    DemoRouteResult(description: '横向滚动 .', page: ScrollScrollDirectionDemo()),
    DemoRouteResult(
        description: 'pinnedHeader高度不固定 .',
        page: ScrollDynamicPinnedHeaderHeightDemo()),
    DemoRouteResult(description: '滑动到顶部 .', page: ScrollScrollToTopDemo()),
    DemoRouteResult(description: '官方demo', page: ScrollOfficialDemo()),
    DemoRouteResult(description: '加载更多 .', page: ScrollLoadMoreDemo()),
    DemoRouteResult(
        description: 'NestedScrollView问题 .', page: Q_NestedScrollView001()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('scroll_demo'),
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
              onPressed: () {},
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
              onPressed: () {},
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
