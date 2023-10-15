import 'package:get/get.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class JingxuanController extends CommonGetXController {
  final count = 0.obs;

  void increment() => count.value++;
}
