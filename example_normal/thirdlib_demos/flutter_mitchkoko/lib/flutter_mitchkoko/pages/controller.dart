import 'package:flutter_mitchkoko/flutter_mitchkoko.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'AnalogClockLightDarkThemeUI/AnalogClockLightDarkThemeUI.dart';
import 'AnimatedAppWithRiveUI/AnimatedAppWithRiveUI.dart';
import 'CompassUI/CompassUI.dart';
import 'DonutAppUI/DonutAppUI.dart';
import 'ECommerceComplateAppUI/ECommerceComplateAppUI.dart';
import 'ECommerceMobileAppUI/ECommerceMobileAppUI.dart';
import 'EmailLoginLogoutUI/EmailLoginLogoutUI.dart';
import 'HabitTrackerUI/HabitTrackerUI.dart';
import 'MathGameUI/MathGameUI.dart';
import 'MeditationAppUI/MeditationAppUI.dart';
import 'ModernSmartHomeUI/ModernSmartHomeUIApp.dart';
import 'MusicplayerUI/MusicplayerUI.dart';
import 'NFTappuiUI/NFTappuiUI.dart';
import 'ParallaxEffectUI/ParallaxEffectUI.dart';
import 'QuizAppUI/QuizAppUI.dart';
import 'ResponsiveWelcomeLoginAndSignUpUI/ResponsiveWelcomeLoginAndSignUpUI.dart';
import 'SmartHomeAnimatedAppUI/SmartHomeAnimatedAppUI.dart';
import 'TiktokscrollUI/TiktokscrollUI.dart';
import 'WheelscrollUI/WheelscrollUI.dart';

class MitchkokoHomeController extends GetxController {
  MitchkokoHomeController();

