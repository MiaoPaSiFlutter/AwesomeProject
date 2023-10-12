/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-17 22:36:39
 * @LastEditors: TT
 * @LastEditTime: 2023-07-18 14:18:53
 */

import 'package:hzy_common_module/hzy_common_module.dart';
import '../module_index.dart';
import '../pages/example_basic_list_state_v.dart';
import '../routers/example_module_routers.dart';

class ExampleModulePageS {
  static final routerS = [
    GetPage(
      name: ExampleModuleRouterS.drawerExample,
      page: () => ExampleDrawerV(),
    ),
    GetPage(
      name: ExampleModuleRouterS.homeExample,
      page: () => const ExampleHomePage(),
    ),
    GetPage(
      name: ExampleModuleRouterS.imageGrid,
      page: () => ExampleImageGridV(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: ExampleModuleRouterS.cells,
      page: () => ExampleCellsV(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: ExampleModuleRouterS.modaldialog,
      page: () => ExampleModalDialogV(),
    ),
    GetPage(
      name: ExampleModuleRouterS.button,
      page: () => ExampleBtnV(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: ExampleModuleRouterS.comButton,
      page: () => ExampleComBtnlessV(),
      transition: Transition.fade,
    ),
    GetPage(
      name: ExampleModuleRouterS.banner,
      page: () => ExampleBannerV(),
      transition: Transition.size,
    ),
    GetPage(
      name: ExampleModuleRouterS.markdown,
      page: () => ExampleMarkdownV(),
    ),
    GetPage(
      name: ExampleModuleRouterS.basic,
      page: () => ExampleBasicV(),
    ),
    GetPage(
      name: ExampleModuleRouterS.basicMarkdown,
      page: () => ExampleBasicMarkdownV(),
    ),
    GetPage(
      name: ExampleModuleRouterS.basicLess,
      page: () => ExampleBasiclessV(),
    ),
    GetPage(
      name: ExampleModuleRouterS.basicState,
      page: () => const ExampleBasicStatePage(),
    ),
    GetPage(
      name: ExampleModuleRouterS.basicListState,
      page: () => const ExampleBasicListPage(),
    ),
    GetPage(
      name: ExampleModuleRouterS.basicGetv,
      page: () => ExampleBasicGetV(),
    ),
    GetPage(
      name: ExampleModuleRouterS.basicGetListV,
      page: () => ExampleBasicListV(),
    ),
    GetPage(
      name: ExampleModuleRouterS.basicTabbar,
      page: () => ExampleTabBarV(),
    ),
    GetPage(
      name: ExampleModuleRouterS.tulist,
      page: () => ExampleTuListV(),
      transition: Transition.fade,
    ),
    GetPage(
      name: ExampleModuleRouterS.tudetail,
      page: () => ExampleTuDetailV(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: ExampleModuleRouterS.tuOnlyImage,
      page: () => ExampleTuOnlyImageV(),
      transition: Transition.fadeIn,
    ),
  ];
}
