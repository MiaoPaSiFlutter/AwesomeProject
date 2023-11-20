import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'canvas_demo/Spinner.dart';
import 'canvas_demo/cpi_audio_waveform.dart';
import 'canvas_demo/examle_snow_page.dart';
import 'canvas_demo/image/UseCustomPaintImageDemo.dart';
import 'canvas_demo/percentage_indicator_sm.dart';
import 'canvas_demo/rain/weather_widget.dart';
import 'canvas_demo/test.dart';
import 'canvas_demo/testWidget2.dart';
import 'canvas_demo/test_BluePainter.dart';
import 'canvas_demo/test_bubble_login_page.dart';
import 'canvas_demo/tiltable_stack.dart';

class TestCanvasApp extends GetView<TestCanvasAppController> {
  const TestCanvasApp({super.key});

  @override
  TestCanvasAppController get controller => Get.put(TestCanvasAppController());

  @override
  Widget build(BuildContext context) {
    return const MyAppWrapper();
  }
}

class TestCanvasAppController extends GetxController {
  TestCanvasAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyAppWrapper extends StatefulWidget {
  const MyAppWrapper({super.key});

  @override
  State<MyAppWrapper> createState() => _MyAppWrapperState();
}

class _MyAppWrapperState extends State<MyAppWrapper> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test - Canvas',
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Demo Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createCommonItem(
                "使用CustomPaint绘制图片", const UseCustomPaintImageDemo()),
            createCommonItem("使用CustomPaint绘制天气", const WeatherWidget()),
            createCommonItem("AudioWave展示", const AudioWaveformPage()),
            createCommonItem("雪花-动画", const ExamleSnowPage()),
            createCommonItem(
                "ShaderMask的使用", const PercentageIndicatorSmPage()),
            createCommonItem("类似loading-动画", const Spinner()),
            createCommonItem(
                "使用CustomPaint绘制不规则Widget", const TestBluePainterPage()),
            createCommonItem("登录页-背景气泡动画", const BobbleLoginPage()),
            createCommonItem("创建自定义装饰", const TestPage1()),
            createCommonItem("路径动画", const TestPage2()),
            createCommonItem("手势动画处理-按钮", const TestPage3()),
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
