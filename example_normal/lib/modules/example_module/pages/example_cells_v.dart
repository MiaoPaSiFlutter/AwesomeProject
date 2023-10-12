/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-03 16:28:50
 * @LastEditors: TT
 * @LastEditTime: 2023-05-19 17:33:05
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../my_module/module_index.dart';

class ExampleCellsV extends CommonGetXWidget<ExampleCellsC> {
  ExampleCellsV({Key? key}) : super(key: key);
  @override
  ExampleCellsC get controller => Get.put(ExampleCellsC());
  @override
  String? createAppBarTitleStr() => controller.title.value;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Container();
    body = ListView(
      children: List.generate(
        controller.list.length,
        (index) {
          HzyNormalItemModel itemModel = controller.list[index];
          itemModel.leftMsg ??= LaunchIdConfig.solgleft.tr;
          itemModel.rightMsg = LaunchIdConfig.solgright.tr;
          Widget body = configNormalDarkItemWidget(
            itemModel: itemModel,
            onOtherTap: (_) {
              showToastMsg("我是其他事件触发的");
            },
          );
          return body;
        },
      ),
    );
    return body;
  }
}

class ExampleCellsC extends CommonGetXController {
  // --------- 属性 --------- //
  Rx<String?> title = "".obs;
  List<HzyNormalItemModel> list = [
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      leftMsg: """
单元格整体样式:
column(
  child:[
    row(
      child: [
        leftWidget,
        rightWidget,
      ]
    ),
    lineWidget
  ]
)""",
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      leftMsg: """
* 左边样式:
* 1: 左边文字
* 2: 左边图片
* 3: 左边图片 + 左边文字
* 4: 自定义样式""",
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      isShowLine: true,
    ),
    HzyNormalItemModel(
      leftType: 2,
      leftImagePath: "assets/images/tabbar/icon_fw_nor.png",
      isShowLine: true,
    ),
    HzyNormalItemModel(
      leftType: 3,
      leftImagePath: "assets/images/tabbar/icon_fw_nor.png",
    ),
    HzyNormalItemModel(
      leftType: 3,
      isShowLine: true,
      leftImageWidget: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: HzyCommonColor().backgroudgrey,
          borderRadius: BorderRadius.circular(
            20.r,
          ),
        ),
      ),
    ),
    HzyNormalItemModel(
      leftWidget: Container(
        decoration: BoxDecoration(
          color: HzyNormalColorS.getRandomColor(),
        ),
        child: Text(
          "我是自定义左边视图",
          style: FontConfig.fontBold14Black,
        ),
      ),
      isShowLine: true,
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      leftMsg: """
* 右边样式:
* 1: 右边图片
* 2: 右边文字
* 3: 右边文字 + 右边图片
* 4: 自定义样式""",
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      rightType: 1,
    ),
    HzyNormalItemModel(
      rightType: 2,
    ),
    HzyNormalItemModel(
      rightType: 3,
    ),
    HzyNormalItemModel(
      rightType: 4,
      rightWidget: Container(
        decoration: BoxDecoration(
          color: HzyNormalColorS.getRandomColor(),
        ),
        child: Text(
          "我是自定义右边视图",
          style: FontConfig.fontBold14Black,
        ),
      ),
      isShowLine: true,
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      leftMsg: """
* 细线的样式
自定义细线
整体装饰器
背景颜色
高度
外边距
内边距""",
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      isShowLine: true,
      lineWidget: Text(
        "我是自定义细线",
        style: FontConfig.fontBold10Black,
      ),
    ),
    HzyNormalItemModel(
      isShowLine: true,
      lineHeight: 10.w,
      lineDecoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
    HzyNormalItemModel(
      isShowLine: true,
      lineColor: Colors.black,
    ),
    HzyNormalItemModel(
      isShowLine: true,
      lineHeight: 10.w,
    ),
    HzyNormalItemModel(
      isShowLine: true,
      height: 2.w,
      margin: EdgeInsets.all(20.w),
    ),
    HzyNormalItemModel(
      isShowLine: true,
      height: 2.w,
      padding: EdgeInsets.all(20.w),
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      leftMsg: """
可配置单元格为占位符,
可以设置
整体装饰器
背景颜色
圆角
以及高度""",
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: HzyCommonColor().colthemes,
      height: 50,
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: HzyNormalColorS.getRandomColor(),
      borderRadius: BorderRadius.circular(30.r),
      height: 30,
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      height: 30,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      leftMsg: """
上面说的单元格包含的组件,
下面我们说一下整体的样式""",
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      leftMsg: "1.设置外边距",
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      margin: EdgeInsets.all(20.w),
    ),
    HzyNormalItemModel(
      leftMsg: "2.设置内边距",
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      padding: EdgeInsets.all(20.w),
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      leftMsg: "3.修改圆角",
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.r),
        topRight: Radius.circular(10.r),
      ),
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10.r),
        bottomRight: Radius.circular(10.r),
      ),
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(50.r),
        topRight: Radius.circular(50.r),
      ),
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50.r),
        topLeft: Radius.circular(50.r),
      ),
    ),
    HzyNormalItemModel(
      leftMsg: "4.修改左右布局 分布样式",
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      rightType: 1,
      mainAxisAlignment: MainAxisAlignment.start,
    ),
    HzyNormalItemModel(
      rightType: 1,
      mainAxisAlignment: MainAxisAlignment.center,
    ),
    HzyNormalItemModel(
      rightType: 1,
      mainAxisAlignment: MainAxisAlignment.end,
    ),
    HzyNormalItemModel(
      rightType: 1,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    ),
    HzyNormalItemModel(
      rightType: 1,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    ),
    HzyNormalItemModel(
      rightType: 1,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      leftMsg: "5.修改装饰器",
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          30.r,
        ),
        boxShadow: [
          configShadow(),
        ],
        gradient: LinearGradient(
          colors: [
            HzyCommonColor().whitebackgroundColor,
            HzyCommonColor().col000000,
          ],
        ),
      ),
    ),
    HzyNormalItemModel(
      leftMsg: "6.点击触发事件",
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: Colors.white.withOpacity(0),
    ),
    HzyNormalItemModel(
      isCanTap: true,
      leftMsg: "路由跳转",
      tapType: 1,
      router: MyModuleRouterS.myGeneral,
    ),
    HzyNormalItemModel(
      isCanTap: true,
      leftMsg: "其他事件",
      tapType: 2,
    ),
  ];
  // --------- 生命周期  --------- //
  @override
  void onInit() {
    super.onInit();
    configNormalData();
  }

  // --------- 数据处理  --------- //
  configNormalData() {
    HzyNormalItemModel itemModel = currentGetArguments();
    title.value = itemModel.leftMsg;
  }
  // --------- 触发事件  --------- //
}
