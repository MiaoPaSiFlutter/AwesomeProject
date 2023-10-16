import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class PwdloginView extends CommonGetXWidget<PwdloginController> {
  @override
  String? createAppBarTitleStr() => "密码登录";

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
