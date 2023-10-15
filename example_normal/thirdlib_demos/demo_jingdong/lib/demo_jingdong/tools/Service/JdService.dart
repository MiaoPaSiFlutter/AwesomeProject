import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
//因为使用Getx进行状态管理，使用dio进行HTTP请求，它们都有response类，所以会造成冲突，
//解决方法：即修改get的引入方式：
import 'package:get/get.dart' hide Response;

import '../JMGL/JMGLManager.dart';
import '../Network/http_utils.dart';
import '../Network/response/response.dart';

class JdService {
  static String basePath = "assets/datas-mock/20220629/";
  static String kBaseUrl =
      "https://gitlab.com/ikumock-data/MockDatas/-/raw/JingDong/20220629/functionId/@new/";

  ///使用md5加密
  static String generateMD5(String data) {
    Uint8List content = const Utf8Encoder().convert(data);
    Digest digest = md5.convert(content);
    return digest.toString();
  }

  /// 加载网络数据
  static Future<MpsfResponse> loadFromServer(String path) async {
    String fullUrl = kBaseUrl + path;
    try {
      Response response = await Http().dio.get(fullUrl);
      return MpsfResponse(dioResponse: response);
    } catch (e) {
      Response response = Response(
          data: null,
          statusCode: e.hashCode,
          requestOptions: RequestOptions(path: fullUrl));
      return MpsfResponse(dioResponse: response);
    }
  }

  /// 加载网络数据
  static Future<MpsfResponse> getJsonDATA(String path) async {
    //保存数据
    String fullUrl = kBaseUrl + path;
    var id = generateMD5(fullUrl);
    String? jsonStr = await JMGLManager.shared().syncFetchFile(path: id);
    if (jsonStr != null) {
      print("$path 本地有数据");
      Response response = Response(
          data: jsonStr,
          statusCode: 200,
          requestOptions: RequestOptions(path: fullUrl));
      await 1.delay();
      return MpsfResponse(dioResponse: response);
    } else {
      print("$path 本地无数据 - 开始请求");
      MpsfResponse respM = await loadFromServer(path);
      if (!respM.hasError) {
        JMGLManager.shared().asyncSaveFile(contents: respM.data, path: id);
      }
      print("$path 本地无数据 - 结束请求");

      return respM;
    }
  }

  /// 首页-主要信息
  static Future<MpsfResponse> welcomeHome() async {
    MpsfResponse respM = await getJsonDATA("tab/home/welcomeHome.json");
    return respM;
  }

