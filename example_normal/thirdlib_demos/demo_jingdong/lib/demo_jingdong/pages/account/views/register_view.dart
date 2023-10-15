import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../../config/jingdong_launch_id_config.dart';

class RegisterView extends CommonGetXWidget<RegisterController> {
  @override
  String? createAppBarTitleStr() => JindDongLaunchIdConfig.general.tr;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return const Center(
      child: Text(
        'RegisterView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class RegisterController extends CommonGetXController {
  //TODO: Implement RegisterController

  final count = 0.obs;

  void increment() => count.value++;
}
