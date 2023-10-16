import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/9.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 代码清单 1-3-1
class LiquidSwipeDemo1 extends StatefulWidget {
  const LiquidSwipeDemo1({Key? key}) : super(key: key);

  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<LiquidSwipeDemo1> {
  WaveType currentAnimate = WaveType.liquidReveal;

  void changeAnimate() {
    setState(() {
      if (currentAnimate == WaveType.liquidReveal) {
        currentAnimate = WaveType.circularReveal;
      } else {
        currentAnimate = WaveType.liquidReveal;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("liquid_swipe"),
        actions: const <Widget>[],
      ),
      body: LiquidSwipe(
        pages: [
          Container(
            color: Colors.blue,
            child: Center(
              child: InkWell(
                child: const Text("切换效果"),
                onTap: () {
                  changeAnimate();
                },
              ),
            ),
          ),
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.teal,
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Image.asset(
                NormalModuleUtils.configPackagesImage(
                  packagename: 'common_demo',
                  name: "assets/LiquidSwipe.webp",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        fullTransitionValue: 200,
        enableLoop: true,
        positionSlideIcon: 0.5,
        waveType: currentAnimate,
        onPageChangeCallback: (page) => pageChangeCallback(page),
        currentUpdateTypeCallback: (updateType) =>
            updateTypeCallback(updateType),
      ),
    );
  }

  pageChangeCallback(int page) {
    print(page);
  }

  updateTypeCallback(UpdateType updateType) {
    print(updateType);
  }
}
