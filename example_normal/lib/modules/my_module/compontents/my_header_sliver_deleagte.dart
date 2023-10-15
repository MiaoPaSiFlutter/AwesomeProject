/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-12 11:38:58
 * @LastEditors: TT
 * @LastEditTime: 2023-05-19 17:33:26
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../config/my_module_image_id_config.dart';
import '../tools/my_module_image_path_config.dart';

class MyHeaderSliverDelegate extends SliverPersistentHeaderDelegate {
  double progress = 0;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double maxSharinkOffset = maxExtent - minExtent;
    progress = (shrinkOffset / maxSharinkOffset).clamp(0.0, 1.0);

    Widget body = Stack(
      children: [
        configImageBg(),
        configNormalNav(),
        configUserInfoWidget(),
      ],
    );
    return body;
  }

  /// 创建背景图
  configImageBg() {
    Widget body = Image.asset(
      MyModuleImagePathConfig().configImagePath(
        pathkey: MyModuleImageIdConfig.myHeaderImg,
      ),
      fit: BoxFit.fitWidth,
      height: maxExtent,
      width: SizeMacro.screenWidth,
    );
    body = SizedBox(
      width: SizeMacro.screenWidth,
      height: maxExtent,
    );
    return body;
  }

  /// 创建导航栏
  configNormalNav() {
    Widget body = configNavImageBg();
    body = Opacity(
      opacity: progress == 1 ? 1 : 0,
      child: body,
    );
    return body;
  }

  /// 创建用户信息
  configUserInfoWidget() {
    /// 获取滚动图片大小
    double userImgW = Tween<double>(begin: 50, end: 30).transform(progress);

    double lineSpace = Tween<double>(begin: 10.w, end: 5.w).transform(progress);

    double userImageFontSize =
        Tween<double>(begin: 14, end: 7).transform(progress);
    Widget body = Container(
      width: userImgW,
      height: userImgW,
      decoration: BoxDecoration(
        color: HzyCommonColor().colthemes,
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      child: Text(
        "火之夜",
        style: HzyTextStyle.fontBold(
          size: userImageFontSize,
          color: Colors.white,
        ),
      ),
    );

    body = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        body,
        Gaps.confighbox(width: lineSpace),
        Expanded(
          child: Stack(
            children: [
              configUserNameWidget(),
              configUserSloganWidget(),
            ],
          ),
        ),
      ],
    );

    body = Positioned(
      left: 15.w,
      right: 15.w,
      bottom: (SizeMacro.navh - SizeMacro.statusBarHeight - 30) / 2,
      child: body,
    );
    return body;
  }

  /// 创建昵称
  configUserNameWidget() {
    double fontSize = Tween<double>(begin: 18, end: 16).transform(progress);
    progress = progress * 2;
    if (progress >= 1) {
      progress = 1;
    }
    double bottomH = Tween<double>(begin: 18, end: 0).transform(progress);
    double itmeH = Tween<double>(begin: 50, end: 30).transform(progress);
    Widget body = Text(
      "${LaunchIdConfig.click.tr}${LaunchIdConfig.login.tr}/${LaunchIdConfig.register.tr}",
      style: HzyTextStyle.fontSemi(
        size: fontSize,
        color: HzyCommonColor().wbgblacktextcolor,
      ),
    );
    body = Container(
      alignment: Alignment.centerLeft,
      child: body,
    );
    body = Expanded(child: body);
    body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        body,
        SizedBox(
          height: bottomH,
        )
      ],
    );
    body = SizedBox(
      height: itmeH,
      child: body,
    );
    return body;
  }

  /// 创建slogn
  configUserSloganWidget() {
    progress = progress * 2;
    if (progress >= 1) {
      progress = 1;
    }
    double opacity = Tween<double>(begin: 1, end: 0).transform(progress);
    Widget body = Text(
      LaunchIdConfig.solg.tr,
      style: FontConfig().fontMedium12PlaceColor,
    );

    body = Container(
      alignment: Alignment.centerLeft,
      height: 22,
      child: body,
    );

    body = Opacity(
      opacity: opacity,
      child: body,
    );
    body = Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: body,
    );
    return body;
  }

  @override
  double get maxExtent => SizeMacro.navh + 60.h;

  @override
  double get minExtent => SizeMacro.navh;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
