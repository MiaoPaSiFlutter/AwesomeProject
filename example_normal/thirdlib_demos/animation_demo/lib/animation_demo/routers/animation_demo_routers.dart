import 'package:hzy_common_module/hzy_common_module.dart';
import '../pages/pages_index.dart';
import 'routers_index.dart';

class AnimationDemoModulePagesS {
  static final routerS = [
    GetPage(
      name: AnimationDemoModuleRouterS.HOME,
      page: () => AnimationMyApp(),
    ),
  ];
}
