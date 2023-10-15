/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-06 11:23:30
 * @LastEditors: TT
 * @LastEditTime: 2023-05-19 17:33:08
 */
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';

import '../module_index.dart';

class ExampleComBtnlessV extends CommonLessV {
  ExampleComBtnlessV({super.key});

  final List<NormalComBtnModel> list = [
    NormalComBtnModel(
      btnType: 1,
    ),
    NormalComBtnModel(
      cannerScale: 1,
      sureScale: 3,
    ),
    NormalComBtnModel(
      cannerScale: 1,
      sureScale: 2,
    ),
    NormalComBtnModel(),
    NormalComBtnModel(
      cannerScale: 2,
      sureScale: 1,
    ),
    NormalComBtnModel(
      cannerScale: 3,
      sureScale: 1,
    ),
    NormalComBtnModel(
      space: 0,
    ),
    NormalComBtnModel(
      spaceWidget: Container(
        width: 1,
        height: 20,
        margin: const EdgeInsets.symmetric(horizontal: 9),
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
      ),
    ),
    NormalComBtnModel(
      layoutType: 2,
      space: 6,
      radius: 4,
    ),
    NormalComBtnModel(
      layoutType: 2,
      spaceWidget: Container(
        height: 1,
        margin: const EdgeInsets.symmetric(vertical: 9),
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
      ),
    ),
    NormalComBtnModel(
      cannerWidget: Expanded(
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                HzyCommonColor().wbgblacktextcolor,
                HzyCommonColor().colefedf3,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(
              10.r,
            ),
          ),
          child: Text(
            LaunchIdConfig.and.tr,
            style: FontConfig().fontBold16White,
          ),
        ),
      ),
    )
  ];
  @override
  String? createAppBarTitleStr() => configNormalTitle();
  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = ListView(
      children: [
        ...List.generate(list.length, (index) {
          NormalComBtnModel comBtnModel = list[index];
          Widget body = HzySureAndCannerBtnWidget(
            cannerTitleColor: HzyCommonColor().wbgblacktextcolor,
            cannerBgColor: HzyCommonColor().whitebackgroundColor,
            sureBgColor: comBtnModel.sureBgColor,
            sureMsg: comBtnModel.sureMsg ?? LaunchIdConfig.sure.tr,
            sureWidget: comBtnModel.sureWidget,
            sureScale: comBtnModel.sureScale,
            sureTitleColor: comBtnModel.sureTitleColor,
            cannerMsg: comBtnModel.cannerMsg ?? LaunchIdConfig.canner.tr,
            cannerScale: comBtnModel.cannerScale,
            cannerWidget: comBtnModel.cannerWidget,
            fontSize: comBtnModel.fontSize,
            radius: comBtnModel.radius,
            height: comBtnModel.height,
            space: comBtnModel.space,
            spaceWidget: comBtnModel.spaceWidget,
            layoutType: comBtnModel.layoutType,
            btnType: comBtnModel.btnType,
            tapSure: () {
              showToastMsg("点击确认按钮");
            },
            tapCanner: () {
              showToastMsg("点击取消按钮");
            },
          );
          body = Column(
            children: [
              body,
              Gaps.vGap10,
            ],
          );
          return body;
        })
      ],
    );

    body = Padding(
      padding: EdgeInsets.all(20.w),
      child: body,
    );
    return body;
  }

  configNormalTitle() {
    HzyNormalItemModel itemModel = currentGetArguments();
    return itemModel.leftMsg;
  }
}
