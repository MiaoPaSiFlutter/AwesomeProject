/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-06-05 16:51:38
 * @LastEditors: TT
 * @LastEditTime: 2023-09-07 17:39:44
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';
import '../config/config_index.dart';
import '../utils/screenutil_tools.dart';
import '../utils/utils.dart';
import '../models/image_normal_model.dart';
import 'common_state.dart';
import 'common_scroller_images_widget.dart';
import 'common_widgets.dart';

class CommonPopSelectImageWidget extends StatefulWidget {
  const CommonPopSelectImageWidget({
    super.key,
    required this.list,
    this.busiType = 1,
    this.type = 1,
    this.normalSelect = -1,
    this.isMultiple = true,
    this.tapDoCall,
  });

  /// 整体功能类型
  /// 0 分享好友
  /// 1 保存相册
  /// 2 收藏
  final int busiType;

  /// 单选还是多选 默认单选
  final bool isMultiple;

  /// 数据源
  final List<ImageNormalModel> list;

  /// 0 边线 1 选中图标
  final int? type;

  /// 默认选中下标
  final int normalSelect;

  /// 点击完成按钮
  final Function(List<ImageNormalModel>)? tapDoCall;
  @override
  State<StatefulWidget> createState() {
    return CommonSelectImageState();
  }
}

class CommonSelectImageState extends CommonState<CommonPopSelectImageWidget> {
  @override
  bool get isNeedScaffol => false;
  @override
  bool get isNeedLayout => true;

  /// 配置选择的图片
  List<ImageNormalModel> selectImages = [];

  /// 滚动图片key
  GlobalKey<CommonScrollerImagesState> scrollKey = GlobalKey();

  /// 是否选择全部
  bool isCheckAll = false;

  @override
  void initState() {
    super.initState();
    if (widget.normalSelect >= 0 && widget.normalSelect < widget.list.length) {
      selectImages.add(widget.list[widget.normalSelect]);
      if (widget.normalSelect == 0 && widget.list.length == 1) {
        isCheckAll = true;
      }
    }
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
    Widget body = configTopTitleWidget();
    body = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Gaps.vGap5,
        body,
        configScrollerImageListWidget(),
        configBottomToolWidget(),
        Gaps.configvbox(
          height: configSafeBottomHeight(),
        ),
      ],
    );
    body = Container(
      width: SizeMacro.screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r),
        ),
      ),
      child: body,
    );
    return body;
  }

  /// 创建顶部标题
  configTopTitleWidget() {
    Widget body = Text(
      "已选择${selectImages.length}张图片",
      style: FontConfig.fontBold14Black,
    );
    body = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Gaps.hGap40,
        body,
        createNormalCloseBtnWidget(
          context: context,
          size: 20,
          isPosition: false,
        )
      ],
    );
    return body;
  }

  /// 创建滚动图片视图
  configScrollerImageListWidget() {
    Widget body = CommonScrollerImagesWidget(
      key: scrollKey,
      list: widget.list,
      type: widget.type,
      normalSelect: selectImages,
      isMultiple: widget.isMultiple,
      selectBorColor: HzyCommonColor().colthemes,
      selectTapCall: (selectList) {
        setState(() {
          selectImages = selectList;
          if (selectList.length == widget.list.length) {
            isCheckAll = true;
          } else {
            if (isCheckAll == true) {
              isCheckAll = false;
            }
          }
        });
      },
    );

    body = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: body,
    );
    return body;
  }

  /// 创建通用底部工具
  configBottomToolWidget() {
    Widget body = Container();
    body = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (widget.type == 0 || widget.isMultiple == false)
            ? Container()
            : HzyBtnWidget(
                btnLayoutType: BtnLayoutType.letfImg,
                imageWidget: configNormalCheckBoxWidget(
                  isSelcet: isCheckAll,
                  color: isCheckAll
                      ? HzyCommonColor().colthemes
                      : HzyCommonColor().colplacetextcolor,
                ),
                text: LaunchIdConfig.selectAll.tr,
                margin: EdgeInsets.only(
                  left: 20.w,
                ),
                textStyle: isCheckAll
                    ? FontConfig.fontBold14Black
                    : FontConfig.fontMedium14PlaceColor,
                tapCall: () {
                  tapBottomAllinBtn();
                },
              ),
        HzyBtnWidget(
          text: widget.busiType == 0
              ? LaunchIdConfig.share.tr
              : widget.busiType == 1
                  ? LaunchIdConfig.save.tr
                  : LaunchIdConfig.collection.tr,
          fontColor: selectImages.isNotEmpty
              ? HzyNormalColorS.colffffff
              : HzyCommonColor().colplacetextcolor,
          width: 60,
          fontSize: 14.sp,
          decoration: BoxDecoration(
            color: selectImages.isNotEmpty
                ? HzyCommonColor().colthemes
                : HzyNormalColorS.coldadada,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 30,
          margin: EdgeInsets.only(right: 20.w),
          tapCall: () {
            if (selectImages.isNotEmpty && widget.tapDoCall != null) {
              widget.tapDoCall!(selectImages);
            }
          },
        ),
      ],
    );
    return body;
  }

  /// 点击底部全选按钮
  tapBottomAllinBtn() {
    setState(() {
      isCheckAll = !isCheckAll;
      selectImages = widget.list;
    });
    scrollKey.currentState?.configUpdateIsCheckAll(
      isCheckAll: isCheckAll,
    );
  }
}
