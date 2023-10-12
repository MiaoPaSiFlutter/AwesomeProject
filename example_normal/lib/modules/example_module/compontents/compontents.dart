/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-06 11:47:36
 * @LastEditors: TT
 * @LastEditTime: 2023-07-18 14:35:21
 */

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'example_more_btn_widget.dart';

/// 创建增减工具
configAddorSubtractWidget({
  required int type,
  required String ts,
  Function(int)? tapReduce,
  Function(int)? tapAdd,
}) {
  double itemH = 30;
  Widget body = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      HzyBtnWidget(
        btnLayoutType: BtnLayoutType.img,
        width: itemH,
        imageWidget: const Icon(
          Icons.remove,
          size: 15,
        ),
        tapCall: () {
          if (tapReduce != null) {
            tapReduce(type);
          }
        }, // ,
      ),
      Container(
        width: 0.5,
        color: HzyCommonColor().linecolor,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(
          ts,
          style: FontConfig.fontBold14Black,
        ),
      ),
      Container(
        width: 0.5,
        color: HzyCommonColor().linecolor,
      ),
      HzyBtnWidget(
        btnLayoutType: BtnLayoutType.img,
        width: itemH,
        imageWidget: const Icon(
          Icons.add,
          size: 15,
        ),
        tapCall: () {
          if (tapAdd != null) {
            tapAdd(type);
          }
        }, // ,
      ),
    ],
  );

  body = Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.r),
      border: Border.all(
        color: HzyCommonColor().linecolor,
        width: 0.5,
      ),
    ),
    height: itemH,
    child: body,
  );
  return body;
}

configBtnImageWidget({
  double? w = 40,
}) {
  Widget body = Image.asset(
    "assets/images/example/lol_vn.png",
    width: w,
  );
  return body;
}

configPopImage({
  AnimationController? doubleClickAnimationController,
  Uint8List? bytes,
  File? imagefile,
  String? assetPath,
  String? imageurl,
  bool isgesture = true,
}) {
  if (isgesture == true && (doubleClickAnimationController == null)) {
    isgesture = false;
  }
  showDig(
    context: Get.context!,
    widget: Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: isgesture == true ? 100 : 0,
          bottom: isgesture == true ? 100 : 0,
          child: CommonExtendedImageWidget.configImage(
            bytes: bytes,
            imageFile: imagefile,
            imageUrl: imageurl,
            doubleClickAnimationController: doubleClickAnimationController,
            isGesture: isgesture,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: CloseButton(
            color: Colors.white,
            onPressed: () {
              currentGoback();
            },
          ),
        )
      ],
    ),
  );
}

configStackMoreBtn({
  required Widget child,
  required dynamic Function(int) onTap,
}) {
  Widget body = Stack(
    children: [
      child,
      Positioned(
        right: 20.w,
        top: 20.w,
        child: ExampleMoreBtnWidget(
          onTap: (p0) {
            onTap(p0);
          },
        ),
      ),
    ],
  );
  return body;
}

/// 配置带有hero动画的图片加载器
configHeroNetImageWidget({
  String? url,
  double? width,
  double? height,
  int index = -1,
}) {
  Widget body = conFigNetWorkImage(
    url: url,
    fit: BoxFit.cover,
    width: width,
    height: height,
    loadradius: 15,
  );
  String heroStr = index != -1 ? "ImageHero$index" : (url ?? "tag");
  dPrint(heroStr);
  body = Hero(
    tag: heroStr,
    child: body,
  );
  return body;
}

/// 创建底部NavBarWidget
createBoxShaowBottomNavBarWidget({
  required Widget child,
  Color? color = const Color(0xff201e22),
  BoxDecoration? decoration,
  EdgeInsetsGeometry? padding = const EdgeInsets.symmetric(vertical: 10),
  EdgeInsetsGeometry? margin,
}) {
  return Container(
    padding: padding,
    margin: margin,
    decoration: decoration ??
        BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: HzyNormalColorS.colbfbfbf.withOpacity(0.6),
              offset: const Offset(0, 0),
              blurRadius: 10.0,
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(10.r),
        ),
    child: child,
  );
}

/// 创建 图片设置 底部按钮
Widget createBottomNavBarWidget({
  required String title,
  String? suretitle,
  Function? tapCanner,
  Function? tapSure,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          if (tapCanner != null) {
            tapCanner();
          } else {
            currentGoback();
          }
        },
        icon: const Icon(
          Icons.close,
          color: HzyNormalColorS.colffffff,
        ),
      ),
      Expanded(
        child: Text(
          title,
          style: HzyTextStyle.fontBold(
            size: 16,
            color: HzyNormalColorS.colffffff,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
      InkWell(
        onTap: () {
          if (tapSure != null) {
            tapSure();
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Text(
            suretitle ?? "切换",
            style: HzyTextStyle.fontBold(
              size: 14,
              color: HzyNormalColorS.colffffff,
            ),
          ),
        ),
      )
    ],
  );
}

// 创建图片详情底部模块
createTuchongImageDetailBottomWidget({
  String? titile,
  String? suretitle,
  Function? tapSure,
  Function? tapcanner,
  double? bottom,
  double? right = 10,
  double? left = 10,
  bool isPositioned = true,
  Color? color = const Color(0xff201e22),
}) {
  Widget body = createBoxShaowBottomNavBarWidget(
    child: createBottomNavBarWidget(
      title: titile ?? "",
      tapSure: () {
        if (tapSure != null) {
          tapSure();
        }
      },
      suretitle: suretitle,
      tapCanner: () {
        if (tapcanner != null) {
          tapcanner();
        }
      },
    ),
    color: color,
  );
  body = isPositioned
      ? Positioned(
          bottom: bottom ??
              (SizeMacro.bottomBarHeight == 0 ? 10 : SizeMacro.bottomBarHeight),
          right: right,
          left: left,
          child: body,
        )
      : body;
  return body;
}
