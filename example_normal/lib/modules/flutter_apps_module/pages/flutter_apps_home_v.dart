import 'package:flutter_black_hole/flutter_black_hole/pages/BlackHoleApp.dart';
import 'package:flutter_chat_app/flutter_chat_app/pages/ChatApp.dart';
import 'package:flutter_crypto_market_app/flutter_crypto_market_app/pages/CryptoMarketApp.dart';
import 'package:flutter_fitness_app/flutter_fitness_app/pages/FitnessApp.dart';
import 'package:flutter_jd/flutter_jd/pages/JdHubApp.dart';
import 'package:flutter_marketky_app/flutter_marketky_app/pages/MarketkyApp.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app/pages/MuetAttendanceTakingApp.dart';
import 'package:flutter_nimbus_app/flutter_nimbus_app/pages/FlutterNimbusApp.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app/pages/OorbsWallpaperApp.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app/pages/PaytabsTicketsApp.dart';
import 'package:flutter_periodic_table_app/flutter_periodic_table_app/pages/PeriodicTableApp.dart';
import 'package:flutter_to_do_app/flutter_to_do_app/pages/ToDoApp.dart';
import 'package:flutter_valorant_app/flutter_valorant_app/pages/ValorantInfoApp.dart';
import 'package:flutter_books/flutter_books/pages/BooksApp.dart';
import 'package:flutter_chatgpt_app/flutter_chatgpt_app/pages/ChatGptApp.dart';
import 'package:flutter_weather/flutter_weather/pages/FlutterWeatherApp.dart';
import 'package:flutter_compass_app/flutter_compass_app/pages/CompassApp.dart';
import 'package:flutter_quiz_app/flutter_quiz_app/pages/FlutterQuizApp.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';

import '../../../compontents/interesting_ui_widget.dart';
import '../../../models/interesting_ui_model.dart';

class FlutterAppsHomePage extends CommonGetXWidget<FlutterAppsHomeController> {
  FlutterAppsHomePage({Key? key}) : super(key: key);
  @override
  FlutterAppsHomeController get controller =>
      Get.put(FlutterAppsHomeController());
  @override
  bool configSafeAreaTop() => false;
  @override
  bool configIsShowAppBar() => false;

  @override
  Widget createScallBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    return const AppsHomePage();
  }
}

class AppsHomePage extends StatefulWidget {
  const AppsHomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return AppsHomePageState();
  }
}

