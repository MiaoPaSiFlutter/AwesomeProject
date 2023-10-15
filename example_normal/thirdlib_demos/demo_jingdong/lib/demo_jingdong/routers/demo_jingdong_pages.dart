import 'package:hzy_common_module/hzy_common_module.dart';
import '../pages/jingdong_home_v.dart';
import '../pages/news/views/news_view.dart';
import '../pages/pages_index.dart';
import 'routers_index.dart';

class JingdongModulePagesS {
  static final routerS = [
    GetPage(
      name: JingDongModuleRouterS.HOME,
      page: () => JingdongHomePage(),
    ),
    GetPage(
      name: JingDongModuleRouterS.NEWS,
      page: () => NewsView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.SMSLOGIN,
      page: () => SmsloginView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.PWDLOGIN,
      page: () => PwdloginView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.REGISTER,
      page: () => RegisterView(),
    ),
  ];
}
