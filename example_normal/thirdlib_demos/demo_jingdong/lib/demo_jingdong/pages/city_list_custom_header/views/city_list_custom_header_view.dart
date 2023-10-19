import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'citylist_custom_header_page.dart';

class CityListCustomHeaderView extends GetView<CityListCustomHeaderController> {
  const CityListCustomHeaderView({Key? key}) : super(key: key);

  @override
  CityListCustomHeaderController get controller =>
      Get.put(CityListCustomHeaderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("???"),
      ),
      body: CityListCustomHeaderPage(),
    );
  }
}

class CityListCustomHeaderController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
