import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mpsf_category_page.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  CategoryController get controller => Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return MpsfCategoryPage();
  }
}

class CategoryController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
