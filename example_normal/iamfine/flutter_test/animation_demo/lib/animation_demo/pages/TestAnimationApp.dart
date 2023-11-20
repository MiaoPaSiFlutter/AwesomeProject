import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'animation_demo/animation_card/animation_card_page.dart';
import 'animation_demo/animation_longpress/animation_longpress_page.dart';
import 'animation_demo/animation_number_switcher/animation_number_switcher_page1.dart';
import 'animation_demo/animation_pie/animagtion_pie_page2.dart';
import 'animation_demo/animation_pie/animagtion_pie_page1.dart';
import 'animation_demo/animation_wave/animation_wave_login_page.dart';
import 'animation_demo/animation_flash/animation_flash_page.dart';
import 'animation_demo/animation_hero/animation_hero_page.dart';
import 'animation_demo/animation_hero/animation_hero_show_imgpage_page.dart';
import 'animation_demo/animation_tabbar/animation_tabbar_page.dart';
import 'animation_demo/animation_custompaint/animation_rect_path_page.dart';

class TestAnimationApp extends GetView<TestAnimationAppController> {
  const TestAnimationApp({super.key});

  @override
  TestAnimationAppController get controller =>
      Get.put(TestAnimationAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class TestAnimationAppController extends GetxController {
  TestAnimationAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('一些动效'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createCommonItem("Card隐藏、出现动画", const AnimationCardPage()),
            createCommonItem("闪光动画", const AnimationFlashPage()),
            createCommonItem("水波纹 - 登录", const AnimationWaveLoginPage()),
            createCommonItem("数字切换-动画", const AnimationNumberSwitcherPage1()),
            createCommonItem("Hero 动画1", const AnimationHeroPage()),
            createCommonItem("Hero 动画2", const AnimationHeroShowImgpagePage()),
            createCommonItem("饼图 - 1", const AnimagtionPiePage1()),
            createCommonItem("饼图 - 2", const AnimagtionPiePage2()),
            createCommonItem("TabBar中 页面切换动画", const AnimationTabbarPage()),
            createCommonItem("Path动画", const AnimationRectPathPage()),
            createCommonItem("长按出现动画", const AnimationLongpressPage()),

            // createCommonItem("进度条", const ProgressHomePage()),
            // createCommonItem("圆角图标", const TestRuondIconPage()),
          ],
        ),
      ),
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
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return nextWidget;
        }));
      },
    );
  }
}
