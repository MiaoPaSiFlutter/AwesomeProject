import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'car_models_page.dart';

class CarModelsView extends GetView<CarModelsController> {
  const CarModelsView({Key? key}) : super(key: key);

  @override
  CarModelsController get controller => Get.put(CarModelsController());

  @override
  Widget build(BuildContext context) {
    return const CarModelsPage();
  }
}

class CarModelsController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
