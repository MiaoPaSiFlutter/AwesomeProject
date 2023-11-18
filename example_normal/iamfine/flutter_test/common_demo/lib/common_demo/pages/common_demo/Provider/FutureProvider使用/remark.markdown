FutureProvider

FutureProvider基本上只是普通FutureBuilder的包装。我们需要给它提供一些显示在UI中的初始数据，还要为它设置要提供值的Future。在Future完成的时候，FutureProvider会通知Consumer重建自己的小部件。

在下面的代码中，使用了一个counter为0的MyModel向UI提供一些初始数据，并且添加了一个Future函数，可在3秒后返回一个counter为1的MyModel。
和基类Provider一样，FutureProvider它不会监听模型本身内的任何更改。在下面的代码中依旧通过按钮点击事件使counter加1，但是对UI没有影响。

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      initialData: MyModel(counter: 0),
      create: (context) => someAsyncFunctionToGetMyModel(),
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

  Future<MyModel> someAsyncFunctionToGetMyModel() async {
    //  <--- async function
    await Future.delayed(Duration(seconds: 3));
    return MyModel(counter: 1);
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
FutureProvider通过设置的Future完成后会通知Consumer，重新build。但是，Future完成后，点击按钮也不会更新UI。

FutureProvider适用于没有刷新和变更的页面，和FutureBuilder一样的作用。



作者：A_si
链接：https://www.jianshu.com/p/9cd4b9fb7b44
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。