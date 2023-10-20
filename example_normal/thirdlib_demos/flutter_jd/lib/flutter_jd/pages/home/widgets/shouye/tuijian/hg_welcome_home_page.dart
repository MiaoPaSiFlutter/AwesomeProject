import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'package:provider/provider.dart';

import '../../../vm/home_viewmodel.dart';
import '../../recommond/home_cell_recommend.dart';
import 'mpsf_recommond_list_vm.dart';
import 'styleWidgets/JdFloorStyleappcenter.dart';
import 'styleWidgets/JdFloorStylebanner.dart';
import 'styleWidgets/JdFloorStylehybrid.dart';

///首页
class HGWelcomeHomePage extends StatefulWidget {
  final Map? itemObj;
  const HGWelcomeHomePage({Key? key, this.itemObj}) : super(key: key);

  @override
  State createState() => _HGWelcomeHomePage();
}

class _HGWelcomeHomePage extends State<HGWelcomeHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final ScrollController _scrollController = ScrollController();
  List _floors = [];

  var listVM = MpsfRecommondListVM();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        renderTopSafeArea(),
        renderMainFloorView(),
        // SliverPadding(
        //   padding: const EdgeInsets.all(5),
        //   sliver: SliverList(
        //     delegate: SliverChildBuilderDelegate(
        //       childCount: 3,
        //       _buildRecommendFloorView,
        //     ),
        //   ),
        // )
      ],
    );
  }

  @override
  void initState() {
    _floors = widget.itemObj?["floorList"] ?? [];
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((mag) {
      print("  页面渲染完毕");
      //监听滚动事件，打印滚动位置
      _scrollController.addListener(() {
        // double pixels = _scrollController.position.pixels;
        // double navigationBarH = MediaQuery.of(context).padding.top + 44 + 40;
        // double offSet = navigationBarH - pixels;
        // print("pixels $pixels  offSet $offSet");
        // context.read<HomeViewModel>().updateCSD(segmentViewOffSet_: offSet);
        // // Provider.of<HomeViewModel>(context,listen: false).updateSegmentViewOffSet(offSet);
        // if (_scrollController.position.pixels ==
        //     _scrollController.position.maxScrollExtent) {
        //   if (!listVM.loading && listVM.hasMore) {
        //     _fetchRecommondData();
        //   }
        // }
      });
    });
  }

  /// - 渲染顶部安全区域
  Widget renderTopSafeArea() {
    return Consumer<HomeViewModel>(builder: (context, model, widget) {
      final appBarHeight = model.appBarHeight;
      final segmentHeight = model.segmentHeight;

      return SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: 1,
          (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.blue),
              ),
              height: appBarHeight + segmentHeight,
            );
          },
        ),
      );
    });
  }

  /// - 渲染中间楼层
  Widget renderMainFloorView() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: _floors.length,
        _buildFloorView,
      ),
    );
  }

  ///构建普通楼层
  Widget _buildFloorView(BuildContext context, int index) {
    Map floor = _floors[index];
    String type = floor["type"];
    if (type == "banner") {
      return JdFloorStylebanner(floor: floor);
    }
    if (type == "appcenter") {
      return JdFloorStyleappcenter(floor: floor);
    }
    if (type == "hybrid") {
      return JdFloorStylehybrid(floor: floor);
    }
    return Container(child: Text(type));
  }

  ///构建推荐楼层
  Widget _buildRecommendFloorView(BuildContext context, int index) {
    if (index == 0) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.transparent),
        ),
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        alignment: Alignment.center,
        child: const Text('为你推荐', style: TextStyle(fontSize: 15)),
      );
    }
    if (index == 1) {
      return HomeCellRecommend(listVM.datas);
    }
    if (index == 2) {
      String text = "";
      if (listVM.loading) {
        text = "加载中...";
      } else {
        text = "加载中...";
        if (!listVM.hasMore) {
          text = "没有更多了";
        }
      }
      return Container(alignment: Alignment.center, child: Text(text));
    }
    return Container(
      alignment: Alignment.center,
      color: Colors.cyan[100 * (index % 9)],
      child: Text('grid item $index'),
    );
  }

  // 推荐数据
  Future<void> _fetchRecommondData({bool isRefresh = false}) async {
    if (listVM.loading) {
      dPrint("正在请求第 ${listVM.page} 页数据。。。 ");
      return;
    }
    if (isRefresh) {
      listVM.page = 1;
    } else {
      listVM.page++;
    }

    ///请求---开始
    listVM.loading = true;
    setState(() {});
    MpsfResponse resp = await JdService.uniformRecommend(listVM.page);
    Map result = resp.jsonData;
    listVM.dealDatas(result);

    ///请求---结束
    listVM.loading = false;
    setState(() {});
  }
}
