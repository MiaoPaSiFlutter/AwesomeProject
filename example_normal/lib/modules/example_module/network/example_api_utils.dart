/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-15 14:30:10
 * @LastEditors: TT
 * @LastEditTime: 2023-05-16 12:58:52
 */

import 'package:hzy_common_module/hzy_common_module.dart';

import 'example_http_config.dart';
import 'tuchong_http_transformer.dart';

class ExampleApiUtilS {
  /// 获取图片列表
  static Future<HzyNormalResponse> loadImageS({
    int page = 0,
    bool isshowload = false,
    String type = "beauty",
  }) async {
    var res = await request(
      path: ExampleHttpConfig.getimages,
      data: {
        "type": type,
        "page": page,
        "size": 10,
      },
      isShowLoad: isshowload,
    );
    return res;
  }

  static Future<HzyNormalResponse> loadGetMiniVideo({
    int page = 0,
    bool isshowload = false,
  }) async {
    var res = await request(
      path: ExampleHttpConfig.getMiniVideo,
      data: {
        "page": page,
        "size": 10,
      },
      isShowLoad: isshowload,
    );
    return res;
  }

  /// 请求一言名句列表
  static loadSentences({
    bool showload = false,
  }) async {
    return await request(
      path: ExampleHttpConfig.getsentemces,
      isShowLoad: showload,
    );
  }

  /// 获取图虫数据
  static loadtuchongData({
    int page = 1,
    int? lastPostId,
    bool showload = false,
  }) async {
    Map<String, dynamic> data = {};
    if (lastPostId != null) {
      data = {"post_id": lastPostId, "page": page, "type": "loadmore"};
    }
    return await request(
      path: "https://api.tuchong.com/feed-app",
      data: data,
      httpTransformer: TuchongHttpTransformer(),
      isShowLoad: showload,
    );
  }
}
