import 'package:flutter/material.dart';

import 'Spinner.dart';
import 'cpi_audio_waveform.dart';
import 'examle_snow_page.dart';
import 'image/UseCustomPaintImageDemo.dart';
import 'percentage_indicator_sm.dart';
import 'rain/weather_widget.dart';
import 'test.dart';
import 'testWidget2.dart';
import 'test_BluePainter.dart';
import 'test_bubble_login_page.dart';
import 'tiltable_stack.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo Home Page'),
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
