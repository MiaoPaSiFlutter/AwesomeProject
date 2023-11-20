import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';
import 'package:flutter_nimbus_app/flutter_nimbus_app.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app.dart';
import 'package:flutter_periodic_table_app/flutter_periodic_table_app.dart';
import 'package:flutter_to_do_app/flutter_to_do_app.dart';
import 'package:flutter_weather/flutter_weather.dart';

class FlutterAppsConfig {
  List itemList = [
    HzyNormalItemModel(
      leftMsg: "天气",
      router: WeatherModuleRouterS.HOME,
    ),

    HzyNormalItemModel(
      leftMsg: "通过手机记录学生的出勤情况，并生成文本或图像形式的报告",
      router: MuetAttendanceTakingModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一个在线售卖门票的APP - api已不可用",
      router: PaytabsTicketsModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一个壁纸的APP",
      router: OorbsWallpaperModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一个个人博客类UI的 WEB & APP",
      router: NimbusAppModuleRouterS.HOME,
    ),

    HzyNormalItemModel(
      leftMsg: "一款元素周期表及元素3D模型的APP",
      router: PeriodicTableAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一款计划｜待办事项的UI模板APP",
      router: ToDoAppModuleRouterS.HOME,
    ),


    /// 按钮
  ];
}