class AppsHomePageState extends CommonState<AppsHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  String? createAppBarTitleStr() => LaunchIdConfig.flutterApp.tr;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return createBuild(context: context);
  }

  @override
  Widget createScallBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    return GetBuilder<FlutterAppsHomeController>(
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.uiModels.length,
          itemBuilder: (context, index) {
            return InterestingUIWidget(model: controller.uiModels[index]);
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class FlutterAppsHomeController extends CommonGetXController {
  FlutterAppsHomeController();

  var uiModels = [].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  /// give access to currentContext
  BuildContext? get context => Get.context;

  getData() {
    uiModels.assignAll([
      InterestingUIModel(
          title: 'ChatApp',
          description: '',
          date: '2022年3月11日',
          tags: ['测验'],
          app: ChatApp(),
          author: 'abuanwar072 - Github',
          url: 'https://github.com/abuanwar072/Quiz-App-Flutter'),
      InterestingUIModel(
          title: '一款测验应用程序',
          description: '',
          date: '2022年3月11日',
          tags: ['测验'],
          app: FlutterQuizApp(),
          author: 'abuanwar072 - Github',
          url: 'https://github.com/abuanwar072/Quiz-App-Flutter'),
      InterestingUIModel(
          title: '一款指南针展示',
          description: '',
          date: '2020年9月16日',
          tags: ['商店'],
          app: const CompassApp(),
          author: '',
          url: ''),
      InterestingUIModel(
          title: '一款天气APP',
          description: '',
          date: '2022年10月2日',
          tags: ['天气'],
          app: const FlutterWeatherApp(),
          author: 'MasteerRui - Github',
          url: 'https://github.com/MasteerRui/WeatherApp-Flutter'),
      InterestingUIModel(
          title: '一款计划｜待办事项的UI模板APP',
          description: '',
          date: '2022年10月2日',
          tags: ['待办事项'],
          app: const ToDoApp(),
          author: '??? - Github',
          url: ''),
      InterestingUIModel(
          title: '一款元素周期表及元素3D模型的APP',
          description: '',
          date: '2022年10月2日',
          tags: ['3D'],
          app: const PeriodicTableApp(),
          author: 'berkayceylan - Github',
          url: 'https://github.com/berkayceylan/periodic_table_flutter'),
      InterestingUIModel(
          title: '一个在线售卖门票的APP - api已不可用',
          description: '',
          date: '2022年10月2日',
          tags: ['门票'],
          app: const PaytabsTicketsApp(),
          author: 'paytabscom - Github',
          url: 'https://github.com/paytabscom/paytabs-tickets-demo-flutter'),
      InterestingUIModel(
          title: '一个壁纸的APP',
          description: '',
          date: '2022年10月2日',
          tags: ['壁纸'],
          app: const OorbsWallpaperApp(),
          author: 'barandenizdogan - Github',
          url: 'https://github.com/barandenizdogan/OORBSWALLPAPER'),
      InterestingUIModel(
          title: '一个个人博客类UI的 WEB & APP',
          description: '',
          date: '2022年10月2日',
          tags: ['博客'],
          app: const FlutterNimbusApp(),
          author: 'david-legend - Github',
          url: 'https://github.com/david-legend/nimbus'),
      InterestingUIModel(
          title: '一个通过手机记录学生的出勤情况，并生成文本或图像形式的报告的APP',
          description: '',
          date: '2022年10月2日',
          tags: ['手机记录'],
          app: const MuetAttendanceTakingApp(),
          author: 'rashidwassan - Github',
          url: 'https://github.com/rashidwassan/muet-attendance-taking-app'),
      InterestingUIModel(
          title: '一个免费的 Flutter 电子商务应用程序入门模板',
          description: '',
          date: '2022年10月2日',
          tags: ['商城'],
          app: const MarketkyApp(),
          author: 'mrezkys - Github',
          url: 'https://github.com/mrezkys/marketky'),
      InterestingUIModel(
          title: '仿京东APP',
          description: '',
          date: '2022年10月2日',
          tags: [''],
          app: const JdHubApp(),
          author: 'ZYHB - Github',
          url: ''),
      InterestingUIModel(
          title: '一款健身应用的UI模板APP',
          description: '',
          date: '2022年10月2日',
          tags: ['健身'],
          app: const FitnessApp(),
          author: 'HypeTeqSoftware - Github',
          url: 'https://github.com/HypeTeqSoftware/FitnessApp'),
      InterestingUIModel(
          title: '一个显示有关加密货币硬币的实时数据和详细信息的APP',
          description: '',
          date: '2022年10月2日',
          tags: ['折线图'],
          app: const CryptoMarketApp(),
          author: 'HypeTeqSoftware - Github',
          url: 'https://github.com/HypeTeqSoftware/CryptoMarketApp'),
      InterestingUIModel(
          title:
              'ChatGPT 带来了强大的 AI 聊天功能。它提供了增强的移动 UI/UX、建议问题列表、可自定义的聊天主题、多个聊天主题、启动屏幕、更改 ChatGPT AI 模型的能力以及在主屏幕上添加的 Rive 动画。',
          description: '',
          date: '2022年10月2日',
          tags: ['ChatGPT', '主题', '动画'],
          app: const ChatGPTApp(),
          author: 'HypeTeqSoftware - Github',
          url: 'https://github.com/HypeTeqSoftware/ChatGPTApp'),
      InterestingUIModel(
          title: '一款 Panda看书，Flutter 小说阅读 App ',
          description: '',
          date: '2022年10月2日',
          tags: ['小说阅读'],
          app: const BooksApp(),
          author: 'kevinsu9999 - Gitee',
          url: 'https://gitee.com/kevinsu9999/flutter_books'),
      InterestingUIModel(
          title: '一款开源的音乐播放器应用程序！',
          description: '',
          date: '2022年10月2日',
          tags: ['音乐播放器'],
          app: const BlackHoleApp(),
          author: 'Sangwan5688 - Github',
          url: 'https://github.com/Sangwan5688/BlackHole'),
      InterestingUIModel(
          title: '一款游戏《无畏契约》资料的UI模板APP',
          description: '',
          date: '2023年3月20日',
          tags: ['游戏资料'],
          app: const ValorantInfoApp(),
          author: 'ZahaanMahajan - Github',
          url: 'https://github.com/ZahaanMahajan/Valorant-Info'),
    ]);
  }
}
