/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-14 11:02:39
 * @LastEditors: TT
 * @LastEditTime: 2023-05-19 17:33:29
 */

import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';
import '../config/config_index.dart';

class MyTopToolItemModel {
  String? name;
  String? msg;
  String? path;
  int? type;
  TextStyle? style;
  MyTopToolItemModel({
    this.type = 0,
    this.msg,
    this.name,
    this.path,
    this.style,
  });
}

class MyTopToollessV extends CommonLessV {
  MyTopToollessV({super.key});
  @override
  bool get isNeedScaffol => false;

  final List<MyTopToolItemModel> list = [
    MyTopToolItemModel(
      name: LaunchIdConfig.my.tr + MyLaunchIdConfig.order.tr,
      path: "assets/images/my/dd.png",
      msg: "1个未付款订单",
      style: HzyTextStyle.fontRegular(
        size: 12,
        color: HzyNormalColorS.cole41335,
      ),
    ),
    MyTopToolItemModel(type: 1),
    MyTopToolItemModel(
      name: MyLaunchIdConfig.coupon.tr,
      path: "assets/images/my/yhq.png",
      msg: "27张优惠券",
      style: HzyTextStyle.fontRegular(
        size: 12,
        color: HzyCommonColor().col999999,
      ),
    ),
  ];

  final List<int> typeList = [0, 1, 0];

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = configToolWidget();
    return body;
  }

  @override
  double? configLayoutHeight() {
    return 50.h;
  }

  /// 创建工具栏
  configToolWidget() {
    Widget body = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        list.length,
        (index) => configToolItemWidget(
          myTopToolItemModel: list[index],
          index: index,
        ),
      ),
    );

    // body = Padding(
    //   padding: EdgeInsets.symmetric(vertical: 12.h),
    //   child: body,
    // );
    return body;
  }

  @override
  configBoxDecoreation() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      color: HzyCommonColor().whitebackgroundColor,
      boxShadow: [
        BoxShadow(
          color: HzyCommonColor().colc3c3c3.withOpacity(0.1),
          offset: const Offset(0, 0),
          blurRadius: 6.0,
          spreadRadius: 0,
        ),
      ],
    );
  }

  configToolItemWidget({
    required MyTopToolItemModel myTopToolItemModel,
    required int index,
  }) {
    Widget body = Container();

    if (myTopToolItemModel.type == 1) {
      body = DecoratedBox(
        decoration: BoxDecoration(color: HzyCommonColor().linecolor),
        child: const SizedBox(
          width: 0.5,
          height: 20,
        ),
      );
    } else {
      body = Text(
        myTopToolItemModel.name ?? "",
        style: HzyTextStyle.fontSemi(
          size: 16.sp,
          color: HzyCommonColor().wbgblacktextcolor,
        ),
      );

      body = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          body,
          Gaps.configvbox(height: 2.h),
          Text(
            myTopToolItemModel.msg ?? "",
            style: myTopToolItemModel.style,
          )
        ],
      );
      body = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          body,
          Stack(
            children: [
              Image.asset(
                myTopToolItemModel.path!,
                width: 40.w,
                height: 40.w,
              ),
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: ThemeTool.isdark() ? Colors.black38 : null,
                ),
              )
            ],
          )
        ],
      );
      body = Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: body,
      );

      body = Expanded(child: body);
    }

    return body;
  }
}
