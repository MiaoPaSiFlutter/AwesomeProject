import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'styleWidgets/JdFloorStyle0901.dart';
import 'styleWidgets/JdFloorStyle0902.dart';
import 'styleWidgets/JdFloorStyle0903.dart';
import 'styleWidgets/JdFloorStyle0908.dart';
import 'styleWidgets/JdFloorStyle0909.dart';
import 'styleWidgets/JdFloorStyle0910.dart';
import 'styleWidgets/JdFloorStyle0911.dart';
import 'styleWidgets/JdFloorStyle0914.dart';

class HGCategoryPage extends StatefulWidget {
  final Map? itemObj;
  final int index;
  const HGCategoryPage({
    Key? key,
    this.itemObj,
    required this.index,
  }) : super(key: key);

  @override
  State createState() => _HGCategoryPageState();
}

class _HGCategoryPageState extends State<HGCategoryPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  List _floors = [];

  @override
  void initState() {
    super.initState();
    dPrint("HGCategoryPage ${widget.itemObj}");

    // WidgetsBinding.instance!.addPostFrameCallback((mag) {
    //   print("  页面渲染完毕");
    // });
    fetchListDatas();

    // widget.segVM.addListener(() {
    //   jumpTo(widget.segVM.selectIndex);
    // });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        _buildSegmentView(),
        Flexible(
          child: CustomScrollView(
            // controller: _scrollController,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  _buildFloorView,
                  childCount: _floors.length,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  /////SegmentView
  Widget _buildSegmentView() {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top + 44 + 35),
        const SizedBox(height: 40),
      ],
    );
  }

  ///构建普通楼层
  Widget _buildFloorView(BuildContext context, int index) {
    Map floor = _floors[index];
    String style = floor["style"];
    Widget child = Container();
    if (style == "0901") {
      child = JdFloorStyle0901(floor: floor);
    } else if (style == "0902") {
      child = JdFloorStyle0902(floor: floor);
    } else if (style == "0903") {
      child = JdFloorStyle0903(floor: floor);
    } else if (style == "0908") {
      child = JdFloorStyle0908(floor: floor);
    } else if (style == "0909") {
      child = JdFloorStyle0909(floor: floor);
    } else if (style == '0910') {
      child = JdFloorStyle0910(floor: floor);
    } else if (style == '0911') {
      child = JdFloorStyle0911(floor: floor);
    } else if (style == '0914') {
      child = JdFloorStyle0914(floor: floor);
    }
    return Container(
      child: Column(
        children: [
          // Text("data $style"),
          _createFloorItem(
            child,
            borderRadius: BorderRadius.circular(10),
            showSpaceBox: true,
          ),
        ],
      ),
    );
  }

  Widget _createFloorItem(
    Widget child, {
    BorderRadius? borderRadius = BorderRadius.zero,
    bool showSpaceBox = false,
  }) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(color: Colors.white, child: child),
        ),
        showSpaceBox ? const SizedBox(height: 10) : Container(),
      ],
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchListDatas();
  // }

  fetchListDatas() {
    Map parmrs = widget.itemObj ?? {};
    JdService.categoryHome(parmrs).then((resp) {
      Map pageOrgData = resp.jsonData;
      _floors = pageOrgData["floorList"] ?? [];
      setState(() {});
    });
  }
}
