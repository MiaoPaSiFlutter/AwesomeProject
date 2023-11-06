import 'package:animation_demo/animation_demo.dart';
import 'package:canvas_demo/canvas_demo.dart';
import 'package:common_demo/common_demo.dart';
import 'package:example_normal/config/routers/project_routers.dart';
import 'package:example_normal/modules/example_module/routers/example_module_pages.dart';
import 'package:example_normal/modules/my_module/routers/my_module_pages.dart';
import 'package:flutter_black_hole/flutter_black_hole.dart';
import 'package:flutter_books/flutter_books.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app.dart';
// 京东模块儿
import 'package:flutter_jd/flutter_jd.dart';
import 'package:extended_sliver_demo/extended_sliver_demo.dart';
import 'package:flutter_mitchkoko/flutter_mitchkoko.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';
import 'package:flutter_weather/flutter_weather.dart';
import 'package:scrollerview_demo/scrollerview_demo.dart';

import '../dataconfig/page_id_config.dart';

class RouterS {
  static getAllRoutS() {
    return [
      ...ProjectPageS.routers,
      ...MyModulePages.routerS,
      ...ExampleModulePageS.routerS,
      ...JingdongModulePagesS.routerS,
      ...ExtendedSliverModulePagesS.routerS,
      ...ScrollerDemoModulePagesS.routerS,
      ...AnimationDemoModulePagesS.routerS,
      ...CanvasDemoModulePagesS.routerS,
      ...CommonDemoModulePagesS.routerS,
      ...BooksModulePagesS.routerS,
      ...MitchkokoModulePagesS.routerS,
      ...WeatherModulePagesS.routerS,
      ...BlackHoleModulePagesS.routerS,
      ...MuetAttendanceTakingModulePagesS.routerS,
      ...FoodHubAppModulePagesS.routerS,
    ];
  }

  // 设置默认入口页
  static configNoramlRouts() {
    return PageIdConfig.index;
  }
}
