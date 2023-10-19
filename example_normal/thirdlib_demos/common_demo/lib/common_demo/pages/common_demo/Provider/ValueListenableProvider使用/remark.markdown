ValueListenableProvider

ValueListenableProvider类似于ValueChange的封装,它的作用和ChangeNotifierProvider一样，在值改变的时候，会通知Consumer重新build，但是使用起来比ChangeNotifierProvider复杂，需要先用Provider提供MyModel给Consumer，然后把MyModel里的ValueNotifier给ValueListenableProvider：

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<MyModel>(
      create: (context) => MyModel(),
      child: Consumer<MyModel>(
        builder: (context, myModel, child) {
          return ValueListenableProvider<int>.value(
            value: myModel.counter,
            child: Scaffold(
              appBar: AppBar(
                title: Text('provider'),
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
      ),
    );
  }
}

class MyModel {
  ValueNotifier<int> counter = ValueNotifier(0);
  Future<void> incrementCounter() async {
    await Future.delayed(Duration(seconds: 2));
    print(counter.value++);
    counter.value = counter.value;
  }
}




作者：A_si
链接：https://www.jianshu.com/p/9cd4b9fb7b44
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。