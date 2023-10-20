import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../splash_guide_page.dart';

class GuideView extends GetView<GuideController> {
  const GuideView({Key? key}) : super(key: key);

  @override
  GuideController get controller => Get.put(GuideController());
  @override
  Widget build(BuildContext context) {
    return const SplashGuidePage();
  }
}

class GuideController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
