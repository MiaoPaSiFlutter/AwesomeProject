import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../../config/jingdong_launch_id_config.dart';

class PwdloginView extends CommonGetXWidget<PwdloginController> {
  @override
  String? createAppBarTitleStr() => JindDongLaunchIdConfig.general.tr;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return const Center(
      child: Text(
        'PwdloginView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class PwdloginController extends CommonGetXController {
  //TODO: Implement PwdloginController

  final count = 0.obs;

  void increment() => count.value++;
}
