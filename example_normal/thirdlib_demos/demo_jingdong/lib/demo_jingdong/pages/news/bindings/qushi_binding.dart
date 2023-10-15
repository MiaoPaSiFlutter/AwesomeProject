import 'package:get/get.dart';

import '../controllers/qushi_controller.dart';

class QushiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QushiController>(
      () => QushiController(),
    );
  }
}
