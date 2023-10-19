ChangeNotifierProvider

与最基础的Provider小部件不同，ChangeNotifierProvider会监听其提供出去的模型对象中的更改。当有值更改后，它将重建下方所有的Consumer和使用Provider.of<MyModel>(context)监听并获取提供值的地方。

代码中更改Provider为ChangeNotifierProvider。MyModel混入ChangeNotifier（继承也一样）。然后更改counter之后调用notifyListeners()，这样ChangeNotifierProvider就会得到通知，并且Consumer和监听的地方将重建其小部件。

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
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
}

class MyModel with ChangeNotifier{
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

Simulator Screen Shot - iPhone SE (2nd generation) - 2020-05-29 at 00.21.22.png
每次点击，都会更改计数器的值，如果第一行的计数值是保留初始值，不更新呢？很简单，把Provider.of的监听器设置为false，这样更改后就不会重新构建第一行的text：
MyModel _model = Provider.of<MyModel>(context,listen: false);


Simulator Screen Shot - iPhone SE (2nd generation) - 2020-05-29 at 00.25.13.png


作者：A_si
链接：https://www.jianshu.com/p/9cd4b9fb7b44
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。