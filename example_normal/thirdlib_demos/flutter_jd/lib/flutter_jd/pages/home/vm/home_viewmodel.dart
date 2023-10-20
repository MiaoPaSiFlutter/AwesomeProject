import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ScreenViewModel {
  //定义一个AppBar 的透明度默认值
  double appBarAlpha = 0;

  //全部数据
  Map _welcomeHomeData = {};
  Map get welcomeHomeData => _welcomeHomeData;

  //顶部
  int selectIndex = 0;
  List segments = [];
  double segmentViewOffSet = 0.0;
  double appBarHeight = 0.0;
  double segmentHeight = 0.0;

  final GlobalKey navigationGlobalKey = GlobalKey();
  final GlobalKey segmentGlobalKey = GlobalKey();

  HomeViewModel({String? functionId}) {
    // _functionId = functionId;
  }

  Future<void> getWelcomeHomeData() async {
    if (_welcomeHomeData.isEmpty) {
      state = ScreenState.LOADING;
      notifyListeners();
    }

    MpsfResponse resp = await JdService.welcomeHome();
    _welcomeHomeData = resp.jsonData;
    List floorList = _welcomeHomeData["floorList"] ?? [];
    for (var i = 0; i < floorList.length; i++) {
      Map floor = floorList[i];
      String type = floor["type"];
      if (type == "topTab") {
        selectIndex = 0;
        segments = floor["content"] ?? [];
      }
    }

    state = ScreenState.CONTENT;
    notifyListeners();

    return;
  }

  void updateCSD({
    double? appBarAlpha_,
    double? appBarHeight_,
    double? segmentHeight_,
    double? segmentViewOffSet_,
    int? selectIndex_,
    List? segments_,
  }) {
    if (appBarAlpha_ != null) {
      appBarAlpha = appBarAlpha_;
    }
    if (appBarHeight_ != null) {
      appBarHeight = appBarHeight_;
    }
    if (segmentHeight_ != null) {
      segmentHeight = segmentHeight_;
    }
    if (segmentViewOffSet_ != null) {
      segmentViewOffSet = segmentViewOffSet_;
    }
    if (selectIndex_ != null) {
      selectIndex = selectIndex_;
    }
    if (segments_ != null) {
      segments = segments_;
    }

    notifyListeners();
  }

  Size getSegmentViewSize() {
    Size size = const Size(0, 0);
    if (segmentGlobalKey.currentContext != null) {
      RenderBox renderBox =
          segmentGlobalKey.currentContext!.findRenderObject() as RenderBox;
      size = renderBox.size;
    }
    return size;
  }

  Size getNavigationViewSize() {
    Size size = const Size(0, 0);
    if (navigationGlobalKey.currentContext != null) {
      RenderBox renderBox =
          navigationGlobalKey.currentContext!.findRenderObject() as RenderBox;
      size = renderBox.size;
    }
    return size;
  }
}
