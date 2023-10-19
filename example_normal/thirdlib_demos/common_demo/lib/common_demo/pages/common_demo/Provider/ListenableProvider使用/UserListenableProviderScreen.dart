import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';

class UserListenableProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<MyModel>(
      create: (context) => MyModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ListenableProvider使用'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                MyModel modol = Provider.of<MyModel>(context);
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    color: Colors.lightBlueAccent,
                    child: Text('当前是：${modol.counter}'));
              },
            ),
            Consumer<MyModel>(
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

class MyModel with ChangeNotifier {
  int counter = 0;

  Future<void> incrementCounter() async {
    await Future.delayed(const Duration(seconds: 2));
    counter++;
    notifyListeners();
    print(counter);
  }
}
