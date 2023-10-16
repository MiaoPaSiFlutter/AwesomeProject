import 'package:flutter/material.dart';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class ScrollLoadMoreDemo extends StatefulWidget {
  @override
  _ScrollLoadMoreDemoState createState() => _ScrollLoadMoreDemoState();
}

class _ScrollLoadMoreDemoState extends State<ScrollLoadMoreDemo>
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
            expandedHeight:
                200.0, //The size of the app bar when it is fully expanded.
            title: const Text('load more list'),
            flexibleSpace: FlexibleSpaceBar(
              //centerTitle: true,
              collapseMode: CollapseMode.pin,
              background: Image.asset(
                NormalModuleUtils.configPackagesImage(
                    packagename: 'demo_jingdong',
                    name: 'assets/images/scroll_demos/467141054.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          )
        ];
      },
      //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
      pinnedHeaderSliverHeightBuilder: () {
        return pinnedHeaderHeight;
      },
      //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
      onlyOneScrollInBody: true,
      body: Column(
        children: <Widget>[
          Container(
            child: Text("哈哈哈"),
          ),
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
              children: const <Widget>[
                TabViewItem(Key('Tab0')),
                TabViewItem(Key('Tab1')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LoadMoreListSource extends LoadingMoreBase<int> {
  @override
  Future<bool> loadData([bool isloadMoreAction = false]) {
    return Future<bool>.delayed(const Duration(seconds: 1), () {
      for (int i = 0; i < 10; i++) {
        add(0);
      }

      return true;
    });
  }
}

class TabViewItem extends StatefulWidget {
  const TabViewItem(this.uniqueKey, {super.key});
  final Key uniqueKey;
  @override
  _TabViewItemState createState() => _TabViewItemState();
}

class _TabViewItemState extends State<TabViewItem>
    with AutomaticKeepAliveClientMixin {
  late final LoadMoreListSource source = LoadMoreListSource();

  @override
  void dispose() {
    source.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Widget child = ExtendedVisibilityDetector(
        uniqueKey: widget.uniqueKey,
        child: LoadingMoreList<int>(
          ListConfig<int>(
            sourceList: source,
            itemBuilder: (BuildContext c, int item, int index) {
              return Container(
                alignment: Alignment.center,
                height: 60.0,
                child: Text(': ListView$index'),
              );
            },
          ),
        ));
    return child;
  }
}
