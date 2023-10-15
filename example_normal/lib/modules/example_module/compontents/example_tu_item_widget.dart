/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-07-18 14:15:48
 * @LastEditors: TT
 * @LastEditTime: 2023-07-20 08:42:56
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../models/tu_chong_model.dart';
import 'example_tu_item_image_widget.dart';
import 'example_tu_tags_widget.dart';

class ExampleTuItemlessV extends CommonLessV {
  ExampleTuItemlessV({
    super.key,
    required this.tuChongItem,
    this.tapOneKey,
  });
  final TuChongItem tuChongItem;
  final Function(TuChongItem tuChongItem)? tapOneKey;

  @override
  bool get isNeedScaffol => false;
  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        configItemuseInfo(),
        Gaps.vGap10,
        configTagsWidget(),
        Gaps.vGap10,
        configImageItemWidget(),
      ],
    );
    body = Container(
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        top: 10.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.w,
        horizontal: 12.w,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: HzyCommonColor().whitebackgroundColor,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        boxShadow: [
          configShadow(),
        ],
      ),
      child: body,
    );
    return body;
  }

  /// 配置用户信息
  configItemuseInfo() {
    Widget body = configUserImageheaderWidget();
    body = Row(
      children: [
        body,
        Gaps.hGap10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tuChongItem.site?.name ?? "火之夜",
                style: FontConfig().fontBold16Black,
              ),
              Text(
                tuChongItem.site?.description ?? LaunchIdConfig.solg.tr,
                style: FontConfig().fontMedium12LightGrey,
              )
            ],
          ),
        ),
        HzyBtnWidget(
          text: "一键享用",
          fontSize: 10,
          textStyle: HzyTextStyle.fontBold(
            size: 10,
            color: HzyNormalColorS.colfe58a1,
          ),
          height: null,
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 7,
          ),
          tapCall: () {
            if (tapOneKey != null) {
              tapOneKey!(tuChongItem);
            }
          },
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: HzyNormalColorS.colfe58a1,
              width: 0.5.w,
            ),
          ),
        )
      ],
    );
    return body;
  }

  /// 配置用户头像
  configUserImageheaderWidget() {
    Widget body = Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: HzyNormalColorS.getRandomColor(),
        borderRadius: BorderRadius.circular(25),
      ),
    );
    body = conFigNetWorkImage(
      url: tuChongItem.avatarUrl,
      width: 50,
      height: 50,
      borderRadius: BorderRadius.circular(50),
    );
    body = Container(
      decoration: BoxDecoration(
        boxShadow: [
          configThemeShadow(
            opacity: 0.4,
          ),
        ],
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: body,
    );
    return body;
  }

  /// 创建tags
  configTagsWidget() {
    Widget body = ExampleTuTagsWidget(
      tuChongItem: tuChongItem,
    );
    return body;
  }

  /// 配置九宫格
  configImageItemWidget() {
    Widget body = ExampleTuItmeImagelessV(
      tuChongItem: tuChongItem,
    );
    return body;
  }

  configToolWidgets() {
    Widget body = const Row(
      children: [
        HzyBtnWidget(
          btnLayoutType: BtnLayoutType.letfImg,
          imageWidget: Icon(
            Icons.public,
          ),
          text: "发布",
        ),
        HzyBtnWidget(
          btnLayoutType: BtnLayoutType.letfImg,
          imageWidget: Icon(
            Icons.public,
          ),
          text: "喜欢",
        ),
        HzyBtnWidget(
          btnLayoutType: BtnLayoutType.letfImg,
          imageWidget: Icon(
            Icons.public,
          ),
          text: "分享",
        ),
      ],
    );
    return body;
  }
}
