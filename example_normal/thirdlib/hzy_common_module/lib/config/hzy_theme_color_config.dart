/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-19 21:57:21
 * @LastEditors: TT
 * @LastEditTime: 2023-08-26 16:57:47
 */
import 'package:flutter/material.dart';

import 'package:hzy_normal_tool/hzy_normal_tool.dart';

import 'hzy_theme_abs.dart';

class HzyColorSring {
  static String coltheme = "theme";
  static String colffffff = "ffffff";
  static String col000000 = "000000";
  static String colefedf3 = "efedf3";
  static String col666666 = "666666";
  static String col999999 = "999999";
  static String colc3c3c3 = "c3c3c3";
  static String coldddddd = "dddddd";
  static String cole8e8e8 = "e8e8e8";
  static String cola6a6a6 = 'a6a6a6';
  static String cole3e3e3 = "e3e3e3";
  static String colonlywhite = "colonlywhite";
  static String colababab = "ababab";
  static String col5a5a5a = "5a5a5a";
  static String coldadada = "dadada";
  static String cole9e9e9 = "e9e9e9";
  static String colb0b0b0 = "b0b0b0";
  static String backGroupColor = "f4f5f9";

  /// boss 背景色
  static String colf5f5f5 = "f5f5f5";

  /// 细线颜色
  static String colline = 'lineColor';

  /// 白色背景 黑色字体
  static String whitebgblacktextcolor = "whiteback";

  /// 协议字体颜色
  static String agreementtextcolor = 'agreementextcolor';

  /// 禁用按钮背景颜色
  static String disableBtnBackGroudColor = "disableBtnBackGroudColor";

  /// 禁用按钮字体颜色
  static String disableBtnTitleColor = "disableBtnTitleColor";
}

class HzyColors {
  /// 白色背景 黑色字体
  static const Color col181818 = Color(0xff181818);
  static const Color coldddde6 = Color(0xffdddde6);

  /// 协议字体颜色
  static const Color col61678b = Color(0xff61678b);
  static const Color col8b8ca8 = Color(0xff8b8ca8);

  /// 三级灰色
  static const Color colb0b0b0 = Color(0xffb0b0b0);
  static const Color col606060 = Color(0xff606060);
}

class HzyThemeColorConfig extends HzyColorAbs {
  HzyThemeColorConfig._internal();
  factory HzyThemeColorConfig() => _instance;
  static final HzyThemeColorConfig _instance = HzyThemeColorConfig._internal();

  @override
  Map<String, Color?> get lightInfo => {
        HzyColorSring.coltheme: HzyNormalColorS.col2865ff,
        HzyColorSring.colffffff: HzyNormalColorS.colffffff,
        HzyColorSring.col000000: HzyNormalColorS.col000000,
        HzyColorSring.colefedf3: HzyNormalColorS.colefedf3,
        HzyColorSring.col666666: HzyNormalColorS.col666666,
        HzyColorSring.col999999: HzyNormalColorS.col999999,
        HzyColorSring.colc3c3c3: HzyNormalColorS.colc3c3c3,
        HzyColorSring.cola6a6a6: HzyNormalColorS.cola6a6a6,
        HzyColorSring.colonlywhite: HzyNormalColorS.colffffff,
        HzyColorSring.coldddddd: HzyNormalColorS.coldddddd,
        HzyColorSring.cole8e8e8: HzyNormalColorS.cole8e8e8,
        HzyColorSring.cole3e3e3: HzyNormalColorS.cole3e3e3,
        HzyColorSring.colababab: HzyNormalColorS.colababab,
        HzyColorSring.col5a5a5a: HzyNormalColorS.col5a5a5a,
        HzyColorSring.coldadada: HzyNormalColorS.coldadada,
        HzyColorSring.cole9e9e9: HzyNormalColorS.cole9e9e9,
        HzyColorSring.colb0b0b0: HzyColors.colb0b0b0,
        HzyColorSring.colf5f5f5: const Color.fromRGBO(245, 245, 245, 1),
        HzyColorSring.backGroupColor: HzyNormalColorS.colf4f5f9,
        HzyColorSring.whitebgblacktextcolor: HzyColors.col181818,
        HzyColorSring.agreementtextcolor: HzyColors.col61678b,
        HzyColorSring.colline: HzyNormalColorS.coldddddd,
        HzyColorSring.disableBtnBackGroudColor: HzyNormalColorS.colf0f0f0,
        HzyColorSring.disableBtnTitleColor: HzyNormalColorS.colbdbdbd,
      };
  @override
  Map<String, Color?> get darkInfo => {
        HzyColorSring.coltheme: HzyNormalColorS.col2865ff,
        HzyColorSring.colffffff: const Color.fromRGBO(27, 27, 27, 1),
        HzyColorSring.col000000: HzyNormalColorS.colffffff,
        HzyColorSring.colefedf3: HzyNormalColorS.col151515,
        HzyColorSring.col666666: HzyNormalColorS.colCACACA,
        HzyColorSring.col999999: HzyNormalColorS.col7C7C7C,
        HzyColorSring.colc3c3c3: HzyNormalColorS.col101010,
        HzyColorSring.cola6a6a6: HzyNormalColorS.col4d4d4d,
        HzyColorSring.colonlywhite: HzyNormalColorS.colffffff,
        HzyColorSring.coldddddd: HzyNormalColorS.col2d2d2d,
        HzyColorSring.cole8e8e8: HzyNormalColorS.col0e0e0e,
        HzyColorSring.cole3e3e3: HzyNormalColorS.col252525,
        HzyColorSring.colababab: HzyNormalColorS.col505050,
        HzyColorSring.col5a5a5a: HzyNormalColorS.col909090,
        HzyColorSring.coldadada: HzyNormalColorS.coldadada,
        HzyColorSring.cole9e9e9: HzyNormalColorS.col0e0e0e,
        HzyColorSring.colb0b0b0: HzyColors.col606060,
        HzyColorSring.colf5f5f5: const Color.fromRGBO(20, 20, 20, 1),
        HzyColorSring.whitebgblacktextcolor: HzyColors.coldddde6,
        HzyColorSring.agreementtextcolor: HzyColors.col8b8ca8,
        HzyColorSring.backGroupColor: HzyNormalColorS.col0e0e0e,
        HzyColorSring.colline: HzyNormalColorS.col2d2d2d,
        HzyColorSring.disableBtnBackGroudColor: HzyNormalColorS.colf0f0f0,
        HzyColorSring.disableBtnTitleColor: HzyNormalColorS.colbdbdbd,
      };
}
