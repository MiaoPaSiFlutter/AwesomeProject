import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mpsf_product_page.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);
  @override
  // TODO: implement controller
  ProductController get controller => Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    Map<String, String?> parameters = Get.parameters;
    if (parameters.isEmpty) {
      parameters = {"shopId": "19769", "sku": "44096580396"};
    }
    return MpsfProductPage(parameters: parameters);
  }
}

class ProductController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
