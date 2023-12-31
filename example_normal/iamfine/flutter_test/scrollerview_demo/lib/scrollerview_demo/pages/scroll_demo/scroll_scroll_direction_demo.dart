import 'package:flutter/material.dart';

class ScrollScrollDirectionDemo extends StatefulWidget {
  const ScrollScrollDirectionDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return ScrollScrollDirectionDemoState();
  }
}

class ScrollScrollDirectionDemoState extends State {
  bool selecA = false;
  bool selecB = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" 配制"),
      ),

      ///SingleChildScrollView 处理滑动视图，允许有一个子widget 在超出视图的情况滑动
      body: SingleChildScrollView(
        ///设置 SingleChildScrollView 滑动方向 竖直方向  Axis.vertical
        scrollDirection: Axis.horizontal,

        ///是否滑动到底部 true 滑动到底部
        reverse: false,

        ///设置内边距
        padding: const EdgeInsets.all(20),

        ///设置滑动反弹效果  BouncingScrollPhysics
        /// 无滑动反弹效果 ClampingScrollPhysics
        ///  SingleChildScrollView 不可滑动 NeverScrollableScrollPhysics
        // physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: 800,
          height: 800,
          color: Colors.grey,
          child: const Text("这里是 SingleChildScrollView"),
        ),
      ),
    );
  }
}
