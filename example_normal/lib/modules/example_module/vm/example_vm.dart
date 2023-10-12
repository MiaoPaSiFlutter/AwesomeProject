/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-15 11:43:02
 * @LastEditors: TT
 * @LastEditTime: 2023-07-18 14:22:56
 */
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:hzy_common_module/models/image_normal_model.dart';
import '../models/image_model.dart';
import '../models/tu_chong_model.dart';
import '../models/tu_mock_data.dart';
import '../network/example_api_utils.dart';

class ExampleState extends BaseState {
  List data = [];

  /// 图片数据
  List<ImageModel> imageList = [];

  /// 图虫数据
  List<TuChongItem> feedList = [];
}

class ExampleVM {
  ExampleState state = ExampleState();
  configListNormalData({
    required int page,
  }) async {
    if (page == 1) {
      state.data.clear();
    }

    /// 模拟网络请求，生成数据
    Future.delayed(const Duration(seconds: 2)).then((value) {
      int netNum = Random().nextInt(10);
      for (var i = 0; i < netNum; i++) {
        state.data.add("i");
      }
      state.pageState = HzyNormalTools.configPageState(
          allNum: state.data.length, networkNum: netNum);
    });
  }

  /// 配置图片列表数据
  configLoadImageS({
    required int page,
    String type = "beauty",
    bool isshowload = false,
  }) async {
    var res = await ExampleApiUtilS.loadImageS(
      page: page,
      type: type,
      isshowload: isshowload,
    );
    if (page == 1) {
      state.imageList.clear();
    }
    List<ImageModel> netList = [];
    if (res.ok) {
      ImageListModel imageListModel = ImageListModel.fromJson(res.data);
      netList = imageListModel.list ?? [];
    }
    state.imageList.addAll(netList);
    state.pageState = HzyNormalTools.configPageState(
      allNum: state.imageList.length,
      networkNum: netList.length,
    );
  }

  /// 配置图虫图片数据
  configTuchongData({
    int page = 1,
    bool isshowload = false,
  }) async {
    int? psid;
    if (state.feedList.isNotEmpty) {
      psid = state.feedList.last.postId;
    }
    if (page == 1) {
      state.feedList.clear();
    }
    List<TuChongItem> list = [];
    HzyNormalResponse res = HzyNormalResponse.success(netdata: {});
    if (kIsWeb) {
      /// 由于图虫Demo 接口不支持Web,只能模拟数据
      if (mockData.length > page) {
        res.response = mockData[page - 1];
      } else {
        res.response = {
          "is_history": false,
          "counts": 10,
          "feedList": [],
          "message": "添加成功",
          "more": true,
          "result": "SUCCESS"
        };
      }
    } else {
      res = await ExampleApiUtilS.loadtuchongData(
        page: page,
        lastPostId: psid,
        showload: isshowload,
      );
    }
    if (res.ok) {
      TuChongSource tuChongSource = TuChongSource.fromJson(res.response!);
      list = tuChongSource.feedList ?? [];
    }
    state.feedList.addAll(list);
    state.pageState = HzyNormalTools.configPageState(
      allNum: state.feedList.length,
      networkNum: list.length,
    );
  }

  /// 配置通用图片数据源
  configNormalImageListData({
    required int page,
    String type = "beauty",
    bool isshowload = false,
  }) async {
    if (kIsWeb) {
      await configTuchongData(
        page: page,
        isshowload: isshowload,
      );
    } else {
      await configLoadImageS(
        page: page,
        type: type,
        isshowload: isshowload,
      );
    }
  }

  static configDetailImageModelList(
      {required TuChongItem tuChongItem, double? width}) {
    List<ImageNormalModel> list = List<ImageNormalModel>.from(
      tuChongItem.images!.map(
        (e) => ImageNormalModel(
          url: e.imageUrl,
          heroStr: e.imageUrl,
          size: Size(
            width ?? 0,
            (width ?? 0) / ((e.width ?? 0) / (e.height ?? 1)),
          ),
        ),
      ),
    );

    return list;
  }
}
