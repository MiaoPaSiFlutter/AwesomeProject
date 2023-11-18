MultiProvider

上面的示例都仅使用了一个Model对象。如果需要提供第二种类型的Model对象，可以嵌套Provider。但是，嵌套迷之缩进，可读性低。这时候使用MultiProvider非常简洁，

我们改下上面的计数器，一般首页会有一个banner和列表。我们用上面的计数器模拟banner，下面的计数器模拟列表：

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BannerModel>(create: (context) => BannerModel()),
        ChangeNotifierProvider<ListModel>(create: (context) => ListModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider'),
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
                return FlatButton(
                    color: Colors.tealAccent,
                    onPressed: model.getBanner,
                    child: Text("获取banner"));
              },
            ),
            Consumer<ListModel>(
              builder: (context, model, child) {
                return FlatButton(
                    color: Colors.tealAccent,
                    onPressed: model.getList,
                    child: Text("获取列表"));
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
    await Future.delayed(Duration(seconds: 2));
    counter++;
    notifyListeners();
    print(counter);
  }
}

class ListModel with ChangeNotifier {
  int counter = 0;

  Future<void> getList() async {
    await Future.delayed(Duration(seconds: 2));
    counter++;
    notifyListeners();
    print(counter);
  }
}

MultiProvider
按下banner按钮，就单独获取banner的数值，并更新banner的Consumer。列表的同理。



作者：A_si
链接：https://www.jianshu.com/p/9cd4b9fb7b44
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。