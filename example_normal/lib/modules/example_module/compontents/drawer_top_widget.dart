/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-20 15:38:54
 * @LastEditors: TT
 * @LastEditTime: 2023-04-20 15:38:56
 */

import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';

class DrawerToplessV extends CommonLessV {
  DrawerToplessV({super.key});
  @override
  bool get isNeedScaffol => false;
  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Image.asset(
      "assets/images/example/hytop.png",
      fit: BoxFit.fitWidth,
    );
    return body;
  }
}
