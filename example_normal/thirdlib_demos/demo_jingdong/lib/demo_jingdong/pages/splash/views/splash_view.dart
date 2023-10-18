import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:lottie/lottie.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  SplashController get controller => Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Lottie.asset(
          // 'assets/lottiefiles/camptravel.zip',
          // 'assets/lottiefiles/mdb_splash.zip',
          NormalModuleUtils.configPackagesImage(
              packagename: 'demo_jingdong',
              name: 'assets/lottiefiles/mdb_splash/data.json'),

          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fitWidth,
          controller: controller.animationController,
          onLoaded: (composition) {
            controller.animationController
              ..duration = composition.duration
              ..reset()
              ..forward();
          },
        ),
      ),
    );
  }
}

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController animationController;

  final String _updateUrl =
      "https://gitee.com/xuexiangjys/XUpdate/raw/master/jsonapi/update_test.json";

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Get.offNamed(CommonPageId.MAIN_TAB);
        }
      });
  }

  @override
  void onReady() {
    super.onReady();

    /// 延迟4s后，检查是否需要更新
    Future.delayed(const Duration(seconds: 4), () {
      UpdateManager.init(_updateUrl);
      UpdateManager.checkUpdate(Get.context!, _updateUrl);
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
