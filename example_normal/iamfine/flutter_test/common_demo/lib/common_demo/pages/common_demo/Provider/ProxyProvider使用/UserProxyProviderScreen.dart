import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class UserProxyProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PicModel>(create: (context) => PicModel()),
        ProxyProvider<PicModel, SubmitModel>(
          update: (context, myModel, anotherModel) => SubmitModel(myModel),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ProxyProvider使用'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                PicModel modol = Provider.of<PicModel>(context);
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    color: Colors.lightBlueAccent,
                    child: Text('提交图片：${modol.counter}'));
              },
            ),
            Consumer<PicModel>(
              builder: (context, model, child) {
                return HzyBtnWidget(
                    bgColor: Colors.tealAccent,
                    tapCall: model.upLoadPic,
                    titleWidget: const Text("提交图片"));
              },
            ),
            Consumer<SubmitModel>(
              builder: (context, model, child) {
                return HzyBtnWidget(
                    bgColor: Colors.tealAccent,
                    tapCall: model.subMit,
                    titleWidget: const Text("提交"));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PicModel with ChangeNotifier {
  int counter = 0;

  Future<void> upLoadPic() async {
    await Future.delayed(const Duration(seconds: 2));
    counter++;
    notifyListeners();
    print(counter);
  }
}

class SubmitModel {
  PicModel _model;

  SubmitModel(this._model);

  Future<void> subMit() async {
    await _model.upLoadPic();
  }
}
