import 'package:get/get.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class LoginController extends CommonGetXController {
  final count = 0.obs;

  final index = 0.obs;

  /// 配置默认选项
  @override
  configDefault() {}

  void increment() => count.value++;
}
