import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'app.dart';

class UIMotionAnimationsReplyApp
    extends GetView<UIMotionAnimationsReplyAppController> {
  const UIMotionAnimationsReplyApp({super.key});

  @override
  UIMotionAnimationsReplyAppController get controller =>
      Get.put(UIMotionAnimationsReplyAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UIMotionAnimationsReplyAppController extends GetxController {
  UIMotionAnimationsReplyAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReplyApp();
  }
}
