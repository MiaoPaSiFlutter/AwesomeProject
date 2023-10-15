import 'package:hzy_common_module/hzy_common_module.dart';
import '../pages/news/views/news_view.dart';
import '../pages/pages_index.dart';
import 'routers_index.dart';

class JingdongModulePagesS {
  static final routerS = [
    GetPage(
      name: JingDongModuleRouterS.NEWS,
      page: () => NewsView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: JingDongModuleRouterS.SMSLOGIN,
      page: () => const SmsloginView(),
      binding: SmsloginBinding(),
    ),
    GetPage(
      name: JingDongModuleRouterS.PWDLOGIN,
      page: () => const PwdloginView(),
      binding: PwdloginBinding(),
    ),
    GetPage(
      name: JingDongModuleRouterS.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
