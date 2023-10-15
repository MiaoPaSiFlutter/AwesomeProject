import 'package:get/get.dart';

import '../controllers/xinpin_controller.dart';

class XinpinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<XinpinController>(
      () => XinpinController(),
    );
  }
}
