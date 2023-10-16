import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:loading_more_list/loading_more_list.dart';

import 'common.dart';

// @FFRoute(
//   name: 'fluttercandies://nestedscrollview',
//   routeName: 'NestedScrollview',
//   description: 'fix pinned header and inner scrollables sync issues.',
//   exts: <String, dynamic>{
//     'group': 'Simple',
//     'order': 0,
//   },
// )

class ScrollExtendedNestedScrollViewDemo extends StatefulWidget {
  const ScrollExtendedNestedScrollViewDemo({super.key});

  @override
  _ScrollExtendedNestedScrollViewDemoState createState() =>
      _ScrollExtendedNestedScrollViewDemoState();
}

class _ScrollExtendedNestedScrollViewDemoState
    extends State<ScrollExtendedNestedScrollViewDemo>
    with TickerProviderStateMixin {
  late final TabController primaryTC;
  late final TabController secondaryTC;

  @override
  void initState() {
    super.initState();
    primaryTC = TabController(length: 2, vsync: this);
    secondaryTC = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    primaryTC.dispose();
    secondaryTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildScaffoldBody());
  }

  Widget _buildScaffoldBody() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return ExtendedNestedScrollView(
      headerSliverBuilder: (BuildContext c, bool f) {
        return buildSliverHeader();
      },
      //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
      pinnedHeaderSliverHeightBuilder: () {
        return pinnedHeaderHeight;
      },
      //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
      onlyOneScrollInBody: true,
      body: Column(
        children: <Widget>[
          TabBar(
            controller: primaryTC,
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.0,
            isScrollable: false,
            unselectedLabelColor: Colors.grey,
            tabs: const <Tab>[Tab(text: 'Tab0'), Tab(text: 'Tab1')],
          ),
          Expanded(
            child: TabBarView(
              controller: primaryTC,
              children: <Widget>[
                SecondaryTabView('Tab0', secondaryTC),
                GlowNotificationWidget(
                  ExtendedVisibilityDetector(
                    uniqueKey: const Key('Tab1'),
                    child: ListView.builder(
                      //store Page state
                      key: const PageStorageKey<String>('Tab1'),
                      physics: const ClampingScrollPhysics(),
                      itemCount: 50,
                      itemBuilder: (BuildContext c, int i) {
                        return Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          child: Text(
                            '${const Key('Tab1')}: ListView$i',
                          ),
                        );
                      },
                    ),
                  ),
                  showGlowLeading: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> buildSliverHeader() {
  final List<Widget> widgets = <Widget>[];

  widgets.add(
    SliverAppBar(
      pinned: true,
      expandedHeight: 200.0,
      //title: Text(old ? 'old demo' : 'new demo'),
      flexibleSpace: FlexibleSpaceBar(
        //centerTitle: true,
        collapseMode: CollapseMode.pin,
        background: Image.asset(
            NormalModuleUtils.configPackagesImage(
                packagename: 'scrollerview_demo', name: 'assets/467141054.jpg'),
            fit: BoxFit.fill),
      ),
    ),
  );

  widgets.add(
    SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            height: 60.0,
            child: Text('Gird$index'),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 1.0)),
          );
        },
        childCount: 7,
      ),
    ),
  );

  widgets.add(
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext c, int i) {
          return Container(
            alignment: Alignment.center,
            height: 60.0,
            child: Text('SliverList$i'),
          );
        },
        childCount: 3,
      ),
    ),
  );

//  widgets.add(SliverPersistentHeader(
//      pinned: true,
//      floating: false,
//      delegate: CommonSliverPersistentHeaderDelegate(
//          Container(
//            child: primaryTabBar,
//            //color: Colors.white,
//          ),
//          primaryTabBar.preferredSize.height)));
  return widgets;
}
