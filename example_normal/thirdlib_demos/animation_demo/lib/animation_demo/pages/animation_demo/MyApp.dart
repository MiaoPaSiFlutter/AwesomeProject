import 'package:flutter/material.dart';

import 'example_clip_path_wave_login.dart';
import 'example_number_PageTransitionSwitcher.dart';
import 'example_number_PageTransitionSwitcher2.dart';
import 'example_pie2_animagtion_page.dart';
import 'example_pie_animagtion_page.dart';
import 'hero_demo/test_hero_page.dart';
import 'hero_demo/test_hero_show_imgpage.dart';
import 'test.dart';
import 'test2.dart';
import 'test_animation.dart';
import 'test_rect_path_animation.dart';

class AnimationMyApp extends StatefulWidget {
  const AnimationMyApp({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AnimationMyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? '一些动效'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createCommonItem("水波纹", const Example001()),
            createCommonItem("数字切换-动画", const Example002()),
            createCommonItem("长按出现动画", const Example003()),
            createCommonItem("饼图 - 1", const Example004()),
            createCommonItem("饼图 - 2", const Example005()),
            createCommonItem("TabBar中 页面切换动画", const Example006()),
            createCommonItem("Path动画", const Example007()),
            createCommonItem("CustomPainter使用1 ", const Example008()),
            createCommonItem("CustomPainter使用2", const Example009()),
            createCommonItem("Hero 动画1", const HeroHomePage()),
            createCommonItem("Hero 动画2", const RadialExpansionDemo()),

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
