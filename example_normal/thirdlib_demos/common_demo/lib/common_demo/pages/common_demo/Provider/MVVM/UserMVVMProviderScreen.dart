import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class UserMVVMProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (BuildContext context) {
        return LoginViewModel(loginServive: LoginServive());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MVVM'),
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
                return HzyBtnWidget(
                    bgColor: Colors.tealAccent,
                    tapCall: () => model.login("pwd"),
                    titleWidget: const Text("登录"));
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
  LoginServive _loginServive;
  String info = '请登录';

  LoginViewModel({required LoginServive loginServive})
      : _loginServive = loginServive;

  Future<String> login(String pwd) async {
    info = await _loginServive.login(pwd);
    notifyListeners();
    return Future.delayed(const Duration(seconds: 1), () => "登录成功");
  }
}

/// api
class LoginServive {
  static const String Login_path = 'xxxxxx';

  Future<String> login(String pwd) async {
    return Future.delayed(const Duration(seconds: 1), () => "登录成功");
  }
}

// 这种页面写法，基本每个页面都要，下面我们一步一步开始封装。
// 一般页面载入的时候会显示一个loading，然后加载成功展示数据，失败就展示失败页面，所以枚举一个页面状态：
enum ViewState { Loading, Success, Failure }

//ViewModel都会在页面状态属性改变后更新ui，通常会调用notifyListeners，把这一步移到BaseModel中：
class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Loading;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}

// 我们知道ui里需要ChangeNotifierProvider提供Model，并且用Consumer更新ui。因此我们也将其内置到BaseView中：
class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final T model;
  final Widget? child;

  BaseWidget({
    Key? key,
    required this.model,
    required this.builder,
    this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  late T model;

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
