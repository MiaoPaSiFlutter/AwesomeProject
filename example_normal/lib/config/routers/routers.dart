import 'package:animation_demo/animation_demo.dart';
import 'package:canvas_demo/canvas_demo.dart';
import 'package:common_demo/common_demo.dart';
import 'package:example_normal/config/routers/project_routers.dart';
import 'package:example_normal/modules/example_module/routers/example_module_pages.dart';
import 'package:example_normal/modules/my_module/routers/my_module_pages.dart';
// 京东模块儿
import 'package:extended_sliver_demo/extended_sliver_demo.dart';
import 'package:flutter_mitchkoko/flutter_mitchkoko.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';
import 'package:flutter_nimbus_app/flutter_nimbus_app.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app.dart';
import 'package:flutter_periodic_table_app/flutter_periodic_table_app.dart';
import 'package:flutter_weather/flutter_weather.dart';
import 'package:scrollerview_demo/scrollerview_demo.dart';
import 'package:flutter_to_do_app/flutter_to_do_app.dart';

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
      ...WeatherModulePagesS.routerS,
      ...MuetAttendanceTakingModulePagesS.routerS,
      ...PaytabsTicketsModulePagesS.routerS,
      ...OorbsWallpaperModulePagesS.routerS,
      ...NimbusAppModulePagesS.routerS,
      ...PeriodicTableAppModulePagesS.routerS,
      ...ToDoAppModulePagesS.routerS,
    ];
  }

  // 设置默认入口页
  static configNoramlRouts() {
    return PageIdConfig.index;
  }
}
