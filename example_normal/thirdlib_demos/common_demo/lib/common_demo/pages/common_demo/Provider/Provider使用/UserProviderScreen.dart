import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';

import 'MyModel.dart';

class UserProviderScreen extends StatefulWidget {
  UserProviderScreen({Key? key}) : super(key: key);

  @override
  _UserProviderScreenState createState() => _UserProviderScreenState();
}

class _UserProviderScreenState extends State<UserProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MyModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider使用'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                // 获取到provider提供出来的值
                MyModel _model = Provider.of<MyModel>(context);
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    color: Colors.lightBlueAccent,
                    child: Text('当前是：${_model.counter}'));
              },
            ),
            Consumer<MyModel>(
              // 获取到provider提供出来的值
              builder: (context, model, child) {
                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  color: Colors.lightGreen,
                  child: Text(
                    '${model.counter}',
                  ),
                );
              },
            ),
            Consumer<MyModel>(
              // 获取到provider提供出来的值
              builder: (context, model, child) {
                return HzyBtnWidget(
                    bgColor: Colors.tealAccent,
                    tapCall: model.incrementCounter,
                    titleWidget: const Icon(Icons.add));
              },
            ),
          ],
        ),
      ),
    );
  }
}
