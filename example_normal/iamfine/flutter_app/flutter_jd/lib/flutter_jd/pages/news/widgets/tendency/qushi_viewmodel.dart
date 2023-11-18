import 'package:flutter_jd/flutter_jd.dart';

class QuShiViewModel extends ScreenViewModel {
  //全部数据
  Map responseData = {};
  //商品大图介绍
  List wareImage = [];
  //选项卡
  List tabList = [];

  int selectIndex = 0;

  QuShiViewModel({String? functionId}) {
    // _functionId = functionId;
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

    JdService.getNewsTrendsTabHomeInfo().then((MpsfResponse resp) {
      responseData = resp.jsonData ?? {};
      tabList = responseData["result"]?["tabResult"]?["list"] ?? [];
      if (resp.isOk == false) {
        //更新页面视图
        state = ScreenState.FAIL;
        notifyListeners();
      } else {
        //更新页面视图
        state = ScreenState.CONTENT;
        notifyListeners();
      }
    });
  }
}
