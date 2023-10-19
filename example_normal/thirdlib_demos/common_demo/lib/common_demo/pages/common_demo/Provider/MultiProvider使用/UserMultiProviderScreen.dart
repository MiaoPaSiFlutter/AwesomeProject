import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';

class UserMultiProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BannerModel>(create: (context) => BannerModel()),
        ChangeNotifierProvider<ListModel>(create: (context) => ListModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MultiProvider使用'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                BannerModel modol = Provider.of<BannerModel>(context);
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    color: Colors.lightBlueAccent,
                    child: Text('当前Banner有几个：${modol.counter}'));
              },
            ),
            Consumer<ListModel>(
              builder: (context, model, child) {
                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  color: Colors.lightGreen,
                  child: Text(
                    '当前Banner有几个：${model.counter}',
                  ),
                );
              },
            ),
            Consumer<BannerModel>(
              builder: (context, model, child) {
                return HzyBtnWidget(
                    bgColor: Colors.tealAccent,
                    tapCall: model.getBanner,
                    titleWidget: const Text("获取banner"));
              },
            ),
            Consumer<ListModel>(
              builder: (context, model, child) {
                return HzyBtnWidget(
                    bgColor: Colors.tealAccent,
                    tapCall: model.getList,
                    titleWidget: const Text("获取列表"));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BannerModel with ChangeNotifier {
  int counter = 0;

  Future<void> getBanner() async {
    await Future.delayed(const Duration(seconds: 2));
    counter++;
    notifyListeners();
    print(counter);
  }
}

class ListModel with ChangeNotifier {
  int counter = 0;

  Future<void> getList() async {
    await Future.delayed(const Duration(seconds: 2));
    counter++;
    notifyListeners();
    print(counter);
  }
}
