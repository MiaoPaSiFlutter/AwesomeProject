import 'dart:math';

import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

import '../mine_view.dart';
import 'mine_recommond_page.dart';
import 'mine_home_channel_cell.dart';
import 'mine_order_id_floor_cell.dart';
import 'mine_sortIcon_cell.dart';
import 'mine_toolIcon_cell.dart';
import 'mine_userinfo_cell.dart';
import 'mine_walletId_floor_cell.dart';
import 'mine_wodeguanzhu_cell.dart';
import 'mine_wodezhuanshu_cell.dart';

class MineMainHomeView extends StatefulWidget {
  const MineMainHomeView({super.key});

  @override
  _MineMainHomeViewState createState() => _MineMainHomeViewState();
}

class _MineMainHomeViewState extends State<MineMainHomeView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late final TabController primaryTC;
  final GlobalKey<ExtendedNestedScrollViewState> _key =
      GlobalKey<ExtendedNestedScrollViewState>();
  final int _length2 = 50;
  DateTime lastRefreshTime = DateTime.now();

  final controller = Get.put(MineController());

  ///TabBar height
  double get tabBarHeight => 44;

  ///NavigationBar height
  double get navigationBarHeight =>
      MediaQuery.of(context).padding.top + kToolbarHeight;

  ///pinned SliverAppBar height in header
  double get pinnedHeaderHeight => navigationBarHeight + tabBarHeight;

  @override
  void initState() {
    super.initState();
    primaryTC = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //监听外部控制器的滚动
      if (_key.currentState?.outerController != null) {
        // print("object1");
        _key.currentState?.outerController.addListener(() {
          double? offset =
              _key.currentState?.outerController.position.pixels ?? 0;
          // print("offset:$offset");
          double alpha = offset / navigationBarHeight;
          if (alpha < 0) {
            alpha = 0;
          } else if (alpha > 1) {
            alpha = 1;
          }
          controller.appBarAlpha.value = alpha;
          // _naviKey.currentState?.updateAppBarOpacity(alpha);

          // if (scrollViewController.position.pixels > 88) {
          //   setState(() {
          //     showSliverAppBar = true;
          //   });
          // } else {
          //   setState(() {
          //     showSliverAppBar = false;
          //   });
          // }
        });
      } else {
        // print("object2");
      }
    });
  }

  @override
  void dispose() {
    primaryTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        _buildScaffoldBody(),
        const CurrentNavigationBar(),
      ],
    );
  }

  Widget _buildScaffoldBody() {
    return PullToRefreshNotification(
      color: Colors.blue,
      onRefresh: () => Future<bool>.delayed(const Duration(seconds: 1), () {
        setState(() {
          lastRefreshTime = DateTime.now();
        });
        return true;
      }),
      maxDragOffset: maxDragOffset,
      child: GlowNotificationWidget(
        ExtendedNestedScrollView(
          key: _key,
          headerSliverBuilder: (BuildContext c, bool f) {
            return <Widget>[
              PullToRefreshContainer(
                (PullToRefreshScrollNotificationInfo? info) {
                  return SliverToBoxAdapter(
                    child: JdPullToRefreshHeader(info, lastRefreshTime),
                  );
                },
              ),
              SliverPersistentHeader(
                pinned: false, //
                delegate: MySliverDelegate(
                  minHeight: navigationBarHeight,
                  maxHeight: navigationBarHeight,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      // border: Border.all(color: Colors.red, width: 1),
                    ),
                    child: Column(
                      children: [
                        Expanded(child: Container()),
                        const SizedBox(
                          height: kToolbarHeight,
                          child: Center(
                            child: ListTile(
                              leading: Text("Item SliverPersistentHeader"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GetBuilder<MineController>(builder: (controller) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((content, index) {
                    return FloorViewWrap(floor: controller.listDatas[index]);
                  }, childCount: controller.listDatas.length),
                );
              }),
              SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    return ListTile(leading: Text("Item $index"));
                  },
                  childCount: 4,
                ),
                itemExtent: 50,
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  height: 200,
                  child: const Text('other things'),
                ),
              ),
              //TabBar放在headerSliver中，放在body中会出现RenderFlex overflowed 报错。
              SliverToBoxAdapter(
                child: PreferredSize(
                  preferredSize: Size(double.infinity, tabBarHeight),
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
                ),
              ),
            ];
          },
          //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
          pinnedHeaderSliverHeightBuilder: () {
            return pinnedHeaderHeight;
          },
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: TabBarView(
            controller: primaryTC,
            children: <Widget>[
              const HomeArticlesListPage(
                uniqueKey: PageStorageKey<String>('Tab0'),
              ),
              // ListView.builder(
              //   //store Page state
              //   key: const PageStorageKey<String>('Tab0'),
              //   physics: const ClampingScrollPhysics(),
              //   itemBuilder: (BuildContext c, int i) {
              //     return Container(
              //       alignment: Alignment.center,
              //       height: 60.0,
              //       child: Text(
              //         '${const Key('Tab0')}: ListView$i of $_length1',
              //       ),
              //     );
              //   },
              //   itemCount: _length1,
              //   padding: const EdgeInsets.all(0.0),
              // ),
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
    );
  }
}

class MySliverDelegate extends SliverPersistentHeaderDelegate {
  MySliverDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight; //最小高度
  final double maxHeight; //最大高度
  final Widget child; //子Widget布局

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override //是否需要重建
  bool shouldRebuild(MySliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class FloorViewWrap extends StatelessWidget {
  final Map? floor;

  FloorViewWrap({Key? key, this.floor}) : super(key: key);

  final controller = Get.put(MineController());

  @override
  Widget build(BuildContext context) {
    return _cellViewBuilder(context);
  }

  Widget _cellViewBuilder(context) {
    if (floor == null) {
      return Container();
    }
    String? refId = floor!["refId"];
    Widget contentWidget = Container();
    if (refId == "userimage") {
      contentWidget = MineUserinfoCell(floor: floor);
    } else if (refId == "dingdanchaxun") {
      contentWidget = MineOrderIdFloorCell(floor: floor);
    } else if (refId == "wodeqianbao") {
      contentWidget = MineWalletIdFloorCell(floor: floor);
    } else if (refId == "gameIcon") {
      contentWidget = MineSortIconCell(floor: floor);
    } else if (refId == "toolIcon") {
      contentWidget = MineToolIconCell(floor: floor);
    } else if (refId == "wodeguanzhu") {
      contentWidget = MineWodeguanzhuCell(floor: floor);
    } else if (refId == "wodezhuanshu") {
      contentWidget = MineWodezhuanshuCell(floor: floor);
    } else if (refId == "homeChannel") {
      contentWidget = MineHomeChannelCell(floor: floor);
    } else {
      return const SizedBox();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(child: contentWidget),
    );
  }
}

class CurrentNavigationBar extends StatefulWidget {
  const CurrentNavigationBar({Key? key}) : super(key: key);

  @override
  State<CurrentNavigationBar> createState() => _CurrentNavigationBarState();
}

class _CurrentNavigationBarState extends State<CurrentNavigationBar> {
  final controller = Get.put(MineController());

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;

    return SizedBox(
      height: pinnedHeaderHeight,
      child: Stack(
        children: [
          Obx(
            () => Container(
              color: Colors.white.withOpacity(controller.appBarAlpha.value),
            ),
          ),
          Column(
            children: [
              Container(
                height: statusBarHeight,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        // currentToPage(MyPageId.ACCOUNTSET);
                      },
                    ),
                    InkWell(
                      child: const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.message,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        // currentToPage(MyPageId.ACCOUNTSET);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
