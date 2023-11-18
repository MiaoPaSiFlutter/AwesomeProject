/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-19 21:29:33
 * @LastEditors: TT
 * @LastEditTime: 2023-05-31 11:43:26
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeMacro {
  // 屏幕宽
  static double get screenWidth => ScreenUtil().screenWidth;
  // 屏幕高
  static double get screenHeight => ScreenUtil().screenHeight;
  // 系统状态栏高度
  static double get statusBarHeight => ScreenUtil().statusBarHeight;
  // 底部安全举例距离BottomBar高度
  static double get bottomBarHeight => ScreenUtil().bottomBarHeight;

  // 导航栏的高度
  static double get navh => statusBarHeight + (statusBarHeight > 20 ? 44 : 54);

  // 获取适配  width 宽
  static double setWidth(double width) {
    return width.w;
  }

  // 获取适配  height 高
  static double setHeight(double height) {
    return height.h;
  }
}

class Dimens {
  static double font_6 = 6.sp;
  static double font_8 = 8.sp;
  static double font_10 = 10.sp;
  static double font_12 = 12.sp;
  static double font_14 = 14.sp;
  static double font_16 = 16.sp;
  static double font_18 = 18.sp;
  static double font_20 = 20.sp;
  static double font_22 = 22.sp;
  static double font_24 = 24.sp;
  static double font_26 = 26.sp;
  static double font_28 = 28.sp;
  static double font_30 = 30.sp;

  static double dp2 = 2;
  static double dp4 = 4;
  static double dp5 = 5;
  static double dp6 = 6;
  static double dp8 = 8;
  static double dp10 = 10;
  static double dp12 = 12;
  static double dp14 = 14;
  static double dp15 = 15;
  static double dp16 = 16;
  static double dp18 = 18;
  static double dp20 = 20;
  static double dp22 = 22;
  static double dp24 = 24;
  static double dp25 = 25;
  static double dp26 = 26;
  static double dp28 = 28;
  static double dp30 = 30;
  static double dp32 = 32;
  static double dp34 = 34;
  static double dp35 = 35;
  static double dp36 = 36;
  static double dp38 = 38;
  static double dp40 = 40;
  static double dp45 = 45;
  static double dp50 = 50;
}

class Gaps {
  /// 水平间距
  static Widget hGap2 = confighbox(width: Dimens.dp2);
  static Widget hGap4 = confighbox(width: Dimens.dp4);
  static Widget hGap5 = confighbox(width: Dimens.dp5);
  static Widget hGap6 = confighbox(width: Dimens.dp6);
  static Widget hGap8 = confighbox(width: Dimens.dp8);
  static Widget hGap10 = confighbox(width: Dimens.dp10);
  static Widget hGap12 = confighbox(width: Dimens.dp12);
  static Widget hGap14 = confighbox(width: Dimens.dp14);
  static Widget hGap15 = confighbox(width: Dimens.dp15);
  static Widget hGap16 = confighbox(width: Dimens.dp16);
  static Widget hGap18 = confighbox(width: Dimens.dp18);
  static Widget hGap20 = confighbox(width: Dimens.dp20);
  static Widget hGap22 = confighbox(width: Dimens.dp22);
  static Widget hGap24 = confighbox(width: Dimens.dp24);
  static Widget hGap25 = confighbox(width: Dimens.dp25);
  static Widget hGap26 = confighbox(width: Dimens.dp26);
  static Widget hGap28 = confighbox(width: Dimens.dp28);
  static Widget hGap30 = confighbox(width: Dimens.dp30);
  static Widget hGap32 = confighbox(width: Dimens.dp32);
  static Widget hGap35 = confighbox(width: Dimens.dp35);
  static Widget hGap36 = confighbox(width: Dimens.dp36);
  static Widget hGap40 = confighbox(width: Dimens.dp40);
  static Widget hGap45 = confighbox(width: Dimens.dp45);
  static Widget hGap50 = confighbox(width: Dimens.dp50);

  /// 垂直间距
  static Widget vGap2 = configvbox(height: Dimens.dp2);
  static Widget vGap4 = configvbox(height: Dimens.dp4);
  static Widget vGap5 = configvbox(height: Dimens.dp5);
  static Widget vGap6 = configvbox(height: Dimens.dp6);
  static Widget vGap8 = configvbox(height: Dimens.dp8);
  static Widget vGap10 = configvbox(height: Dimens.dp10);
  static Widget vGap12 = configvbox(height: Dimens.dp12);
  static Widget vGap14 = configvbox(height: Dimens.dp14);
  static Widget vGap15 = configvbox(height: Dimens.dp15);
  static Widget vGap16 = configvbox(height: Dimens.dp16);
  static Widget vGap18 = configvbox(height: Dimens.dp18);
  static Widget vGap20 = configvbox(height: Dimens.dp20);
  static Widget vGap22 = configvbox(height: Dimens.dp22);
  static Widget vGap24 = configvbox(height: Dimens.dp24);
  static Widget vGap25 = configvbox(height: Dimens.dp25);
  static Widget vGap26 = configvbox(height: Dimens.dp26);
  static Widget vGap28 = configvbox(height: Dimens.dp28);
  static Widget vGap30 = configvbox(height: Dimens.dp30);
  static Widget vGap32 = configvbox(height: Dimens.dp32);
  static Widget vGap35 = configvbox(height: Dimens.dp35);
  static Widget vGap36 = configvbox(height: Dimens.dp36);
  static Widget vGap40 = configvbox(height: Dimens.dp40);
  static Widget vGap45 = configvbox(height: Dimens.dp45);
  static Widget vGap50 = configvbox(height: Dimens.dp50);

  static confighbox({
    required double width,
    bool reversal = false,
  }) {
    return SizedBox(
      width: reversal ? width.h : width.w,
    );
  }

  static configvbox({
    required double height,
    bool reversal = false,
  }) {
    return SizedBox(
      height: reversal ? height.w : height.h,
    );
  }
}