  /// 首页
  static Future<MpsfResponse> categoryHome(Map parmers) async {
    String pcid = "${parmers["pcid"]}";
    String path = "tab/home/category/pcid/$pcid/categoryHome.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 为你推荐
  static Future<MpsfResponse> uniformRecommend(int page) async {
    String path = "tab/home/category/pcid/234/categoryFeeds_$page.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 分类-左侧列表
  static Future<MpsfResponse> entranceCatalog() async {
    String path = "tab/category/entranceCatalog.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 分类-右侧信息[根据cid值获取不同数据]
  static Future<MpsfResponse> newSubCatalog(int cid) async {
    String path = "tab/category/cid/$cid/result_1.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 分类-右侧促销信息
  static Future<MpsfResponse> getCmsPromotionsListByCatelogyID() async {
    String path = "tab/category/getCmsPromotionsListByCatelogyID.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 发现顶部items
  static Future<MpsfResponse> jdDiscoveryFloorWithList() async {
    String path = "tab/discovery/jdDiscoveryFloorWithList.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 发现-[关注]
  static Future<MpsfResponse> followV2EnterMainPage() async {
    String path = "tab/discovery/follow/followV2EnterMainPage.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  // /// 发现-[晒一晒]
  // static Future<MpsfResponse> ugc_IndexFeedStream() async {
  //   String path = "functionId/discovery/feedStream/ugc_IndexFeedStream.json";
  //   MpsfResponse respM = await getJsonDATA(path);
  //   return respM;
  // }

  // /// 发现-[5G]
  // static Future<MpsfResponse> discovery5GFeed() async {
  //   MpsfResponse respM = await baseLoad("discovery5GFeed.json");
  //   return respM;
  // }

  // /// 发现-[直播]
  // static Future<MpsfResponse> discoveryLiveListWithTabV836() async {
  //   MpsfResponse respM = await baseLoad("discoveryLiveListWithTabV836.json");
  //   return respM;
  // }

  // /// 发现-[视频]
  // static Future<MpsfResponse> discVideoVertList() async {
  //   MpsfResponse respM = await baseLoad("discVideoVertList.json");
  //   return respM;
  // }

  /// 我的
  static Future<MpsfResponse> personinfoBusiness() async {
    String path = "tab/person/personinfoBusiness.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 为你推荐
  static Future<MpsfResponse> getTabMineRecommend(int page) async {
    String path = "tab/person/recommend/categoryFeeds_$page.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 我的-更多工具
  static Future<MpsfResponse> moreActivityInfo() async {
    String path = "tab/person/moreActivityInfo.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 我的-设置
  static Future<MpsfResponse> myjdSetBusiness() async {
    String path = "tab/person/myjdSetBusiness.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 订单-筛选
  static Future<MpsfResponse> allOrdersFunctionNewList() async {
    String path = "tab/person/order/allOrdersFunctionNewList.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 订单-常购清单
  static Future<MpsfResponse> newPurchaseWareCheck() async {
    String path = "tab/person/order/newPurchaseWareCheck.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 订单-已取消
  static Future<MpsfResponse> canceledOrderList(int page) async {
    String path = "tab/person/order/cancleOrder/result_$page.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 订单-全部
  static Future<MpsfResponse> newUserAllOrderList(int page) async {
    String path = "tab/person/order/allOrder/result_$page.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 订单-已完成
  static Future<MpsfResponse> userCompletedOrderList(int page) async {
    String path = "tab/person/order/completedOrder/result_$page.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 订单-待收货
  static Future<MpsfResponse> wait4Delivery(int page) async {
    String path = "tab/person/order/wait4DeliveryOrder/result_$page.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 订单-待付款
  static Future<MpsfResponse> wait4Payment(int page) async {
    String path = "tab/person/order/wait4PaymentOrder/result_$page.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 商品详情
  static Future<MpsfResponse> wareBusiness(
      {String? shopId, String? sku}) async {
    String path = "product/shopId/$shopId/sku/$sku/wareBusiness.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 商品评论
  static Future<MpsfResponse> getLegoWareDetailComment(
      {String? shopId, String? sku}) async {
    String path =
        "product/shopId/$shopId/sku/$sku/getLegoWareDetailComment.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 浏览记录
  static Future<MpsfResponse> browseHistory(int page) async {
    String path = "tab/person/browseHistory/result_$page.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 地址管理
  static Future<MpsfResponse> getAddressByPin() async {
    String path = "tab/person/address/getAddressByPin.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 新建地址
  static Future<MpsfResponse> addAddressPage() async {
    String path = "tab/person/address/addAddressPage.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 通用
  static Future<MpsfResponse> generalFunctionInfo() async {
    String path = "tab/person/generalFunctionInfo.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  // /// 商品详情
  // static Future<MpsfResponse> productDetail() async {
  //   MpsfResponse respM =
  //       await MpsfLoadData.loadJson("${basePath}product_detail.html");
  //   return respM;
  // }

  /// 新品
  static Future<MpsfResponse> getTabHomeInfo() async {
    String path = "tab/xinpin/getTabHomeInfo.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 新品-商品展示
  static Future<MpsfResponse> getTabProductsList(
    int page,
    Map tabInfo,
  ) async {
    int id = tabInfo["id"];
    String path = "tab/xinpin/getTabProductsList/$id/result_$page.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 新品-趋势
  static Future<MpsfResponse> getNewsTrendsTabHomeInfo() async {
    String path = "tab/xinpin/getNewsTrendsTabHomeInfo.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 新品-趋势-商品展示
  static Future<MpsfResponse> getNewsTrendsTabDetails(int page) async {
    String path = "tab/xinpin/getNewsTrendsTabDetails/result_$page.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 发现-推荐
  static Future<MpsfResponse> getRecommendNewFeedsList(int page) async {
    String path = "tab/xinpin/getRecommendNewFeedsList/result_$page.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 发现-关注-首屏数据
  static Future<MpsfResponse> discFollowEnterMainPage() async {
    String path = "tab/discFollow/discFollowEnterMainPage.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  static Future<MpsfResponse> discFollowNextContent(int page) async {
    String path = "tab/discFollow/discFollowNextContent/result_$page.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 购物车
  static Future<MpsfResponse> cartInfo() async {
    String path = "tab/cart/cart.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }

  /// 购物车 - 确认订单
  static Future<MpsfResponse> confirmOrder() async {
    String path = "tab/cart/confirmOrder/currentOrder.json";
    MpsfResponse respM = await getJsonDATA(path);
    return respM;
  }
}
