// ignore_for_file: unnecessary_cast

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';

import 'package:loading_more_list/loading_more_list.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class ScrollScrollToTopDemo extends StatefulWidget {
  const ScrollScrollToTopDemo({super.key});

  @override
  _ScrollScrollToTopDemoState createState() => _ScrollScrollToTopDemoState();
}

class _ScrollScrollToTopDemoState extends State<ScrollScrollToTopDemo>
    with TickerProviderStateMixin {
  late final TabController primaryTC;
  final GlobalKey<ExtendedNestedScrollViewState> _key =
      GlobalKey<ExtendedNestedScrollViewState>();

  @override
  void initState() {
    super.initState();
    primaryTC = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    primaryTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScaffoldBody(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.file_upload),
        onPressed: () {
          ///scroll current tab list
          _key.currentState?.outerController.animateTo(
            0.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
          );

          ///scroll all tab list
          // _key.currentState.innerScrollPositions.forEach((position) {
          //   position.animateTo(0.0,
          //       duration: Duration(seconds: 1), curve: Curves.easeIn);
          // });
        },
      ),
    );
  }

  Widget _buildScaffoldBody() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return ExtendedNestedScrollView(
      key: _key,
      headerSliverBuilder: (BuildContext c, bool f) {
        return <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            title: const Text('scroll to top'),
            flexibleSpace: FlexibleSpaceBar(
              //centerTitle: true,
              collapseMode: CollapseMode.pin,
              background: Image.asset(
                  NormalModuleUtils.configPackagesImage(
                      packagename: 'demo_jingdong',
                      name: 'assets/images/scroll_demos/467141054.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
        ];
      },
      //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
      pinnedHeaderSliverHeightBuilder: () {
        return pinnedHeaderHeight;
      },

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
            tabs: const <Tab>[
              Tab(text: 'Tab0'),
              Tab(text: 'Tab1'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: primaryTC,
              children: <Widget>[
                GlowNotificationWidget(
                  ListView.builder(
                    //store Page state
                    key: const PageStorageKey<String>('Tab0'),
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext c, int i) {
                      return Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: Text('${const Key('Tab0')}: ListView$i'),
                      );
                    },
                    itemCount: 50,
                  ),
                  showGlowLeading: false,
                ),
                GlowNotificationWidget(
                  ListView.builder(
                    //store Page state
                    key: const PageStorageKey<String>('Tab1'),
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext c, int i) {
                      return Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: Text('${const Key('Tab1')}: ListView$i'),
                      );
                    },
                    itemCount: 50,
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
