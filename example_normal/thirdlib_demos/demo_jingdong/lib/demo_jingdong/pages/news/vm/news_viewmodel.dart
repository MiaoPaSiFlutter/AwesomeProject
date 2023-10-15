import 'package:demo_jingdong/demo_jingdong.dart';

class NewsViewModel extends ScreenViewModel {
  //定义一个AppBar 的透明度默认值
  double _appBarAlpha = 0;
  double get appBarAlpha => _appBarAlpha;
  //
  int _selectIndex = 0;
  int get selectIndex => _selectIndex;

  NewsViewModel({String? functionId}) {
    // _functionId = functionId;
  }

  Future<void> getPageDatas() async {
    state = ScreenState.CONTENT;
    notifyListeners();
  }

  void updateAppBarAlpha(double alpha) {
    _appBarAlpha = alpha;
    notifyListeners();
  }

  void updateSelectIndex(int index) {
    _selectIndex = index;
    notifyListeners();
  }
}
