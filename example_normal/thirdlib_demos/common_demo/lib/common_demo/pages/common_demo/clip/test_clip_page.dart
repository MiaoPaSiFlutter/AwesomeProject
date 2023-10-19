import 'package:flutter/material.dart';

class TestClipPage extends StatefulWidget {
  const TestClipPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ClipOvalState();
  }
}

class _ClipOvalState extends State {
  String imageUrl =
      "https://t7.baidu.com/it/u=2621658848,3952322712&fm=193&f=GIF";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(" ClipOval "),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,

              ///裁剪组件
              child: ClipOval(
                ///一个图片
                child: Image.network(
                  imageUrl, //图片地址
                  ///填充
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,

              ///裁剪组件
              child: ClipRect(
                ///一个图片
                child: Image.network(imageUrl, //图片地址
                    ///填充
                    fit: BoxFit.fill),
              ),
            )
          ],
        ),
      ),
    );
  }
}
