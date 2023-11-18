// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';

import '../constants/constants_index.dart';

class ShowSnackBar {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar({
    required String text,
    Color? snackBarBackgroundColor,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    messengerKey.currentState!
      // ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        duration: const Duration(milliseconds: 800),
        backgroundColor: snackBarBackgroundColor,
        behavior: SnackBarBehavior.floating,
      ));
  }

  static void errorSnackBar({required String text}) {
    ShowSnackBar.showSnackBar(
        text: text,
        snackBarBackgroundColor: AppColors.red,
        fontWeight: FontWeight.bold);
  }

  static void removeSnackBar() {
    messengerKey.currentState!.removeCurrentSnackBar();
  }
}
