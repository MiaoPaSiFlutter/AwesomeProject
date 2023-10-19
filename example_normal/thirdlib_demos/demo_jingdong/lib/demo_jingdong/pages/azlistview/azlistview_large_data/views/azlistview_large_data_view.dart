import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'large_data_page.dart';

class AzlistviewLargeDataView extends GetView<AzlistviewLargeDataController> {
  const AzlistviewLargeDataView({Key? key}) : super(key: key);

  @override
  AzlistviewLargeDataController get controller =>
      Get.put(AzlistviewLargeDataController());

  @override
  Widget build(BuildContext context) {
    return const LargeDataPage();
  }
}

class AzlistviewLargeDataController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
