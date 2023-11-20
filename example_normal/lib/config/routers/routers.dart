import 'package:animation_demo/animation_demo.dart';
import 'package:canvas_demo/canvas_demo.dart';
import 'package:common_demo/common_demo.dart';
import 'package:example_normal/config/routers/project_routers.dart';
import 'package:example_normal/modules/example_module/routers/example_module_pages.dart';
import 'package:example_normal/modules/my_module/routers/my_module_pages.dart';
// 京东模块儿
import 'package:extended_sliver_demo/extended_sliver_demo.dart';
import 'package:flutter_mitchkoko/flutter_mitchkoko.dart';
import 'package:scrollerview_demo/scrollerview_demo.dart';

import '../dataconfig/page_id_config.dart';

class RouterS {
  static getAllRoutS() {
    return [
      ...ProjectPageS.routers,
      ...MyModulePages.routerS,
      ...ExampleModulePageS.routerS,
      ...ExtendedSliverModulePagesS.routerS,
      ...ScrollerDemoModulePagesS.routerS,
      ...AnimationDemoModulePagesS.routerS,
      ...CanvasDemoModulePagesS.routerS,
      ...CommonDemoModulePagesS.routerS,
      ...MitchkokoModulePagesS.routerS,
    ];
  }

  // 设置默认入口页
  static configNoramlRouts() {
    return PageIdConfig.index;
  }
}
