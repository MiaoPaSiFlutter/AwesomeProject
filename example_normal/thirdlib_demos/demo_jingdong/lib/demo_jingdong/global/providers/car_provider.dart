import 'package:demo_jingdong/demo_jingdong.dart';

class CarProvider extends ScreenViewModel {
  //全部数据
  Map responseData = {};
  //顶部操作按钮
  List tabMenus = [];
  //门店
  List vendors = [];

  //已选中的数据
  List selectedVendorIds = [];
  Map selectedDatas = {};
  bool selectedAll = false;

  CarProvider({String? functionId}) {
    // _functionId = functionId;
  }

  Future<void> getPageDatas() async {
    if (responseData.isEmpty) {
      state = ScreenState.LOADING;
      notifyListeners();
    }

    MpsfResponse resp = await JdService.cartInfo();
    responseData = resp.jsonData;
    tabMenus = responseData["tabMenus"] ?? [];
    vendors = responseData["cartInfo"]?["vendors"] ?? [];
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

  void updateTotalSelect(bool? selectAll) {
    if (selectAll == true) {
      selectedAll = true;
      List vendorIds = _getAllVendorIds();
      selectedVendorIds.addAll(vendorIds);
      for (var vendorId in vendorIds) {
        List goodIds = _getAllGoodIds(vendorId);
        selectedDatas[vendorId] = goodIds;
      }
    } else {
      selectedAll = false;
      selectedVendorIds.clear();
      selectedDatas = {};
    }
    notifyListeners();
  }

  ///更新已选中店铺数据
  void updateSelectedVendorIds(int? vendorId) {
    if (vendorId == null) {
      return;
    }
    List goodIds = _getAllGoodIds(vendorId);
    if (selectedVendorIds.contains(vendorId)) {
      selectedVendorIds.remove(vendorId);
      selectedDatas.removeWhere((key, value) => key == vendorId);
    } else {
      selectedVendorIds.add(vendorId);
      selectedDatas[vendorId] = goodIds;
    }

    //判断是否全选
    List vendorIds = _getAllVendorIds();
    if (selectedVendorIds.length == vendorIds.length) {
      selectedAll = true;
    } else {
      selectedAll = false;
    }

    notifyListeners();
  }

  ///更新已选中商品数据
  void updateSelectedGoodIds(String? goodId, int? vendorId) {
    if (goodId == null || vendorId == null) {
      return;
    }

    if (!selectedDatas.keys.contains(vendorId)) {
      selectedDatas[vendorId] = [];
    }

    List goodIds = selectedDatas[vendorId];
    if (goodIds.contains(goodId)) {
      goodIds.remove(goodId);
    } else {
      goodIds.add(goodId);
    }

    List totalGoodIds = _getAllGoodIds(vendorId);

    selectedVendorIds.remove(vendorId);
    if (totalGoodIds.length == goodIds.length) {
      selectedVendorIds.add(vendorId);
    } else {
      selectedVendorIds.remove(vendorId);
    }

    //判断是否全选
    List vendorIds = _getAllVendorIds();
    if (selectedVendorIds.length == vendorIds.length) {
      selectedAll = true;
    } else {
      selectedAll = false;
    }

    notifyListeners();
  }

  List _getAllVendorIds() {
    List vendorIds = [];
    for (var element in vendors) {
      int? vendorId = element?["vendorId"] ?? -1;
      if (vendorId != -1) {
        vendorIds.add(vendorId);
      }
    }
    return vendorIds;
  }

  List _getAllGoodIds(int? vendorId_) {
    List goodIds = [];
    for (var element in vendors) {
      int? vendorId = element?["vendorId"] ?? -1;

      if (vendorId == vendorId_) {
        List sorted = element["sorted"] ?? [];
        for (var sorte in sorted) {
          int itemType = sorte["itemType"] ?? -1;

          ///分类型
          if (itemType == 1) {
            List ids = _getGoodIdsForItemType1(sorte);
            goodIds.addAll(ids);
          } else if (itemType == 9) {
            List ids = _getGoodIdsForItemType9(sorte);
            goodIds.addAll(ids);
          }
        }
        continue;
      }
    }
    return goodIds;
  }

  List _getGoodIdsForItemType1(Map? sorte) {
    List goodIds = [];
    String goodId = "${sorte?["item"]?["Id"]}";
    goodIds.add(goodId);
    return goodIds;
  }

  List _getGoodIdsForItemType9(Map? sorte) {
    List goodIds = [];
    List items = sorte?["item"]["items"] ?? [];
    for (var element in items) {
      String goodId = "${element["item"]?["Id"]}";
      goodIds.add(goodId);
    }
    return goodIds;
  }
}
