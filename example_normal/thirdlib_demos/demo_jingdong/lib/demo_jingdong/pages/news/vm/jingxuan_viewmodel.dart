import 'package:demo_jingdong/demo_jingdong.dart';

class JingXuanViewModel extends ScreenViewModel {
  //全部数据
  Map responseData = {};
  //商品大图介绍
  List wareImage = [];
  //选项卡
  List tabList = [];
  int selectIndex = 0;
  //Widget高度
  double offSetMax = 0;
  double appBarHeight = 0;
  double segmentHeight = 0;

  JingXuanViewModel({String? functionId}) {
    // _functionId = functionId;
  }

  void updateOffSetMax(double value) {
    offSetMax = value;
    notifyListeners();
  }

  void updateAppBarHeight(double value) {
    appBarHeight = value;
    notifyListeners();
  }

  void updateSegmentHeight(double value) {
    segmentHeight = value;
    notifyListeners();
  }

  void updateSelectIndex(int value) {
    selectIndex = value;
    notifyListeners();
  }

  Future<void> getPageDatas() async {
    if (responseData.isEmpty) {
      state = ScreenState.LOADING;
      notifyListeners();
    }

    MpsfResponse resp = await JdService.getTabHomeInfo();
    responseData = resp.jsonData ?? {};
    wareImage = responseData["result"]?["trumpList"] ?? [];
    tabList = responseData["result"]?["tabList"] ?? [];
    if (resp.isOk == false) {
      //更新页面视图
      state = ScreenState.FAIL;
      notifyListeners();
    } else {
      //更新页面视图
      state = ScreenState.CONTENT;
      notifyListeners();
    }
    return;
  }
}
