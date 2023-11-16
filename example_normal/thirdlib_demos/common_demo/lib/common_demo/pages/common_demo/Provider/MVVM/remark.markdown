基于 MVVM 模式封装 Provider

相信大家都已经理解 provider 的流程，如下图：

MVVM
上面已经演示完了 Provider 的用法，在开发中，我们需要 Model 充当 ViewModel，处理业务逻辑，但是每次都写样板代码的话也很麻烦，所以需要封装下，易于使用。

Simulator Screen Shot - iPhone SE (2nd generation) - 2020-05-31 at 23.35.55.png
class MyHomePage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return ChangeNotifierProvider<LoginViewModel>(
create: (BuildContext context) {
return LoginViewModel(loginServive: LoginServive());
},
child: Scaffold(
appBar: AppBar(
title: Text('provider'),
),
body: Column(
children: <Widget>[
Consumer<LoginViewModel>(
builder: (context, model, child) {
return Text(model.info);
},
),
Consumer<LoginViewModel>(
builder: (context, model, child) {
return FlatButton(
color: Colors.tealAccent,
onPressed: () => model.login("pwd"),
child: Text("登录"));
},
),
],
),
),
);
}
}

/// viewModel
class LoginViewModel extends ChangeNotifier {
LoginServive \_loginServive;
String info = '请登录';

LoginViewModel({required LoginServive loginServive})
: \_loginServive = loginServive;

Future<String> login(String pwd) async {
info = await \_loginServive.login(pwd);
notifyListeners();
}
}

/// api
class LoginServive {
static const String Login_path = 'xxxxxx';

Future<String> login(String pwd) async {
return new Future.delayed(const Duration(seconds: 1), () => "登录成功");
}
}
这种页面写法，基本每个页面都要，下面我们一步一步开始封装。

一般页面载入的时候会显示一个 loading，然后加载成功展示数据，失败就展示失败页面，所以枚举一个页面状态：
enum ViewState { Loading, Success,Failure }
ViewModel 都会在页面状态属性改变后更新 ui，通常会调用 notifyListeners，把这一步移到 BaseModel 中：
class BaseModel extends ChangeNotifier {
ViewState \_state = ViewState.Loading;

ViewState get state => \_state;

void setState(ViewState viewState) {
\_state = viewState;
notifyListeners();
}
}
我们知道 ui 里需要 ChangeNotifierProvider 提供 Model，并且用 Consumer 更新 ui。因此我们也将其内置到 BaseView 中：
class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
final Widget Function(BuildContext context, T value, Widget child) builder;
final T model;
final Widget child;

BaseWidget({Key key, this.model, this.builder, this.child}) : super(key: key);

@override
State<StatefulWidget> createState() => \_BaseWidgetState();

}

class \_BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {

T model;

@override
void initState() {
model = widget.model;
super.initState();
}

@override
Widget build(BuildContext context) {
return ChangeNotifierProvider<T>.value(
value: model,
child: Consumer<T>(
builder: widget.builder,
child: widget.child,
),
);
}
}
有时候我们的页面数据只是局部更新，Consumer 的 child 属性就是模型更改时不需要重建的 UI，所以我们将需要更新的 ui 放在 builder 里，不需要更新的写在 child 里：
Consumer<LoginViewModel>(
// Pass the login header as a prebuilt-static child
child: LoginHeader(controller: \_controller),
builder: (context, model, child) => Scaffold(
...
body: Column (

      children: [

//不更新的部分
child,
...
]
)
大多时候，我们已进入一个页面，就要获取数据，所以我们也把这个操作移入基类：
class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {

final Function(T) onModelReady;
...

BaseWidget({
...
this.onModelReady,
});
...
}

...

@override
void initState() {
model = widget.model;

if (widget.onModelReady != null) {
widget.onModelReady(model);
}

super.initState();
}
现在，我们用封装的基类完成登录页面：

class MyHomePage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return BaseWidget<LoginViewModel>(
model: LoginViewModel(loginServive: LoginServive()),
builder: (context, model, child) => Scaffold(
appBar: AppBar(
title: Text('provider'),
),
body: Column(
children: <Widget>[
model.state == ViewState.Loading
? Center(
child: CircularProgressIndicator(),
)
: Text(model.info),
FlatButton(
color: Colors.tealAccent,
onPressed: () => model.login("pwd"),
child: Text("登录")),
],
),
),
);
}
}

/// viewModel
class LoginViewModel extends BaseModel {
LoginServive \_loginServive;
String info = '请登录';

LoginViewModel({required LoginServive loginServive})
: \_loginServive = loginServive;

Future<String> login(String pwd) async {
setState(ViewState.Loading);
info = await \_loginServive.login(pwd);
setState(ViewState.Success);
}
}

/// api
class LoginServive {
static const String Login_path = 'xxxxxx';

Future<String> login(String pwd) async {
return new Future.delayed(const Duration(seconds: 1), () => "登录成功");
}
}

enum ViewState { Loading, Success, Failure, None }

class BaseModel extends ChangeNotifier {
ViewState \_state = ViewState.None;

ViewState get state => \_state;

void setState(ViewState viewState) {
\_state = viewState;
notifyListeners();
}
}

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
final Widget Function(BuildContext context, T model, Widget child) builder;
final T model;
final Widget child;
final Function(T) onModelReady;

BaseWidget({
Key key,
this.builder,
this.model,
this.child,
this.onModelReady,
}) : super(key: key);

\_BaseWidgetState<T> createState() => \_BaseWidgetState<T>();
}

class \_BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
T model;

@override
void initState() {
model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }

    super.initState();

}

@override
Widget build(BuildContext context) {
return ChangeNotifierProvider<T>(
create: (BuildContext context) => model,
child: Consumer<T>(
builder: widget.builder,
child: widget.child,
),
);
}
}
27 人点赞
Flutter

作者：A_si
链接：https://www.jianshu.com/p/9cd4b9fb7b44
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
