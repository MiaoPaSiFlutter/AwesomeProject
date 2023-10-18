import 'package:hzy_common_module/hzy_common_module.dart';
import '../pages/pages_index.dart';
import 'routers_index.dart';

class JingdongModulePagesS {
  static final routerS = [
    GetPage(
      name: JingDongModuleRouterS.ShopcarView,
      page: () => ShopcarView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.HomeView,
      page: () => HomeView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.ProductView,
      page: () => ProductView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.CommonWebPage,
      page: () => CommonWebPage(),
    ),
    GetPage(
      name: JingDongModuleRouterS.SplashView,
      page: () => SplashView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.GuideView,
      page: () => GuideView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.CategoryView,
      page: () => CategoryView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.DiscoverView,
      page: () => DiscoverView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.MineView,
      page: () => MineView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.OrderView,
      page: () => OrderView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.AccountSetView,
      page: () => AccountSetView(),
    ),
    GetPage(
      name: JingDongModuleRouterS.BrowseHistoryView,
      page: () => BrowseHistoryView(),
    ),
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
