import 'package:flutter/material.dart';

class TestClipReactPage extends StatefulWidget {
  const TestClipReactPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ClipOvalState();
  }
}

class _ClipOvalState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(" ClipOval "),
      ),
      body: Container(
        width: 100,
        height: 100,

        ///裁剪组件
        child: ClipRect(
          ///一个图片
          child: Image.network(imageUrl, //图片地址
              ///填充
              fit: BoxFit.fill),
        ),
      ),
    );
  }

  String imageUrl =
      "https://t7.baidu.com/it/u=2621658848,3952322712&fm=193&f=GIF";
}
