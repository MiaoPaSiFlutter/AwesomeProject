import 'package:flutter_black_hole/flutter_black_hole/pages/BlackHoleApp.dart';
import 'package:flutter_crypto_market_app/flutter_crypto_market_app/pages/CryptoMarketApp.dart';
import 'package:flutter_fitness_app/flutter_fitness_app/pages/FitnessApp.dart';
import 'package:flutter_jd/flutter_jd/pages/JdHubApp.dart';
import 'package:flutter_marketky_app/flutter_marketky_app/pages/MarketkyApp.dart';
import 'package:flutter_valorant_app/flutter_valorant_app/pages/ValorantInfoApp.dart';
import 'package:flutter_books/flutter_books/pages/BooksApp.dart';
import 'package:flutter_chatgpt_app/flutter_chatgpt_app/pages/ChatGptApp.dart';
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

      // InterestingUIModel(
      //     title: '漂亮、干净的在线商店应用程序 UI',
      //     description: '',
      //     date: '2020年9月16日',
      //     tags: ['商店'],
      //     gifOrPictures: ['screenshots/ECommerceComplateAppUI.gif'],
      //     app: const ECommerceComplateAppUI(),
      //     author: 'The Flutter Way',
      //     url:
      //         'https://www.youtube.com/watch?v=YEJPg2jwzI8&list=PLxUBb2A_UUy8OlaNZpS2mfL8xpHcnd_Af'),
      // InterestingUIModel(
      //     title: '电子商务移动应用模板',
      //     description: '',
      //     date: '2020年7月3日',
      //     tags: ['商店'],
      //     gifOrPictures: ['screenshots/ECommerceMobileAppUI.gif'],
      //     app: ECommerceMobileAppUI(),
      //     author: 'The Flutter Way',
      //     url: 'https://www.youtube.com/watch?v=XBKzpTz65Io'),

      // InterestingUIModel(
      //     title: '现代智能家居 UI',
      //     description: '',
      //     date: '2022年11月10日',
      //     tags: ['智能家居'],
      //     gifOrPictures: ['screenshots/ModernSmartHomeUIApp.gif'],
      //     app: const ModernSmartHomeUIApp(),
      //     author: 'Mitch Koko',
      //     url: 'https://youtu.be/FMV8pbz0sN8'),
      // InterestingUIModel(
      //     title: 'Google And Apple Login Page',
      //     description: '',
      //     date: '2022年12月12日',
      //     tags: ['登录页'],
      //     gifOrPictures: ['screenshots/EmailLoginLogoutUI.gif'],
      //     app: const EmailLoginLogoutUI(),
      //     author: 'Mitch Koko',
      //     url: 'https://youtu.be/_3W-JuIVFlg'),
      // InterestingUIModel(
      //     title: '甜甜圈应用程序用户界面',
      //     description: '',
      //     date: '2022年11月4日',
      //     tags: ['甜甜圈应用'],
      //     gifOrPictures: ['screenshots/DonutAppUI.gif'],
      //     app: const DonutAppUI(),
      //     author: 'Mitch Koko',
      //     url: 'https://youtu.be/OmYL-VK75-o'),
      // InterestingUIModel(
      //     title: '手机罗盘',
      //     description: '',
      //     date: '2022年10月10日',
      //     tags: ['罗盘'],
      //     gifOrPictures: ['screenshots/CompassUI.gif'],
      //     app: const CompassUI(),
      //     author: 'Mitch Koko',
      //     url: 'https://youtu.be/hjVkrAaonWI'),
      // InterestingUIModel(
      //     title: '习惯追踪器应用程序',
      //     description: '',
      //     date: '2022年10月4日',
      //     tags: ['习惯追踪'],
      //     gifOrPictures: ['screenshots/HabitTrackerUI.gif'],
      //     app: const HabitTrackerUI(),
      //     author: 'Mitch Koko',
      //     url: 'https://youtu.be/2VKpq4h3Sdw'),
      // InterestingUIModel(
      //     title: 'NFT应用程序',
      //     description: '',
      //     date: '2022年9月9日',
      //     tags: ['NFT'],
      //     gifOrPictures: ['screenshots/NFTappuiUI.gif'],
      //     app: const NFTappuiUI(),
      //     author: 'Mitch Koko',
      //     url: 'https://youtu.be/KqNB2rCiNd4'),
      // InterestingUIModel(
      //     title: '编写数学游戏',
      //     description: '',
      //     date: '2022年7月24日',
      //     tags: ['游戏'],
      //     gifOrPictures: ['screenshots/MathGameUI.gif'],
      //     app: const MathGameUI(),
      //     author: 'Mitch Koko',
      //     url: 'https://youtu.be/2FmDfpI7jPM'),
      // InterestingUIModel(
      //     title: '音乐播放器应用程序',
      //     description: '',
      //     date: '2022年6月24日',
      //     tags: ['音乐播放器'],
      //     gifOrPictures: ['screenshots/MusicplayerUI.gif'],
      //     app: const MusicplayerUI(),
      //     author: 'Mitch Koko',
      //     url: 'https://www.youtube.com/watch?v=mf2CoM7btfQ'),
      // InterestingUIModel(
      //     title: '转动车轮效果',
      //     description: '',
      //     date: '2021年12月20日',
      //     tags: ['车轮效果'],
      //     gifOrPictures: ['screenshots/WheelscrollUI.gif'],
      //     app: const WheelscrollUI(),
      //     author: 'Mitch Koko',
      //     url: 'https://github.com/mitchkoko/wheelscroll'),
      // InterestingUIModel(
      //     title: 'TIKTOK 风格滚动',
      //     description: '',
      //     date: '2021年11月29日',
      //     tags: ['TIKTOK 风格滚动'],
      //     gifOrPictures: ['screenshots/TiktokscrollUI.gif'],
      //     app: const TiktokscrollUI(),
      //     author: 'Mitch Koko',
      //     url: 'https://youtu.be/Gqp0_ZTeH8g'),
      // InterestingUIModel(
      //     title: '响应式欢迎、登录和注册页面',
      //     description: '',
      //     date: '2020年4月29日',
      //     tags: ['响应式'],
      //     gifOrPictures: ['screenshots/ResponsiveWelcomeLoginAndSignUpUI.gif'],
      //     app: const ResponsiveWelcomeLoginAndSignUpUI(),
      //     author: 'The Flutter Way',
      //     url: 'https://www.youtube.com/watch?v=8gJ_WRmxyW0'),
      // InterestingUIModel(
      //     title: '每日锻炼应用程序',
      //     description: '',
      //     date: '2020年9月15日',
      //     tags: ['锻炼'],
      //     gifOrPictures: ['screenshots/MeditationAppUI.gif'],
      //     app: MeditationAppUI(),
      //     author: 'The Flutter Way',
      //     url: 'https://www.youtube.com/watch?v=qQ75cxc5q8o'),
      // InterestingUIModel(
      //     title: '测验应用程序',
      //     description: '',
      //     date: '2022年3月11日',
      //     tags: ['测验'],
      //     gifOrPictures: ['screenshots/QuizAppUI.gif'],
      //     app: QuizAppUI(),
      //     author: 'The Flutter Way',
      //     url: 'https://www.youtube.com/watch?v=Nhy0VWAMsFU'),
    ]);
  }
}
