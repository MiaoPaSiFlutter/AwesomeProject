ProxyProvider

如果要提供两个Model，但是其中一个Model取决于另一个Model，在这种情况下，可以使用ProxyProvider。A ProxyProvider从一个Provider获取值，然后将其注入另一个Provider,

把上面的改下，比如的上传图片功能，需要先把图片提交到图片服务器，然后再把链接发送到后台服务器：


class MyHomePage extends StatelessWidget {
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
          title: Text('provider'),
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
                return FlatButton(
                    color: Colors.tealAccent,
                    onPressed: model.upLoadPic,
                    child: Text("提交图片"));
              },
            ),
            Consumer<SubmitModel>(
              builder: (context, model, child) {
                return FlatButton(
                    color: Colors.tealAccent,
                    onPressed: model.subMit,
                    child: Text("提交"));
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
    await Future.delayed(Duration(seconds: 2));
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


作者：A_si
链接：https://www.jianshu.com/p/9cd4b9fb7b44
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。