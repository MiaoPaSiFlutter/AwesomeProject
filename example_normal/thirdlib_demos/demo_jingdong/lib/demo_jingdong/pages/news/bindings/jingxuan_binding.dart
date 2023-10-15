import 'package:get/get.dart';

import '../controllers/jingxuan_controller.dart';

class JingxuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JingxuanController>(
      () => JingxuanController(),
    );
  }
}
