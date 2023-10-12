/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-10 21:27:29
 * @LastEditors: TT
 * @LastEditTime: 2023-05-19 17:33:45
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../config/my_launch_id_config.dart';

class MyLaunchSettV extends CommonGetXWidget<MyLaunchSettC> {
  MyLaunchSettV({Key? key}) : super(key: key);

  /// 配置导航栏 标题
  @override
  String? createAppBarTitleStr() {
    return MyLaunchIdConfig.setLanguage.tr;
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Column(
      children: [
        ...List.generate(
          controller.list.length,
          (index) {
            HzyNormalItemModel itemModel = controller.list[index];
            itemModel.rightWidget = configRightCheckWidget(index: index);
            Widget body = configNormalDarkItemWidget(
              itemModel: itemModel,
              index: index,
              allNum: controller.list.length,
              onOtherTap: (HzyNormalItemModel itemModel) {
                controller.tapItem(index: index);
              },
            );
            return body;
          },
        )
      ],
    );
    return body;
  }

  /// 创建右边选中item
  configRightCheckWidget({required int index}) {
    return GetBuilder<MyLaunchSettC>(
      builder: (ct) {
        Color color = Colors.white.withOpacity(0);
        if (index == ct.selectIndex) {
          color = HzyCommonColor().colthemes;
        }
        Widget rightWidget = Icon(
          Icons.check,
          color: color,
        );
        return rightWidget;
      },
    );
  }

  /// 配置导航栏 返回按钮

  @override
  IconData? createLeadIcon() {
    return Icons.close;
  }

  /// 配置导航栏 右边按钮
  @override
  List<Widget>? createAppBaractions() {
    return [
      GetBuilder<MyLaunchSettC>(
        builder: (ct) {
          return HzyBtnWidget(
            text: LaunchIdConfig.done.tr,
            margin: EdgeInsets.only(
              right: 10.w,
              top: 8.w,
              bottom: 8.w,
            ),
            fontSize: 14.sp,
            height: 30,
            fontColor: ct.isCanTap
                ? HzyNormalColorS.colffffff
                : HzyCommonColor().colplacetextcolor,
            isFittedBox: false,
            padding: EdgeInsets.symmetric(
              horizontal: 5.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                4.r,
              ),
              color: ct.isCanTap
                  ? HzyCommonColor().colthemes
                  : HzyNormalColorS.coldadada,
            ),
            tapCall: () {
              controller.tapNavBtn();
            },
          );
        },
      )
    ];
  }
}

class MyLaunchSettC extends CommonGetXController {
  // --------- 属性 --------- //

  List<HzyNormalItemModel> list = [
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      leftMsg: "简体中文",
      isShowLine: true,
      rightType: 3,
      rightMsg: "zh_CN",
    ),
    HzyNormalItemModel(
      leftMsg: "English",
      rightType: 3,
      rightMsg: "en_US",
    ),
  ];

  int selectIndex = 99999;

  bool isCanTap = false;

  int oldLaunchStr = 99999;
  // --------- 生命周期  --------- //

  @override
  Future<bool> configWidgetRenderingCompleted() async {
    configNormalLaunch();
    return true;
  }
  // --------- 数据处理  --------- //

  /// 初始化 当前语言配置
  configNormalLaunch() {
    String lt = SpTool.getLaunchType();

    if (lt == "" || lt == "zh_CN") {
      selectIndex = 1;
    } else {
      selectIndex = 2;
    }
    oldLaunchStr = selectIndex;
    update();
  }

  // --------- 触发事件  --------- //

  tapItem({required int index}) {
    if (oldLaunchStr != index) {
      isCanTap = true;
    } else {
      isCanTap = false;
    }
    selectIndex = index;
    update();
  }

  /// 点击保存按钮
  tapNavBtn() {
    if (isCanTap) {
      String lt = "zh_CN";
      if (selectIndex == 2) {
        lt = "en_US";
      }
      oldLaunchStr = selectIndex;
      LaunchTool.changeLaunch(launchStr: lt);
    }
  }
}
