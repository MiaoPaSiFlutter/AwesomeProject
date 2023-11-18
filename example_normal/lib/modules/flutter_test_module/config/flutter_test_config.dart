import 'package:hzy_common_module/hzy_common_module.dart';

import 'package:animation_demo/animation_demo.dart';
import 'package:canvas_demo/canvas_demo.dart';
import 'package:common_demo/common_demo.dart';
import 'package:extended_sliver_demo/extended_sliver_demo.dart';
import 'package:scrollerview_demo/scrollerview_demo.dart';

class FlutterTestConfig {
  List itemList = [
    HzyNormalItemModel(
      leftMsg: "extended_sliver_demo",
      router: ExtendedSliverModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "scrollerview_demo",
      router: ScrollerDemoModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "animation_demo",
      router: AnimationDemoModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "canvas_demo",
      router: CanvasDemoModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "common_demo",
      router: CommonDemoModuleRouterS.HOME,
    ),

    /// 按钮
  ];
}
