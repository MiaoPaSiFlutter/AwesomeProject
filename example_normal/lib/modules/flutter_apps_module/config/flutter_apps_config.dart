import 'package:hzy_common_module/hzy_common_module.dart';

import 'package:flutter_black_hole/flutter_black_hole.dart';
import 'package:flutter_books/flutter_books.dart';
import 'package:flutter_chatgpt_app/flutter_chatgpt_app.dart';
import 'package:flutter_crypto_market_app/flutter_crypto_market_app.dart';
import 'package:flutter_fitness_app/flutter_fitness_app.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app.dart';
import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter_marketky_app/flutter_marketky_app.dart';
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
      leftMsg:
          "ChatGPT 🤖 是一款基于 Flutter 的移动应用程序，带来了强大的 AI 聊天功能。  它提供了增强的移动 UI/UX、建议问题列表、可自定义的聊天主题、多个聊天主题、启动屏幕、更改 ChatGPT AI 模型的能力以及在主屏幕上添加的 Rive 动画。",
      router: ChatGPTAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "京东",
      router: JingDongModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "书城",
      router: BooksModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "天气",
      router: WeatherModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一款开源的音乐播放器应用程序！",
      router: BlackHoleModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "通过手机记录学生的出勤情况，并生成文本或图像形式的报告",
      router: MuetAttendanceTakingModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一个美食中心APP",
      router: FoodHubAppModuleRouterS.HOME,
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
      leftMsg: "一款健身应用的UI模板APP",
      router: FitnessAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一款元素周期表及元素3D模型的APP",
      router: PeriodicTableAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一款计划｜待办事项的UI模板APP",
      router: ToDoAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: "一个商城类的UI界面的APP",
      router: MarketkyAppModuleRouterS.HOME,
    ),
    HzyNormalItemModel(
      leftMsg: '''一个显示有关加密货币硬币的实时数据和详细信息的APP''',
      router: CryptoMarketAppModuleRouterS.HOME,
    ),

    /// 按钮
  ];
}
