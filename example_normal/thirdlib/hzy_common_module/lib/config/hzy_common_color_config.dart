/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-19 21:57:04
 * @LastEditors: TT
 * @LastEditTime: 2023-08-26 16:59:01
 */
import 'package:flutter/material.dart';

import 'hzy_theme_color_config.dart';

class HzyCommonColor {
  /// 白色背景 黑色字体颜色
  Color wbgblacktextcolor = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.whitebgblacktextcolor,
  );

  /// 白色背景颜色
  Color whitebackgroundColor = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.colffffff,
  );

  /// 禁用按钮背景颜色
  Color disableBtnBackGroudColor = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.disableBtnBackGroudColor,
  );

  /// 禁用按钮字体颜色
  Color disableBtnTitleColor = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.disableBtnTitleColor,
  );

  /// 主题色
  Color colthemes = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.coltheme,
  );

  /// 纯黑色
  Color col000000 = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.col000000,
  );

  ///
  Color colefedf3 = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.colefedf3,
  );
  Color col666666 = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.col666666,
  );
  Color col999999 = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.col999999,
  );
  Color colc3c3c3 = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.colc3c3c3,
  );

  Color coldddddd = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.coldddddd,
  );

  /// 二级灰色字体颜色
  Color col5a5a5a = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.col5a5a5a,
  );

  /// 输入框 place 字体颜色
  Color colplacetextcolor = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.cola6a6a6,
  );

  /// 纯白色背景
  Color colonlywhite = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.colonlywhite,
  );

  /// 灰色背景颜色
  Color backgroudgrey = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.backGroupColor,
    // HzyColorSring.colf5f5f5,
  );

  /// 分割线颜色
  Color linecolor = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.colline,
  );

  Color colore9e9e9 = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.cole9e9e9,
  );

  /// 发布文章 背景颜色
  Color pusbulishbackgroundColor = const Color(
    0xff181818,
  );

  /// 协议字体颜色
  Color agreementtextcolor = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.agreementtextcolor,
  );

  /// 三级说明字体灰色
  Color colb0b0b0 = HzyThemeColorConfig().configColor(
    colkey: HzyColorSring.colb0b0b0,
  );
}
