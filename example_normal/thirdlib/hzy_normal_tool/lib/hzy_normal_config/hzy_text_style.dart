// 通用 字体
import 'package:flutter/material.dart';

class HzyTextStyle {
  static TextStyle fontRegular({
    double? size,
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: color,
      height: height,
    );
  }

  static TextStyle fontMedium({
    double? size,
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
    );
  }

  static TextStyle fontSemi({
    double? size,
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color,
      height: height,
    );
  }

  static TextStyle fontLight({
    double? size,
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w300,
      color: color,
      height: height,
    );
  }

  static TextStyle fontBold({
    double? size,
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
    );
  }
}