  var uiModels = [].obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {
    uiModels.assignAll([
      InterestingUIModel(
          title: '使用 Rive 和 Flutter 的动画应用程序',
          description: '使用 Rive 和 Flutter 的动画应用程序.',
          date: '2022年12月20日',
          tags: ['动画', 'Rive'],
          gifOrPictures: ['screenshots/AnimatedAppWithRiveUI.gif'],
          app: const AnimatedAppWithRiveUI(),
          author: 'The Flutter Way',
          url: 'https://www.youtube.com/watch?v=Td3xEWwRAQA'),
      InterestingUIModel(
          title: '模拟时钟明暗主题',
          description:
              'We design a nice clean analog clock app UI by using flutter. Our clock supports both the Dark and Light theme. If you want to learn how to use both Light and Dark theme then it helps a lot.',
          date: '2020年8月28日',
          tags: ['明暗主题', '时钟'],
          gifOrPictures: ['screenshots/AnalogClockLightDarkThemeUI.gif'],
          app: const AnalogClockLightDarkThemeUI(),
          author: 'The Flutter Way',
          url: 'https://www.youtube.com/watch?v=u6Cfzng3Gek'),
      InterestingUIModel(
          title: '漂亮、干净的在线商店应用程序 UI',
          description: '',
          date: '2020年9月16日',
          tags: ['商店'],
          gifOrPictures: ['screenshots/ECommerceComplateAppUI.gif'],
          app: const ECommerceComplateAppUI(),
          author: 'The Flutter Way',
          url:
              'https://www.youtube.com/watch?v=YEJPg2jwzI8&list=PLxUBb2A_UUy8OlaNZpS2mfL8xpHcnd_Af'),
      InterestingUIModel(
          title: '电子商务移动应用模板',
          description: '',
          date: '2020年7月3日',
          tags: ['商店'],
          gifOrPictures: ['screenshots/ECommerceMobileAppUI.gif'],
          app: ECommerceMobileAppUI(),
          author: 'The Flutter Way',
          url: 'https://www.youtube.com/watch?v=XBKzpTz65Io'),
      InterestingUIModel(
          title: '视差滚动效果预览',
          description: '',
          date: '2023年10月13日',
          tags: ['视差滚动效果'],
          gifOrPictures: ['screenshots/ParallaxEffectUI.gif'],
          app: const ParallaxEffectUI(),
          author: 'The Flutter Way',
          url: 'https://www.youtube.com/watch?v=v_ozYdwKdaU'),
      InterestingUIModel(
          title: '智能家居动画应用程序',
          description: '',
          date: '2023年10月22日',
          tags: ['智能家居'],
          gifOrPictures: ['screenshots/SmartHomeAnimatedAppUI.gif'],
          app: const SmartHomeAnimatedAppUI(),
          author: 'The Flutter Way',
          url: 'https://www.youtube.com/watch?v=7l-0x1Y7d1M'),
      InterestingUIModel(
          title: '现代智能家居 UI',
          description: '',
          date: '2022年11月10日',
          tags: ['智能家居'],
          gifOrPictures: ['screenshots/ModernSmartHomeUIApp.gif'],
          app: const ModernSmartHomeUIApp(),
          author: 'Mitch Koko',
          url: 'https://youtu.be/FMV8pbz0sN8'),
      InterestingUIModel(
          title: 'Google And Apple Login Page',
          description: '',
          date: '2022年12月12日',
          tags: ['登录页'],
          gifOrPictures: ['screenshots/EmailLoginLogoutUI.gif'],
          app: const EmailLoginLogoutUI(),
          author: 'Mitch Koko',
          url: 'https://youtu.be/_3W-JuIVFlg'),
      InterestingUIModel(
          title: '甜甜圈应用程序用户界面',
          description: '',
          date: '2022年11月4日',
          tags: ['甜甜圈应用'],
          gifOrPictures: ['screenshots/DonutAppUI.gif'],
          app: const DonutAppUI(),
          author: 'Mitch Koko',
          url: 'https://youtu.be/OmYL-VK75-o'),
      InterestingUIModel(
          title: '手机罗盘',
          description: '',
          date: '2022年10月10日',
          tags: ['罗盘'],
          gifOrPictures: ['screenshots/CompassUI.gif'],
          app: const CompassUI(),
          author: 'Mitch Koko',
          url: 'https://youtu.be/hjVkrAaonWI'),
      InterestingUIModel(
          title: '习惯追踪器应用程序',
          description: '',
          date: '2022年10月4日',
          tags: ['习惯追踪'],
          gifOrPictures: ['screenshots/HabitTrackerUI.gif'],
          app: const HabitTrackerUI(),
          author: 'Mitch Koko',
          url: 'https://youtu.be/2VKpq4h3Sdw'),
      InterestingUIModel(
          title: 'NFT应用程序',
          description: '',
          date: '2022年9月9日',
          tags: ['NFT'],
          gifOrPictures: ['screenshots/NFTappuiUI.gif'],
          app: const NFTappuiUI(),
          author: 'Mitch Koko',
          url: 'https://youtu.be/KqNB2rCiNd4'),
      InterestingUIModel(
          title: '编写数学游戏',
          description: '',
          date: '2022年7月24日',
          tags: ['游戏'],
          gifOrPictures: ['screenshots/MathGameUI.gif'],
          app: const MathGameUI(),
          author: 'Mitch Koko',
          url: 'https://youtu.be/2FmDfpI7jPM'),
      InterestingUIModel(
          title: '音乐播放器应用程序',
          description: '',
          date: '2022年6月24日',
          tags: ['音乐播放器'],
          gifOrPictures: ['screenshots/MusicplayerUI.gif'],
          app: const MusicplayerUI(),
          author: 'Mitch Koko',
          url: 'https://www.youtube.com/watch?v=mf2CoM7btfQ'),
      InterestingUIModel(
          title: '转动车轮效果',
          description: '',
          date: '2021年12月20日',
          tags: ['车轮效果'],
          gifOrPictures: ['screenshots/WheelscrollUI.gif'],
          app: const WheelscrollUI(),
          author: 'Mitch Koko',
          url: 'https://github.com/mitchkoko/wheelscroll'),
      InterestingUIModel(
          title: 'TIKTOK 风格滚动',
          description: '',
          date: '2021年11月29日',
          tags: ['TIKTOK 风格滚动'],
          gifOrPictures: ['screenshots/TiktokscrollUI.gif'],
          app: const TiktokscrollUI(),
          author: 'Mitch Koko',
          url: 'https://youtu.be/Gqp0_ZTeH8g'),
      InterestingUIModel(
          title: '响应式欢迎、登录和注册页面',
          description: '',
          date: '2020年4月29日',
          tags: ['响应式'],
          gifOrPictures: ['screenshots/ResponsiveWelcomeLoginAndSignUpUI.gif'],
          app: const ResponsiveWelcomeLoginAndSignUpUI(),
          author: 'The Flutter Way',
          url: 'https://www.youtube.com/watch?v=8gJ_WRmxyW0'),
      InterestingUIModel(
          title: '每日锻炼应用程序',
          description: '',
          date: '2020年9月15日',
          tags: ['锻炼'],
          gifOrPictures: ['screenshots/MeditationAppUI.gif'],
          app: MeditationAppUI(),
          author: 'The Flutter Way',
          url: 'https://www.youtube.com/watch?v=qQ75cxc5q8o'),
      InterestingUIModel(
          title: '测验应用程序',
          description: '',
          date: '2022年3月11日',
          tags: ['测验'],
          gifOrPictures: ['screenshots/QuizAppUI.gif'],
          app: QuizAppUI(),
          author: 'The Flutter Way',
          url: 'https://www.youtube.com/watch?v=Nhy0VWAMsFU'),
    ]);
  }
}
