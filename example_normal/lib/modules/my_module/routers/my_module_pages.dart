/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-10 20:25:53
 * @LastEditors: TT
 * @LastEditTime: 2023-05-03 20:42:39
 */

import 'package:hzy_common_module/hzy_common_module.dart';
import '../pages/pages_index.dart';
import '/modules/my_module/routers/routers_index.dart';

class MyModulePages {
  static final routerS = [
    GetPage(
      name: MyModuleRouterS.myTheme,
      page: () => MyThemeV(),
    ),
    GetPage(
      name: MyModuleRouterS.myLaunchSett,
      page: () => MyLaunchSettV(),
      transition: Transition.downToUp,
      binding: BindingsBuilder.put(
        () => MyLaunchSettC(),
      ),
    ),
    GetPage(
      name: MyModuleRouterS.myTool,
      page: () => MyToollessV(),
    ),
    GetPage(
      name: MyModuleRouterS.myGeneral,
      page: () => MyGeneralV(),
    ),
  ];
}
