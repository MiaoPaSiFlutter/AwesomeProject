StreamProvider

StreamProvider基本上是StreamBuilder的包装，和上面的FutureProvider一样。不同的是StreamProvider提供的是流，FutureProvider需要的一个Future。

StreamProvider也不会监听model本身的变化。它仅监听流中的新事件：

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      initialData: MyModel(counter: 0),
      create: (context) => getStreamOfMyModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider'),
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
                return FlatButton(
                    color: Colors.tealAccent,
                    onPressed: model.incrementCounter,
                    child: Icon(Icons.add));
              },
            ),
          ],
        ),
      ),
    );
  }

  Stream<MyModel> getStreamOfMyModel() {
    return Stream<MyModel>.periodic(
        Duration(seconds: 1), (x) => MyModel(counter: x)).take(10);
  }
}

class MyModel with ChangeNotifier {
  //                                               <--- MyModel
  MyModel({this.counter = 0});

  int counter = 0;

  Future<void> incrementCounter() async {
    await Future.delayed(Duration(seconds: 2));
    counter++;
    print(counter);
    notifyListeners();
  }
}
给StreamProvider设置了一个每隔1秒更新一次的stream，ui上的计数值也是每隔一秒改变一次。但是点击按钮同样不会刷新ui。所以也可以认为是一个StreamBuilder。



作者：A_si
链接：https://www.jianshu.com/p/9cd4b9fb7b44
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。