import 'package:hzy_common_module/hzy_common_module.dart';
import '../pages/pages_index.dart';
import 'routers_index.dart';

class JingdongModulePagesS {
  static final routerS = [
    
    GetPage(
      name: JingDongModuleRouterS.ScrollPullDownToScaleImageDemo,
      page: () => ScrollPullDownToScaleImageDemo(),
    ),
    GetPage(
      name: JingDongModuleRouterS.ScrollPullDownToScaleImageDemo2,
      page: () => ScrollPullDownToScaleImageDemo2(),
    ),
    GetPage(
      name: JingDongModuleRouterS.ScrollExtendedNestedScrollViewDemo,
      page: () => ScrollExtendedNestedScrollViewDemo(),
    ),
    GetPage(
      name: JingDongModuleRouterS.ScrollScrollDirectionDemo,
      page: () => ScrollScrollDirectionDemo(),
    ),
    GetPage(
      name: JingDongModuleRouterS.ScrollDynamicPinnedHeaderHeightDemo,
      page: () => ScrollDynamicPinnedHeaderHeightDemo(),
    ),
    GetPage(
      name: JingDongModuleRouterS.ScrollScrollToTopDemo,
      page: () => ScrollScrollToTopDemo(),
    ),
    GetPage(
      name: JingDongModuleRouterS.ScrollOfficialDemo,
      page: () => ScrollOfficialDemo(),
    ),
    GetPage(
      name: JingDongModuleRouterS.ScrollLoadMoreDemo,
      page: () => ScrollLoadMoreDemo(),
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
