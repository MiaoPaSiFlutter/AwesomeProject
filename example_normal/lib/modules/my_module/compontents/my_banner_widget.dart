/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-30 20:48:33
 * @LastEditors: TT
 * @LastEditTime: 2023-05-04 14:44:32
 */

import 'dart:async';

import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';
import 'my_banner_bottom_widget.dart';

class MyBannerPage extends StatefulWidget {
  final List<String> bannerList;

  const MyBannerPage({super.key, required this.bannerList});
  @override
  State<StatefulWidget> createState() {
    return MyBannerState();
  }
}

class MyBannerState extends CommonState<MyBannerPage> {
  int selectIndex = 0;

  @override
  bool get isNeedScaffol => false;

  GlobalKey<MyBannerBottomWidgete> globalKey = GlobalKey();

  late Timer timer;

  ExtendedPageController extendedPageController = ExtendedPageController(
    keepPage: false,
  );
  @override
  configBoxDecoreation() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0),
    );
  }

  @override
  void initDefaultState() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (selectIndex == (widget.bannerList.length - 1)) {
        selectIndex = 0;
        extendedPageController.jumpTo(0);
      } else {
        selectIndex = selectIndex + 1;
        extendedPageController.animateToPage(
          selectIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.linear,
        );
      }
    });

    super.initDefaultState();
  }

  @override
  void initDefaultDispose() {
    timer.cancel();
    super.initDefaultDispose();
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = configBannerItem();
    return body;
  }

  /// 创建轮播图item
  configBannerItem() {
    Widget body = Container();
    body = ExtendedImageGesturePageView.builder(
      itemBuilder: (context, index) {
        Widget body = CommonExtendedImageWidget.configImage(
          assetPath: widget.bannerList[index],
          width: SizeMacro.screenWidth - 50.w,
          fit: BoxFit.fill,
          borderRadius: BorderRadius.circular(
            16.r,
          ),
          isShowLoadIng: false,
        );
        return body;
      },
      itemCount: widget.bannerList.length,
      controller: extendedPageController,
      onPageChanged: (value) {
        configSelectIndex(index: value);
      },
    );
    body = Container(
      height: 160.h,
      margin: EdgeInsets.only(
        bottom: 15.w,
      ),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          configShadow(),
        ],
        color: scallBackGroundColor,
      ),
      child: body,
    );

    body = Stack(
      children: [
        body,
        Positioned(
          bottom: 40.w,
          left: 0,
          right: 0,
          child: MyBannerBottomWidget(
            key: globalKey,
            allNum: widget.bannerList.length,
          ),
        )
      ],
    );
    return body;
  }

  configSelectIndex({required int index}) {
    globalKey.currentState?.configSelectIndex(index: index);
  }
}
