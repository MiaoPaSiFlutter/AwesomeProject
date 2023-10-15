import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class SmsloginView extends CommonGetXWidget<SmsloginController> {
  @override
  String? createAppBarTitleStr() => JindDongLaunchIdConfig.general.tr;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return const Center(
      child: Text(
        'SmsloginView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class SmsloginController extends CommonGetXController {
  //TODO: Implement SmsloginController

  final count = 0.obs;

  void increment() => count.value++;
}
