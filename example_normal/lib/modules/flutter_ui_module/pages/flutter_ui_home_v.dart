import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';
import 'package:ui_coffe_app/ui_coffe_app/pages/UICoffeApp.dart';
import 'package:ui_food_app/ui_food_app/pages/UIFoodApp.dart';
import 'package:ui_tesla_app/ui_tesla_app/pages/UITeslaApp.dart';
import '../../../compontents/interesting_ui_widget.dart';
import '../../../models/interesting_ui_model.dart';

class FlutterUIHomePage extends CommonGetXWidget<FlutterUIHomeController> {
  FlutterUIHomePage({Key? key}) : super(key: key);
  @override
  FlutterUIHomeController get controller => Get.put(FlutterUIHomeController());
  @override
  bool configSafeAreaTop() => false;
  @override
  bool configIsShowAppBar() => false;

  @override
  Widget createScallBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    return const UIHomePage();
  }
}

class UIHomePage extends StatefulWidget {
  const UIHomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return UIHomePageState();
  }
}

class UIHomePageState extends CommonState<UIHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  String? createAppBarTitleStr() => LaunchIdConfig.flutterUI.tr;

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
    return GetBuilder<FlutterUIHomeController>(
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

class FlutterUIHomeController extends CommonGetXController {
  FlutterUIHomeController();

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
          title: '一个食品应用程序概念动画',
          description: '',
          date: '2023年3月20日',
          tags: ['动画'],
          app: const UIFoodApp(),
          author: 'IZriouil - Github',
          url: 'https://github.com/IZriouil/food_app'),
      InterestingUIModel(
          title: '一个好看流畅的UI动画的咖啡APP',
          description: '',
          date: '2023年3月20日',
          tags: ['动画', '咖啡'],
          app: const UICoffeApp(),
          author: 'IZriouil - Github',
          url: 'https://github.com/IZriouil/coffee_app'),
      InterestingUIModel(
          title: '一个特斯拉汽车在线销售的UI模板APP',
          description: '',
          date: '2023年3月20日',
          tags: ['特斯拉'],
          app: UITeslaApp(),
          author: 'vegasandroid - Github',
          url: 'https://github.com/vegasandroid/tesla-app'),
      // InterestingUIModel(
      //     title: '一款游戏《无畏契约》资料的UI模板APP',
      //     description: '',
      //     date: '2023年3月20日',
      //     tags: ['游戏资料'],
      //     gifOrPictures: ['screenshots/ValorantInfoAppUI.gif'],
      //     app: ValorantInfoAppUI(),
      //     author: 'ZahaanMahajan - Github',
      //     url: 'https://github.com/ZahaanMahajan/Valorant-Info'),
      // InterestingUIModel(
      //     title: '一款收付款和记账本的UI模板APP',
      //     description: '',
      //     date: '2022年3月12日',
      //     tags: ['收付款', '记账本'],
      //     gifOrPictures: ['screenshots/PayNowEWalletAppUI.gif'],
      //     app: PayNowEWalletAppUI(),
      //     author: '0xayman - Github',
      //     url: 'https://github.com/0xayman/Pay-Now-E-Wallet-App'),
      // InterestingUIModel(
      //     title: '一款智能家具应用的UI模板APP',
      //     description: '',
      //     date: '2022年3月12日',
      //     tags: ['智能家具'],
      //     gifOrPictures: ['screenshots/SmartHomeAppUI.gif'],
      //     app: SmartHomeAppUI(),
      //     author: 'zillur07 - Github',
      //     url: 'https://github.com/zillur07/Flutter-Smart-Home-App'),
      // InterestingUIModel(
      //     title: '一个美食评价打分的APP',
      //     description: '',
      //     date: '2022年3月12日',
      //     tags: ['自适应'],
      //     gifOrPictures: ['screenshots/FoodybiteAppUI.gif'],
      //     app: const FoodybiteAppUI(),
      //     author: 'david-legend - Github',
      //     url: 'https://github.com/david-legend/foodybite'),
      // InterestingUIModel(
      //     title: '一个基于GetX的Dashboard纯UI界面自适应手机、平板、web的模板APP',
      //     description: '',
      //     date: '2022年3月12日',
      //     tags: ['自适应'],
      //     gifOrPictures: ['screenshots/FDManagementUI.gif'],
      //     app: const FDManagementUI(),
      //     author: 'firgia - Github',
      //     url: 'https://github.com/firgia/FD-Project-Management'),
      // InterestingUIModel(
      //     title: '一个包含动画，收藏，删除和切换主题等功能UI的邮件类APP',
      //     description: '',
      //     date: '2022年4月24日',
      //     tags: ['动画', '切换主题'],
      //     gifOrPictures: ['screenshots/MotionAnimationsReplyUI.gif'],
      //     app: const MotionAnimationsReplyUI(),
      //     author: 'gokhankar - Github',
      //     url: 'https://github.com/gokhankar/flutter_motion_animations_reply'),
      // InterestingUIModel(
      //     title: '一个基于GetX的Dashboard纯UI界面自适应手机、平板、web的模板APP',
      //     description: '',
      //     date: '2021年12月5日',
      //     tags: ['自适应'],
      //     gifOrPictures: ['screenshots/FDDailyTaskAppUI.gif'],
      //     app: const FDDailyTaskAppUI(),
      //     author: 'firgia - Github',
      //     url: 'https://github.com/firgia/FD-Daily-Task'),
      // InterestingUIModel(
      //     title: '一个博客论坛的APP',
      //     description: '',
      //     date: '2022年6月10日',
      //     tags: ['Instagram'],
      //     gifOrPictures: ['screenshots/BlogClubAppUI.gif'],
      //     app: const BlogClubAppUI(),
      //     author: 'hojat2079 - Github',
      //     url:
      //         'https://github.com/hojat2079/FlutterUiSample/tree/main/01-BlogClub'),
      // InterestingUIModel(
      //     title: '一个仿 Facebook UI 的APP',
      //     description: '',
      //     date: '2022年6月10日',
      //     tags: ['Instagram'],
      //     gifOrPictures: ['screenshots/FacebookUIRedesignUI.gif'],
      //     app: const FacebookUIRedesignUI(),
      //     author: 'Mhassanbughio - Github',
      //     url: 'https://github.com/Mhassanbughio/Facbook_UI_Flutter'),
      // InterestingUIModel(
      //     title: '一个仿 Instagram UI 的APP',
      //     description: '',
      //     date: '2022年11月6日',
      //     tags: ['Instagram'],
      //     gifOrPictures: ['screenshots/InstagramUIRedesignUI.gif'],
      //     app: const InstagramUIRedesignUI(),
      //     author: 'anasfik - Github',
      //     url: 'https://github.com/anasfik/instagram_ui_redesign'),
      // InterestingUIModel(
      //     title: '一个在线订票的APP',
      //     description: '',
      //     date: '2022年12月29日',
      //     tags: ['订票'],
      //     gifOrPictures: ['screenshots/TicketBookingAppUI.gif'],
      //     app: const TicketBookingAppUI(),
      //     author: 'theMistDev - Github',
      //     url: 'https://github.com/theMistDev/ticket-booking-app'),
      // InterestingUIModel(
      //     title: '一个日常费用和财务管理的APP',
      //     description: '',
      //     date: '2022年1月25日',
      //     tags: ['财务管理'],
      //     gifOrPictures: ['screenshots/TaskManagementAppUI.gif'],
      //     app: const TaskManagementAppUI(),
      //     author: 'MuriithiEric - Github',
      //     url: 'https://github.com/MuriithiEric/task_management.git'),
      // InterestingUIModel(
      //     title: '一个商城购物APP',
      //     description: '',
      //     date: '2022年10月30日',
      //     tags: ['商城'],
      //     gifOrPictures: ['screenshots/OnlineShoppingAppUI.gif'],
      //     app: const OnlineShoppingAppUI(),
      //     author: 'Mansurisodev - Github',
      //     url: 'https://github.com/Mansurisodev/online_shopping'),
      // InterestingUIModel(
      //     title: '一个旅行类的APP',
      //     description: '',
      //     date: '2022年11月16日',
      //     tags: ['购物'],
      //     gifOrPictures: ['screenshots/AnimatedTravelAppUI.gif'],
      //     app: const AnimatedTravelAppUI(),
      //     author: 'Hmida71 - Github',
      //     url: 'https://github.com/Hmida71/Animated-Travel-App-ui'),
      // InterestingUIModel(
      //     title: '一个购物类的APP',
      //     description: '',
      //     date: '2022年10月2日',
      //     tags: ['购物'],
      //     gifOrPictures: ['screenshots/ShoeAppUI.gif'],
      //     app: const ShoeAppUI(),
      //     author: 'rashidwassan - Github',
      //     url: 'https://github.com/rashidwassan/flutter-ecommerce-app-ui'),
      // InterestingUIModel(
      //     title: '一个基于GetX的登录｜注册｜忘记密码等基础界面的模板APP',
      //     description: '',
      //     date: '2022年6月10日',
      //     tags: ['登录', '注册', '忘记密码'],
      //     gifOrPictures: ['screenshots/GoplanAppUI.gif'],
      //     app: GoplanAppUI(),
      //     author: 'manushi7 - Github',
      //     url: 'https://github.com/manushi7/goplan-flutter'),
      // InterestingUIModel(
      //     title: '一个在线聊天简单UI的APP',
      //     description: '',
      //     date: '2022年8月12日',
      //     tags: ['聊天', '主题'],
      //     gifOrPictures: ['screenshots/ChatMessageAppUI.gif'],
      //     app: const ChatMessageAppUI(),
      //     author: 'swenes - Github',
      //     url: 'https://github.com/swenes/chat_message_app_FLUTTER'),
      // InterestingUIModel(
      //     title: '使用 Rive 和 Flutter 的动画应用程序',
      //     description: '使用 Rive 和 Flutter 的动画应用程序.',
      //     date: '2022年12月20日',
      //     tags: ['动画', 'Rive'],
      //     gifOrPictures: ['screenshots/AnimatedAppWithRiveUI.gif'],
      //     app: const AnimatedAppWithRiveUI(),
      //     author: 'The Flutter Way',
      //     url: 'https://www.youtube.com/watch?v=Td3xEWwRAQA'),
      // InterestingUIModel(
      //     title: '模拟时钟明暗主题',
      //     description:
      //         'We design a nice clean analog clock app UI by using flutter. Our clock supports both the Dark and Light theme. If you want to learn how to use both Light and Dark theme then it helps a lot.',
      //     date: '2020年8月28日',
      //     tags: ['明暗主题', '时钟'],
      //     gifOrPictures: ['screenshots/AnalogClockLightDarkThemeUI.gif'],
      //     app: const AnalogClockLightDarkThemeUI(),
      //     author: 'The Flutter Way',
      //     url: 'https://www.youtube.com/watch?v=u6Cfzng3Gek'),
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
      //     title: '视差滚动效果预览',
      //     description: '',
      //     date: '2023年10月13日',
      //     tags: ['视差滚动效果'],
      //     gifOrPictures: ['screenshots/ParallaxEffectUI.gif'],
      //     app: const ParallaxEffectUI(),
      //     author: 'The Flutter Way',
      //     url: 'https://www.youtube.com/watch?v=v_ozYdwKdaU'),
      // InterestingUIModel(
      //     title: '智能家居动画应用程序',
      //     description: '',
      //     date: '2023年10月22日',
      //     tags: ['智能家居'],
      //     gifOrPictures: ['screenshots/SmartHomeAnimatedAppUI.gif'],
      //     app: const SmartHomeAnimatedAppUI(),
      //     author: 'The Flutter Way',
      //     url: 'https://www.youtube.com/watch?v=7l-0x1Y7d1M'),
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
