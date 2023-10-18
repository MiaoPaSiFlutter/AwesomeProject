import 'package:demo_jingdong/demo_jingdong.dart';

class TribeViewModel extends ScreenViewModel {
  //全部数据
  Map responseData = {};

  TribeViewModel({String? functionId}) {
    // _functionId = functionId;
  }

  Future<void> getPageDatas() async {
    if (responseData.isEmpty) {
      state = ScreenState.LOADING;
      notifyListeners();
    }

    {
      ///主数据
      MpsfResponse resp = await JdService.getRecommendNewFeedsList(1);
      responseData = resp.jsonData;
    }

    state = ScreenState.CONTENT;
    notifyListeners();
  }
}
