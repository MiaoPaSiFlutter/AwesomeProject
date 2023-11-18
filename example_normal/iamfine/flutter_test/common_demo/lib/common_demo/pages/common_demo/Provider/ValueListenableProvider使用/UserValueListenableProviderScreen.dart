import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class UserValueListenableProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<MyModel>(
      create: (context) => MyModel(),
      child: Consumer<MyModel>(builder: (context, myModel, child) {
        return ValueListenableProvider<int>.value(
          value: myModel.counter,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('provider'),
            ),
            body: Column(
              children: <Widget>[
                Builder(
                  builder: (context) {
                    var count = Provider.of<int>(context);
                    return Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        color: Colors.lightBlueAccent,
                        child: Text('当前是：$count'));
                  },
                ),
                Consumer<int>(
                  builder: (context, value, child) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      color: Colors.lightGreen,
                      child: Text(
                        '$value',
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
      }),
    );
  }
}

class MyModel {
  ValueNotifier<int> counter = ValueNotifier(0);
  Future<void> incrementCounter() async {
    await Future.delayed(const Duration(seconds: 2));
    print(counter.value++);
    counter.value = counter.value;
  }
}
