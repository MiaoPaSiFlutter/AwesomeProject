import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pwdlogin_controller.dart';

class PwdloginView extends GetView<PwdloginController> {
  const PwdloginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PwdloginView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PwdloginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
