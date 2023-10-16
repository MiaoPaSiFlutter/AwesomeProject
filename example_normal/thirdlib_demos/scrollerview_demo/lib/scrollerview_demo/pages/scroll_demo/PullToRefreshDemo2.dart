// ignore_for_file: unnecessary_cast

import 'dart:async';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

import 'push_to_refresh_header.dart';

class PullToRefreshDemo2 extends StatefulWidget {
  const PullToRefreshDemo2({super.key});

  @override
  _PullToRefreshOuterDemoState createState() => _PullToRefreshOuterDemoState();
}

class _PullToRefreshOuterDemoState extends State<PullToRefreshDemo2>
    with TickerProviderStateMixin {
  late final TabController primaryTC;
  int _length1 = 50;
  final int _length2 = 50;
  DateTime lastRefreshTime = DateTime.now();

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
    return PullToRefreshNotification(
      color: Colors.blue,
      onRefresh: () => Future<bool>.delayed(const Duration(seconds: 1), () {
        setState(() {
          _length1 += 10;
          lastRefreshTime = DateTime.now();
        });
        return true;
      }),
      maxDragOffset: maxDragOffset,
      child: GlowNotificationWidget(
        ExtendedNestedScrollView(
          headerSliverBuilder: (BuildContext c, bool f) {
            return <Widget>[
              const SliverAppBar(
                pinned: true,
                title: Text('pull to refresh in header'),
              ),
              PullToRefreshContainer(
                (PullToRefreshScrollNotificationInfo? info) {
                  return SliverToBoxAdapter(
                    child: PullToRefreshHeader(info, lastRefreshTime),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  height: 200,
                  child: const Text('other things1'),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.black,
                  alignment: Alignment.center,
                  height: 200,
                  child: const Text('other things2'),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  height: 400,
                  child: const Text('other things3'),
                ),
              ),
              SliverToBoxAdapter(
                child: TabBar(
                  controller: primaryTC,
                  labelColor: Colors.blue,
                  indicatorColor: Colors.blue,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2.0,
                  isScrollable: false,
                  unselectedLabelColor: Colors.grey,
                  tabs: const <Tab>[Tab(text: 'Tab0'), Tab(text: 'Tab1')],
                ),
              )
            ];
          },
          //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
          pinnedHeaderSliverHeightBuilder: () {
            return pinnedHeaderHeight;
          },
          body: Column(
            children: <Widget>[
              Expanded(
                child: TabBarView(
                  controller: primaryTC,
                  children: <Widget>[
                    ListView.builder(
                      //store Page state
                      key: const PageStorageKey<String>('Tab0'),
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext c, int i) {
                        return Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          child: Text(
                            '${const Key('Tab0')}: ListView$i of $_length1',
                          ),
                        );
                      },
                      itemCount: _length1,
                      padding: const EdgeInsets.all(0.0),
                    ),
                    ListView.builder(
                      //store Page state
                      key: const PageStorageKey<String>('Tab1'),
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext c, int i) {
                        return Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          child: Text(
                            '${const Key('Tab1')}: ListView$i of $_length2',
                          ),
                        );
                      },
                      itemCount: _length2,
                      padding: const EdgeInsets.all(0.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
