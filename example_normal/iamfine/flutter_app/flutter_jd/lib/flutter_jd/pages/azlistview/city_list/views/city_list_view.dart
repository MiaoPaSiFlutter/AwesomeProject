import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'citylist_page.dart';

class CityListView extends GetView<CityListController> {
  const CityListView({Key? key}) : super(key: key);

  @override
  CityListController get controller => Get.put(CityListController());

  @override
  Widget build(BuildContext context) {
    return const CityListPage();
  }
}

class CityListController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
