import 'package:flutter/material.dart';
import 'package:flutter_books/flutter_books.dart';

import '../home/app_home.dart';

///@author longshaohua

class AboutPandaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutPandaPageState();
}

class _AboutPandaPageState extends State<StatefulWidget> {
  final url = 'https://github.com/q805699513/flutter_books';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        title: const Text("关于Panda看书"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              BooksDimens.leftMargin, 20, BooksDimens.rightMargin, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "作者：longshaohua",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const Text(
                    "github：",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Text(
                        url,
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      onTap: () {
                        _launchURL();
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "本项目仅用于学习交流",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 原生代码调用系统浏览器显示网页，url 为要打开的链接值传递
  Future<Null> _launchURL() async {
    print("launchURL start");
    final String result = await MyHomePage.platform.invokeMethod(
      'launchURL',
      <String, dynamic>{
        'url': url,
      },
    );
    print("launchURL=$result");
  }
}
