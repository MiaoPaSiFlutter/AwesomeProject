import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';
import '../utils/screenutil_tools.dart';
import 'hzy_common_color_config.dart';

class FontConfig {
  // ----- 粗体黑色 ---- //

  static TextStyle get fontBold10Black => HzyTextStyle.fontBold(
        size: Dimens.font_10,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontBold12Black => HzyTextStyle.fontBold(
        size: Dimens.font_12,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontBold14Black => HzyTextStyle.fontBold(
        size: Dimens.font_14,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontBold16Black => HzyTextStyle.fontBold(
        size: Dimens.font_16,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontBold18Black => HzyTextStyle.fontBold(
        size: Dimens.font_18,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontBold26Block => HzyTextStyle.fontBold(
        size: Dimens.font_26,
        color: HzyCommonColor().wbgblacktextcolor,
      );

  // ----- 粗体白色 ---- //
  static TextStyle get fontBold10White => HzyTextStyle.fontBold(
        size: Dimens.font_10,
        color: HzyCommonColor().whitebackgroundColor,
      );
  static TextStyle get fontBold12White => HzyTextStyle.fontBold(
        size: Dimens.font_12,
        color: HzyCommonColor().whitebackgroundColor,
      );
  static TextStyle get fontBold14White => HzyTextStyle.fontBold(
        size: Dimens.font_14,
        color: HzyCommonColor().whitebackgroundColor,
      );
  static TextStyle get fontBold16White => HzyTextStyle.fontBold(
        size: Dimens.font_16,
        color: HzyCommonColor().whitebackgroundColor,
      );
  static TextStyle get fontBold18White => HzyTextStyle.fontBold(
        size: Dimens.font_18,
        color: HzyCommonColor().whitebackgroundColor,
      );
  // ----- medium白色 ---- //
  static TextStyle get fontMedium10White => HzyTextStyle.fontMedium(
        size: Dimens.font_10,
        color: HzyCommonColor().whitebackgroundColor,
      );
  static TextStyle get fontMedium12White => HzyTextStyle.fontMedium(
        size: Dimens.font_12,
        color: HzyCommonColor().whitebackgroundColor,
      );
  static TextStyle get fontMedium14White => HzyTextStyle.fontMedium(
        size: Dimens.font_14,
        color: HzyCommonColor().whitebackgroundColor,
      );
  static TextStyle get fontMedium16White => HzyTextStyle.fontMedium(
        size: Dimens.font_16,
        color: HzyCommonColor().whitebackgroundColor,
      );
  static TextStyle get fontMedium18White => HzyTextStyle.fontMedium(
        size: Dimens.font_18,
        color: HzyCommonColor().whitebackgroundColor,
      );

  // ----- medium黑色 ---- //
  static TextStyle get fontMedium10Black => HzyTextStyle.fontMedium(
        size: Dimens.font_10,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontMedium12Black => HzyTextStyle.fontMedium(
        size: Dimens.font_12,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontMedium14Black => HzyTextStyle.fontMedium(
        size: Dimens.font_14,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontMedium16Black => HzyTextStyle.fontMedium(
        size: Dimens.font_16,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontMedium18Black => HzyTextStyle.fontMedium(
        size: Dimens.font_18,
        color: HzyCommonColor().wbgblacktextcolor,
      );

  // ----- medium999999 ---- //

  static TextStyle get fontMedium10LightGrey => HzyTextStyle.fontMedium(
        size: Dimens.font_10,
        color: HzyCommonColor().col999999,
      );
  static TextStyle get fontMedium12LightGrey => HzyTextStyle.fontMedium(
        size: Dimens.font_12,
        color: HzyCommonColor().col999999,
      );
  static TextStyle get fontMedium14LightGrey => HzyTextStyle.fontMedium(
        size: Dimens.font_14,
        color: HzyCommonColor().col999999,
      );
  static TextStyle get fontMedium16LightGrey => HzyTextStyle.fontMedium(
        size: Dimens.font_16,
        color: HzyCommonColor().col999999,
      );
  static TextStyle get fontMedium18LightGrey => HzyTextStyle.fontMedium(
        size: Dimens.font_18,
        color: HzyCommonColor().col999999,
      );

  // ----- medium666666 ---- //
  static TextStyle get fontMedium10Grey => HzyTextStyle.fontMedium(
        size: Dimens.font_10,
        color: HzyCommonColor().col666666,
      );
  static TextStyle get fontMedium12Grey => HzyTextStyle.fontMedium(
        size: Dimens.font_12,
        color: HzyCommonColor().col666666,
      );
  static TextStyle get fontMedium14Grey => HzyTextStyle.fontMedium(
        size: Dimens.font_14,
        color: HzyCommonColor().col666666,
      );
  static TextStyle get fontMedium16Grey => HzyTextStyle.fontMedium(
        size: Dimens.font_16,
        color: HzyCommonColor().col666666,
      );
  static TextStyle get fontMedium18Grey => HzyTextStyle.fontMedium(
        size: Dimens.font_18,
        color: HzyCommonColor().col666666,
      );

  // ----- medium占位符 字体颜色 ---- //
  static TextStyle get fontMedium12PlaceColor => HzyTextStyle.fontMedium(
        size: Dimens.font_12,
        color: HzyCommonColor().colplacetextcolor,
      );
  static TextStyle get fontMedium14PlaceColor => HzyTextStyle.fontMedium(
        size: Dimens.font_14,
        color: HzyCommonColor().colplacetextcolor,
      );
  static TextStyle get fontMedium16PlaceColor => HzyTextStyle.fontMedium(
        size: Dimens.font_16,
        color: HzyCommonColor().colplacetextcolor,
      );
  static TextStyle get fontMedium18PlaceColor => HzyTextStyle.fontMedium(
        size: Dimens.font_18,
        color: HzyCommonColor().colplacetextcolor,
      );

  // ----- medium C3C3C3 ---- //
  static TextStyle get fontMedium14C3c3c3 => HzyTextStyle.fontMedium(
        size: Dimens.font_14,
        color: HzyCommonColor().colc3c3c3,
      );

  static TextStyle get fontMedium145a5a5a => HzyTextStyle.fontMedium(
        size: Dimens.font_14,
        color: HzyCommonColor().col5a5a5a,
      );
  // ----- medium 主题色字体 ---- //
  static TextStyle get fontMedium12Theme => HzyTextStyle.fontMedium(
        size: Dimens.font_12,
        color: HzyCommonColor().colthemes,
      );
  static TextStyle get fontMedium14Theme => HzyTextStyle.fontMedium(
        size: Dimens.font_14,
        color: HzyCommonColor().colthemes,
      );
  static TextStyle get fontMedium16Theme => HzyTextStyle.fontMedium(
        size: Dimens.font_16,
        color: HzyCommonColor().colthemes,
      );
  static TextStyle get fontMedium18Theme => HzyTextStyle.fontMedium(
        size: Dimens.font_18,
        color: HzyCommonColor().colthemes,
      );
  static TextStyle get fontMedium20Theme => HzyTextStyle.fontMedium(
        size: Dimens.font_20,
        color: HzyCommonColor().colthemes,
      );

  // ----- Regular 白色背景字体颜色 ---- //
  static TextStyle get fontRegular10White => HzyTextStyle.fontRegular(
        size: Dimens.font_10,
        color: HzyCommonColor().whitebackgroundColor,
      );
  static TextStyle get fontRegular12White => HzyTextStyle.fontRegular(
        size: Dimens.font_12,
        color: HzyCommonColor().whitebackgroundColor,
      );
  static TextStyle get fontRegular14White => HzyTextStyle.fontRegular(
        size: Dimens.font_14,
        color: HzyCommonColor().whitebackgroundColor,
      );
  static TextStyle get fontRegular16White => HzyTextStyle.fontRegular(
        size: Dimens.font_16,
        color: HzyCommonColor().whitebackgroundColor,
      );
  static TextStyle get fontRegular18White => HzyTextStyle.fontRegular(
        size: Dimens.font_18,
        color: HzyCommonColor().whitebackgroundColor,
      );
  // ----- Regular 黑色背景字体颜色 ---- //
  static TextStyle get fontRegular10Black => HzyTextStyle.fontRegular(
        size: Dimens.font_10,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontRegular12Black => HzyTextStyle.fontRegular(
        size: Dimens.font_12,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontRegular14Black => HzyTextStyle.fontRegular(
        size: Dimens.font_14,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontRegular16Black => HzyTextStyle.fontRegular(
        size: Dimens.font_16,
        color: HzyCommonColor().wbgblacktextcolor,
      );
  static TextStyle get fontRegular18Black => HzyTextStyle.fontRegular(
        size: Dimens.font_18,
        color: HzyCommonColor().wbgblacktextcolor,
      );
}
