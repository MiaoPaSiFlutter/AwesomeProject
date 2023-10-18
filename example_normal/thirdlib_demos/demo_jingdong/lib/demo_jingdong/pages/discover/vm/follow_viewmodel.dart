import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';

class FollowViewModel extends ScreenViewModel {
  final scrollController = ScrollController();
  final controller = JdCommonEasyRefreshController();

  //全部数据
  Map responseData = {};
  //直播间
  List liveList = [];

  int _page = 1;
  final int _pageSize = 10;
  bool noMore = false; // 是否有更多数据
  bool requesting = false;
  final List floors = [];

  FollowViewModel({String? functionId}) {
    // _functionId = functionId;
  }

  void changeScreenStyte(ScreenState newState) {
    state = newState;
    notifyListeners();
  }

  fetchDiscFollowEnterMainPage() {
    JdService.discFollowEnterMainPage().then((value) {
      responseData = value.jsonData;
      liveList = responseData["data"]?["liveWall"]?["liveList"] ?? [];
      notifyListeners();
    });
  }

  fetchDiscFollowNextContent(int page) {
    if (requesting) {
      return;
    }
    requesting = true;
    notifyListeners();

    if (floors.isEmpty) {
      state = ScreenState.LOADING;
      notifyListeners();
    }

    JdService.discFollowNextContent(page).then((value) {
      requesting = false;
      notifyListeners();

      if (value.isOk != true) {
        if (page == 1) {
          _page = 1;
          noMore = false;
          floors.clear();
          state = ScreenState.FAIL;
          notifyListeners();
        } else {
          //不处理
        }
      } else {
        _page = page;
        noMore = false;
        if (page == 1) floors.clear();

        List contentList = value.jsonData?["data"]?["contentList"] ?? [];
        List newDatas = [];
        for (var item in contentList) {
          newDatas.add(item);
        }
        floors.addAll(newDatas);

        if (newDatas.isEmpty || newDatas.length < _pageSize) {
          noMore = true;
        }
        state = ScreenState.CONTENT;
        notifyListeners();
      }

      if (page == 1) {
        controller.mpsfFinishRefresh();
        controller.mpsfResetFooter();
      } else {
        controller.mpsfFinishLoad(noMore
            ? CommonIndicatorResult.noMore
            : CommonIndicatorResult.success);
      }
    });
  }

  // 下拉刷新数据
  void refreshData() {
    fetchDiscFollowEnterMainPage();
    fetchDiscFollowNextContent(1);
  }

  // 上拉加载数据
  void addMoreData() {
    fetchDiscFollowNextContent(_page + 1);
  }
}
