/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-10 17:59:07
 * @LastEditors: TT
 * @LastEditTime: 2023-05-10 18:23:22
 */

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart' as md;
import 'package:hzy_common_module/hzy_common_module.dart';

import 'dart_syntax_highlighter.dart';

class HighLight extends md.SyntaxHighlighter {
  @override
  TextSpan format(String source) {
    final SyntaxHighlighterStyle style = ThemeTool.isdark()
        ? SyntaxHighlighterStyle.darkThemeStyle()
        : SyntaxHighlighterStyle.lightThemeStyle();
    return TextSpan(
      style: const TextStyle(
        fontSize: 14.0,
      ),
      children: [
        DartSyntaxHighlighter(style).format(source),
      ],
    );
  }
}
