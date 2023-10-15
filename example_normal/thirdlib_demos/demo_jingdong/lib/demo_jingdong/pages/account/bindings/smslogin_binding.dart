import 'package:get/get.dart';

import '../controllers/smslogin_controller.dart';

class SmsloginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmsloginController>(
      () => SmsloginController(),
    );
  }
}
