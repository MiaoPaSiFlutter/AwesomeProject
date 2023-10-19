Provider

Provider是provider包中最基本的提供者widget类型。它可以给包括住的所有widget提供值，但是当该值改变时，并不会更新widget。

新增MyModel类，作为要让Provider提供出去的值，把计数器的数值counter声明到这里，并且更改计数值的方法也放在这里，点击按钮的时候，调用MyModel对象的incrementCounter(),延时2秒并更改counter：

class MyModel {
  
  MyModel({this.counter=0});

  int counter = 0;

  Future<void> incrementCounter() async {
    await Future.delayed(Duration(seconds: 2));
    counter++;
    print(counter);
  }
}
在widget树的顶部包裹Provider小部件，将MyModel对象通过Provider提供给widget树。然后使用了两种获取Provider提供值的方式，在Column里：

先使用Provider.of<MyModel>(context)获取到MyModel对象的引用；
然后使用Consumer小部件获得对MyModel对象的引用；
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MyModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                // 获取到provider提供出来的值
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
                // 获取到provider提供出来的值
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
               // 获取到provider提供出来的值
              builder: (context, model, child) {
                return FlatButton(
                    color: Colors.tealAccent,
                    onPressed:model.incrementCounter,
                    child: Icon(Icons.add));
              },
            ),
          ],
        ),
      ),
    );
  }
}

点击FlatButton，model调用incrementCounter()函数，计数值加1。但是并不会重建UI，因为该Provider小部件不会监听其提供的值的更改。



作者：A_si
链接：https://www.jianshu.com/p/9cd4b9fb7b44
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。