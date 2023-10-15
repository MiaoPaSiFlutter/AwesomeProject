import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/smslogin_controller.dart';

class SmsloginView extends GetView<SmsloginController> {
  const SmsloginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmsloginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SmsloginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
