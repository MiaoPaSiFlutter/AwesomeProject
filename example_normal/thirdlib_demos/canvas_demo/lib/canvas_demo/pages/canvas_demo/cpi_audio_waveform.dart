import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/11/20.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class AudioWaveformPage extends StatefulWidget {
  const AudioWaveformPage({super.key});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<AudioWaveformPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 4),
          builder: (context, value, child) {
            return Container(
              width: 500,
              height: 100,
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [value, value],
                              colors: [Colors.blue, Colors.grey.withAlpha(100)])
                          .createShader(rect);
                    },
                    child: Container(
                      width: 500,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Image.asset(
                                  NormalModuleUtils.configPackagesImage(
                                      packagename: 'canvas_demo',
                                      name: 'assets/audio_waveform.png'))
                              .image,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
