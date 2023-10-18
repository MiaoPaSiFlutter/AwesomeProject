// ignore_for_file: must_be_immutable

import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:get/get.dart';

import 'mpsf_shopcar_page.dart';

class ShopcarView extends GetView<ShopcarController> {
  ShopcarView({Key? key}) : super(key: key);

  @override
  ShopcarController get controller => Get.put(ShopcarController());

  @override
  Widget build(BuildContext context) {
    return MultiProviderWidget(
      providers: [
        ChangeNotifierProvider(create: (_) => controller.modelVM),
      ],
      onReady: () {},
      child: const MpsfShopcarPage(),
    );
  }
}

class ShopcarController extends GetxController {
  final count = 0.obs;
  CarProvider modelVM = CarProvider();

  void increment() => count.value++;

  @override
  void onClose() {
    modelVM.dispose();
    super.onClose();
  }
}
