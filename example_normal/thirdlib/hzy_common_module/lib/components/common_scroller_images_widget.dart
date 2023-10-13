/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-06-05 17:20:32
 * @LastEditors: TT
 * @LastEditTime: 2023-09-07 17:41:51
 */

import 'package:flutter/material.dart';
import 'common_extendeed_image_widget.dart';

import 'common_state.dart';
import '../models/image_normal_model.dart';
import 'common_widgets.dart';

class CommonScrollerImagesWidget extends StatefulWidget {
  const CommonScrollerImagesWidget({
    super.key,
    required this.list,
    this.tabController,
    this.type = 0,
    this.selectBorColor = Colors.white,
    this.borW = 2,
    this.border,
    this.borderRadius,
    this.normalBorColor,
    this.isMultiple = false,
    this.isCheckAll = false,
    this.radius = 8,
    this.normalSelect,
    this.selectTapCall,
  });

  /// 数据源
  final List<ImageNormalModel> list;
  // 0 边线 1 选中图标
  final int? type;

  /// 选中边线颜色
  final Color selectBorColor;

  /// 选中边线宽度
  final double borW;

  final Border? border;

  /// 未选中颜色
  final Color? normalBorColor;

  /// 控制器
  final TabController? tabController;

  /// 圆角
  final double radius;

  /// 自定义圆角
  final BorderRadius? borderRadius;

  /// 单选还是多选 默认单选
  final bool isMultiple;

  /// 是否全选
  final bool isCheckAll;

  /// 默认选中数据
  final List<ImageNormalModel>? normalSelect;

  /// 选中图片回调
  final Function(List<ImageNormalModel> selectList)? selectTapCall;
  @override
  State<StatefulWidget> createState() {
    return CommonScrollerImagesState();
  }
}

class CommonScrollerImagesState extends CommonState<CommonScrollerImagesWidget>
    with SingleTickerProviderStateMixin {
  @override
  bool get isNeedScaffol => false;
  @override
  bool get isNeedLayout => true;

  TabController? controller;

  int selectIndex = -1;
  List<ImageNormalModel> data = [];
  List<ImageNormalModel> selectImageS = [];
  double itemW = 0;
  double itemH = 0;
  @override
  void initState() {
    controller = widget.tabController ??
        TabController(
          length: widget.list.length,
          vsync: this,
        );

    for (var i = 0; i < widget.list.length; i++) {
      ImageNormalModel imageNormalModel = widget.list[i];
      imageNormalModel.subScriptStr = "$i";
      data.add(imageNormalModel);
    }
    if (widget.isCheckAll) {
      selectImageS.addAll(data);
    } else if (widget.normalSelect != null) {
      selectImageS.addAll(widget.normalSelect ?? []);
    }
    super.initState();
  }

  @override
  configBoxDecoreation() {
    return null;
  }

  @override
  Widget createBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    itemW = ((constraints?.maxWidth ?? 0) - 30) / 4;
    itemH = itemW * 1.4;
    Widget body = SizedBox(
      width: constraints?.maxWidth,
      child: TabBar(
        tabs: configTabBarTabs(
          constraints: constraints,
        ),
        isScrollable: true,
        controller: controller,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.zero,
        indicatorColor: Colors.white.withOpacity(0),
      ),
    );
    return body;
  }

  /// 创建所有itemS
  List<Widget> configTabBarTabs({BoxConstraints? constraints}) {
    List<Widget> list = [];
    for (var i = 0; i < widget.list.length; i++) {
      Widget body = configItemWidget(
        index: i,
        constraints: constraints,
      );
      list.add(
        body,
      );
    }
    return list;
  }

  /// 创建每个item
  configItemWidget({
    BoxConstraints? constraints,
    required int index,
  }) {
    Widget body = createImageBuilder(
      imageNormalModel: data[index],
      width: itemW,
      height: itemH,
      borderRadius: BorderRadius.circular(widget.radius),
      boxFit: BoxFit.fill,
      border: widget.type == 0
          ? (selectIndex == index
              ? (widget.border ??
                  Border.all(
                    width: widget.borW,
                    color: widget.selectBorColor,
                  ))
              : null)
          : null,
    );

    if (widget.type != 0) {
      body = Stack(
        children: [
          body,
          configCheckBoxWidget(
            index: index,
          ),
        ],
      );
    }
    body = Padding(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: body,
    );

    body = GestureDetector(
      onTap: () {
        configTapItem(index: index);
      },
      child: body,
    );
    return body;
  }

  /// 创建点击item
  configTapItem({
    required int index,
  }) {
    if (widget.type == 0 || !widget.isMultiple) {
      if (index != selectIndex) {
        selectImageS.clear();
        setState(() {
          selectIndex = index;
        });
        selectImageS.add(data[index]);
      }
    } else {
      if (selectImageS.contains(data[index])) {
        selectImageS.remove(data[index]);
      } else {
        selectImageS.add(data[index]);
      }
      if (widget.selectTapCall != null) {
        widget.selectTapCall!(selectImageS);
      }
      setState(() {});
    }
  }

  /// 创建勾选框
  configCheckBoxWidget({
    required int index,
  }) {
    bool isSelect = false;
    if (widget.isMultiple) {
      if (selectImageS.contains(data[index])) isSelect = true;
    } else {
      if (index == selectIndex) isSelect = true;
    }

    Widget body = configNormalCheckBoxWidget(
      isSelcet: isSelect,
      color: isSelect ? widget.selectBorColor : null,
    );
    body = Positioned(
      right: 5,
      top: 5,
      child: body,
    );
    return body;
  }

  /// 更新是否全选
  configUpdateIsCheckAll({bool isCheckAll = false}) {
    if (isCheckAll) {
      selectImageS.clear();
      selectImageS.addAll(data);
    } else {
      selectImageS.clear();
    }
    if (mounted) {
      setState(() {});
    }
  }
}
