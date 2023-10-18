import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';

class ProductDetailViewModel extends ScreenViewModel {
  String? shopId;
  String? sku;

  final dataKey = GlobalKey();
  final scrollerViewKey = GlobalKey();
  List floorGlobalKeys = [];
  //定义一个AppBar 的透明度默认值
  double _appBarAlpha = 0;
  int _selectIndex = 0;
  //全部数据
  Map _responseData = {};
  //商品主要
  Map _bpMasterdata = {};
  List _wareImage = []; //商品大图介绍

  //评论数据
  Map _commentInfoData = {};

  //展示的楼层信息「剔除后的」
  List _floors = [];

  double get appBarAlpha => _appBarAlpha;
  int get selectIndex => _selectIndex;
  Map get responseData => _responseData;
  Map get commentInfoData => _commentInfoData;
  Map get bpMasterdata => _bpMasterdata;
  List get floors => _floors;
  List get wareImage => _wareImage;

  ProductDetailViewModel(Map<String, String?> parameters) {
    shopId = parameters["shopId"];
    sku = parameters["sku"];
  }

  Future<void> getWareBusiness() async {
    if (_floors.isEmpty) {
      state = ScreenState.LOADING;
      notifyListeners();
    }

    {
      ///主数据
      MpsfResponse resp =
          await JdService.wareBusiness(shopId: shopId, sku: sku);
      _responseData = resp.jsonData;
      _floors = _responseData["floors"] ?? [];
      _floors.sort(((a, b) => a['sortId'].compareTo(b['sortId'])));
      for (var floor in _floors) {
        String? mId = floor["mId"];
        if (mId == "bpMasterdata") {
          _bpMasterdata = floor;
          _wareImage = _bpMasterdata["data"]["wareImage"] ?? [];
        }
        final floorViewKey = GlobalKey(debugLabel: mId);
        floorGlobalKeys.add({"mId": mId, "key": floorViewKey});
      }
    }

    {
      ///评论数据
      MpsfResponse resp =
          await JdService.getLegoWareDetailComment(shopId: shopId, sku: sku);
      _commentInfoData = resp.jsonData;
    }

    state = ScreenState.CONTENT;
    notifyListeners();
  }

  void updateAppBarAlpha(double alpha) {
    _appBarAlpha = alpha;
    notifyListeners();
  }

  void updateTopSelectIndex(int index) {
    _selectIndex = index;
    notifyListeners();
  }

  Map? getFloorInfo(String? mId) {
    for (var floor in _floors) {
      if (floor["mId"] == mId) {
        return floor;
      }
    }
    return null;
  }

  GlobalKey? getFloorGlobalKey(String? mId) {
    for (var element in floorGlobalKeys) {
      if (element["mId"] == mId) {
        return element["key"];
      }
    }
    return null;
  }

  double getFloorViewOffset(String? mId_) {
    double offSet = 0;
    for (var element in floorGlobalKeys) {
      var mId = element['mId'];
      if (mId == mId_) {
        break;
      }
      GlobalKey? floorKey = getFloorGlobalKey(mId);
      if (floorKey?.currentContext != null) {
        RenderBox renderBox =
            floorKey?.currentContext!.findRenderObject() as RenderBox;
        offSet += renderBox.size.height;
      }
    }
    return offSet;
  }
}
