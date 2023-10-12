 
 

import 'package:hzy_common_module/hzy_common_module.dart';

class TuchongHttpTransformer extends HzyNormalTransFormer {
  @override
  HzyNormalResponse parse(Response response) {
    var json = response.data as Map<String, dynamic>?;
    if (json == null) {
      return HzyNormalResponse.fail(
        data: json,
        errorMsg: '请求的数据为空',
        errorCode: -1,
      );
    }
    var status = json["result"];
    if (status == "SUCCESS") {
      return HzyNormalResponse.success(
        netdata: json["feedList"],
        response: json,
        reqmsg: json["message"],
      );
    } else {
      return HzyNormalResponse.fail(
        data: json,
        errorMsg: '请求的数据为空',
        errorCode: -1,
      );
    }
  }
}
