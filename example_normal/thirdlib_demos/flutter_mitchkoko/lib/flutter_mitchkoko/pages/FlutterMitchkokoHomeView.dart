import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'AnalogClockLightDarkThemeUI/AnalogClockLightDarkThemeUI.dart';
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

class FlutterMitchkokoHomeView extends StatelessWidget {
  const FlutterMitchkokoHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mitchkoko"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ..._buildCommonList(),
              ..._buildAzlistviewUseList(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCommonList() {
    List<Widget> list = [];
    list.addAll([
      createSectionTitle('JD'),
      createCommonItem("模拟时钟明暗主题 - Flutter UI", AnalogClockLightDarkThemeUI()),
      createCommonItem(
          "使用 #Flutter 打造漂亮、干净的在线商店应用程序 UI。", ECommerceComplateAppUI()),
      createCommonItem("Flutter 电子商务移动应用模板", ECommerceMobileAppUI()),
      createCommonItem("Flutter视差滚动效果预览", ParallaxEffectUI()),
      createCommonItem("现代智能家居 UI x Flutter", ModernSmartHomeUIApp()),
      createCommonItem("使用 Firebase 通过电子邮件登录和注销。", EmailLoginLogoutUI()),
      createCommonItem("Donut 应用程序 UI • Flutter", DonutAppUI()),
      createCommonItem("手机罗盘 • Flutter", CompassUI()),
      createCommonItem(
          "用 Flutter 制作的功能齐全的习惯追踪器应用程序！  我使用 Hive 作为本地存储后端，还使用了热图包！",
          HabitTrackerUI()),
      createCommonItem("这是一个有趣的用户界面，看起来很酷！", NFTappuiUI()),
      createCommonItem("编写数学游戏", MathGameUI()),
      createCommonItem(
          "一个音乐播放器应用程序，例如使用同质化主题的 Spotify 或 Apple Music：DI 喜欢同质化呵呵。",
          MusicplayerUI()),
      createCommonItem(
          "ListWheelScrollView和ListView同源，但它的渲染效果类似于车轮（或者滚筒），它不是在平面上滑动，而是转动车轮",
          WheelscrollUI()),
      createCommonItem("TIKTOK 风格滚动 • PAGEVIEW", TiktokscrollUI()),
      createCommonItem("动画智能家居应用程序 • 视差效果", SmartHomeAnimatedAppUI()),
      createCommonItem(
          "响应式欢迎、登录和注册页面 - Flutter UI", ResponsiveWelcomeLoginAndSignUpUI()),
      createCommonItem("每日锻炼应用程序 - App", MeditationAppUI()),
      createCommonItem("测验应用程序 - App", QuizAppUI()),
    ]);
    return list;
  }

  List<Widget> _buildAzlistviewUseList() {
    List<Widget> list = [];
    list.addAll([
      createSectionTitle('其他'),
    ]);
    return list;
  }
}

Widget createSectionTitle(String text) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(5),
    color: Colors.blueAccent,
    child: Text("🔥$text"),
  );
}

Widget createCommonItem(String text, Widget nextWidget) {
  return InkWell(
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Text(text),
    ),
    onTap: () {
      //OrientationBuilder
      Navigator.of(Get.context!).push(MaterialPageRoute(builder: (_) {
        return nextWidget;
      }));
    },
  );
}
