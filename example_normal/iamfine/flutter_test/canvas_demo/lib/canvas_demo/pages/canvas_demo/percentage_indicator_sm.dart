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

const TWO_PI = 3.14 * 2;

class PercentageIndicatorSmPage extends StatelessWidget {
  const PercentageIndicatorSmPage({super.key});

  @override
  Widget build(BuildContext context) {
    const size = 200.0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Progress Indicator"),
        ),
        body: Center(
          // This Tween Animation Builder is Just For Demonstration, Do not use this AS-IS in Projects
          // Create and Animation Controller and Control the animation that way.
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 4),
            builder: (context, value, child) {
              int percentage = (value * 100).ceil();
              return Container(
                width: size,
                height: size,
                child: Stack(
                  children: [
                    //背景
                    ShaderMask(
                      shaderCallback: (rect) {
                        return SweepGradient(
                          startAngle: 0.0,
                          endAngle: TWO_PI,
                          stops: [value, value],
                          // 0.0 , 0.5 , 0.5 , 1.0
                          center: Alignment.center,
                          colors: [Colors.blue, Colors.grey.withAlpha(55)],
                        ).createShader(rect);
                      },
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: Image.asset(
                                    NormalModuleUtils.configPackagesImage(
                                        packagename: 'canvas_demo',
                                        name: 'assets/maomi2.jpg'))
                                .image,
                          ),
                        ),
                      ),
                    ),
                    //文字
                    Center(
                      child: Container(
                        width: size - 40,
                        height: size - 40,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                          "$percentage",
                          style: const TextStyle(fontSize: 40),
                        )),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
