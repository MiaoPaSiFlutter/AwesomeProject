import 'package:hzy_common_module/hzy_common_module.dart';
import '../pages/pages_index.dart';
import 'routers_index.dart';

class ChatGPTAppModulePagesS {
  static final routerS = [
    GetPage(
      name: ChatGPTAppModuleRouterS.HOME,
      page: () => const ChatGPTApp(),
    ),
  ];
}
