import 'dart:async';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';

class SecondaryTabView extends StatefulWidget {
  const SecondaryTabView(this.tabKey, this.tc);

  final String tabKey;
  final TabController tc;

  @override
  _SecondaryTabViewState createState() => _SecondaryTabViewState();
}

class _SecondaryTabViewState extends State<SecondaryTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final TabBar secondaryTabBar = TabBar(
      controller: widget.tc,
      labelColor: Colors.blue,
      indicatorColor: Colors.blue,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2.0,
      isScrollable: false,
      unselectedLabelColor: Colors.grey,
      tabs: <Tab>[
        Tab(text: widget.tabKey + '0'),
        Tab(text: widget.tabKey + '1'),
        Tab(text: widget.tabKey + '2'),
        Tab(text: widget.tabKey + '3'),
        Tab(text: widget.tabKey + '4'),
      ],
    );
    return Column(
      children: <Widget>[
        secondaryTabBar,
        Expanded(
          child: TabBarView(
            controller: widget.tc,
            children: <Widget>[
              TabViewItem(Key(widget.tabKey + '0')),
              TabViewItem(Key(widget.tabKey + '1')),
              TabViewItem(Key(widget.tabKey + '2')),
              TabViewItem(Key(widget.tabKey + '3')),
              GridViewItem(Key(widget.tabKey + '4')),
              // CustomScrollView(
              //   physics: const AlwaysScrollableScrollPhysics(),
              //   slivers: <Widget>[
              //     SliverFillRemaining(
              //       child: Container(
              //         color: Colors.blue,
              //         child: const Text('tab4'),
              //         alignment: Alignment.center,
              //       ),
              //     )
              //   ],
              // ),
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TabViewItem extends StatefulWidget {
  const TabViewItem(this.tabKey);

  final Key tabKey;

  @override
  _TabViewItemState createState() => _TabViewItemState();
}

class _TabViewItemState extends State<TabViewItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Widget child = ExtendedVisibilityDetector(
      uniqueKey: widget.tabKey,
      child: GlowNotificationWidget(
        //margin: EdgeInsets.only(left: 190.0),
        ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext c, int i) {
              return Container(
                //decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 1.0)),
                alignment: Alignment.center,
                height: 60.0,
                width: double.infinity,
                //color: Colors.blue,
                child: Text(widget.tabKey.toString() + ': List$i'),
              );
            },
            itemCount: 100,
            padding: const EdgeInsets.all(0.0)),
        showGlowLeading: false,
      ),
    );

    return child;
  }

  @override
  bool get wantKeepAlive => true;
}

class CommonSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  CommonSliverPersistentHeaderDelegate(this.child, this.height);

  final Widget child;
  final double height;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(CommonSliverPersistentHeaderDelegate oldDelegate) {
    //print('shouldRebuild---------------');
    return oldDelegate != this;
  }
}

Future<bool> onRefresh() {
  return Future<bool>.delayed(const Duration(seconds: 1), () {
    return true;
  });
}

class GridViewItem extends StatefulWidget {
  const GridViewItem(this.tabKey);

  final Key tabKey;

  @override
  _GridViewItemState createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Widget child = ExtendedVisibilityDetector(
      uniqueKey: widget.tabKey,
      child: GlowNotificationWidget(
        //margin: EdgeInsets.only(left: 190.0),
        // ListView.builder(
        //   physics: const ClampingScrollPhysics(),
        //   itemBuilder: (BuildContext c, int i) {
        //     return Container(
        //       //decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 1.0)),
        //       alignment: Alignment.center,
        //       height: 60.0,
        //       width: double.infinity,
        //       //color: Colors.blue,
        //       child: Text(widget.tabKey.toString() + ': List$i'),
        //     );
        //   },
        //   itemCount: 100,
        //   padding: const EdgeInsets.all(0.0),
        // ),
        MasonryGridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return Tile(
              index: index,
              extent: (index % 5 + 1) * 100,
            );
          },
        ),
        showGlowLeading: false,
      ),
    );

    return child;
  }

  @override
  bool get wantKeepAlive => true;
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      color: backgroundColor ?? Colors.green[100],
      height: 100,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
