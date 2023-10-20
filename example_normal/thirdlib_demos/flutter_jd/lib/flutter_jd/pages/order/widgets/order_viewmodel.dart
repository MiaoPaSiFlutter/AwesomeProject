import 'package:flutter_jd/flutter_jd.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class OrderViewModel extends ScreenViewModel {
  String? _functionId;
  int _page = 0;
  final int _pageSize = 10;
  bool noMore = false; // 是否有更多数据
  bool requesting = false; //是否正在请求
  final List floors = [];

  final List<String> segments = ["全部", "待付款", "待收货", "已完成", "已取消"];
  int selectIndex = 0;

  OrderViewModel({String? functionId}) {
    _functionId = functionId;
  }

  void updateSelectIndex(int value) {
    selectIndex = value;
    notifyListeners();
  }

  // 下拉刷新数据
  Future<MpsfResponse> refreshData() async {
    _page = 1;
    return _getPostData();
  }

  // 上拉加载数据
  Future<MpsfResponse> addMoreData() async {
    return _getPostData();
  }

  Future<MpsfResponse> _getPostData() async {
    requesting = true;

    int currentIndex = _page;
    if (currentIndex == 1 && floors.isEmpty) {
      state = ScreenState.LOADING;
      notifyListeners();
    }

    MpsfResponse? resp;
    if (_functionId == "newUserAllOrderList") {
      resp = await JdService.newUserAllOrderList(currentIndex);
    } else if (_functionId == "wait4Payment") {
      resp = await JdService.wait4Payment(currentIndex);
    } else if (_functionId == "wait4Delivery") {
      resp = await JdService.wait4Delivery(currentIndex);
    } else if (_functionId == "userCompletedOrderList") {
      resp = await JdService.userCompletedOrderList(currentIndex);
    } else if (_functionId == "canceledOrderList") {
      resp = await JdService.canceledOrderList(currentIndex);
    } else {
      resp = await JdService.newUserAllOrderList(currentIndex);
    }

    List orderList = resp.jsonData['orderList'] ?? [];
    List newDatas = [];
    for (var item in orderList) {
      newDatas.add(Map.from(item));
    }

    return Future.delayed(const Duration(seconds: 1)).then((e) {
      state = ScreenState.CONTENT;
      notifyListeners();

      if (newDatas.isEmpty || newDatas.length < _pageSize) {
        noMore = true;
      }
      if (currentIndex == 1) {
        noMore = false;
        floors.clear();
      }
      floors.addAll(newDatas);

      if (resp?.isOk == true) {
        if (currentIndex == 1 && newDatas.isEmpty) {
          state = ScreenState.EMPTY;
          notifyListeners();
        }
        _page++;
      } else {
        if (currentIndex == 1) {
          state = ScreenState.FAIL;
          notifyListeners();
        }
      }
      requesting = false;
      dPrint("currentIndex = $currentIndex ${newDatas.length} 条数据。");
      return resp!;
    });
  }
}
