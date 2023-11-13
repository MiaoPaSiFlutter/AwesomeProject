import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class UserFutureProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      initialData: MyModel(counter: 0),
      create: (context) => someAsyncFunctionToGetMyModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FutureProvider使用'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                MyModel _model = Provider.of<MyModel>(context, listen: false);
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

  Future<MyModel> someAsyncFunctionToGetMyModel() async {
    //  <--- async function
    await Future.delayed(const Duration(seconds: 3));
    return MyModel(counter: 1);
  }
}

class MyModel with ChangeNotifier {
  //                                               <--- MyModel
  MyModel({this.counter = 0});

  int counter = 0;

  Future<void> incrementCounter() async {
    await Future.delayed(const Duration(seconds: 2));
    counter++;
    print(counter);
    notifyListeners();
  }
}
