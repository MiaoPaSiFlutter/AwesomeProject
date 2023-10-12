/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-11 14:10:38
 * @LastEditors: TT
 * @LastEditTime: 2023-05-11 14:15:59
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class ExampleViewBasicAttributesV
    extends CommonGetXWidget<ExampleViewBasicAttributesC> {
  ExampleViewBasicAttributesV({Key? key}) : super(key: key);
  @override
  ExampleViewBasicAttributesC get controller =>
      Get.put(ExampleViewBasicAttributesC());

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Container();
    return body;
  }
}

class ExampleViewBasicAttributesC extends CommonGetXController {
  // --------- 属性 --------- //

  // --------- 生命周期  --------- //

  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //
}
