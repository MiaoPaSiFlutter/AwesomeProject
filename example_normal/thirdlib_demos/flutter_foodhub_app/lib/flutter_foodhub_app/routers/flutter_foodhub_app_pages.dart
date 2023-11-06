import 'package:hzy_common_module/hzy_common_module.dart';
import '../pages/pages_index.dart';
import 'routers_index.dart';

class FoodHubAppModulePagesS {
  static final routerS = [
    GetPage(
      name: FoodHubAppModuleRouterS.HOME,
      page: () => const FoodHubApp(),
    ),
  ];
}
