import 'package:get/get.dart';

import '../controllers/pwdlogin_controller.dart';

class PwdloginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PwdloginController>(
      () => PwdloginController(),
    );
  }
}
