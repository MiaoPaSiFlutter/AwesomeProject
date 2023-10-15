import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:example_normal/modules/example_module/module_index.dart';
import 'package:example_normal/modules/my_module/config/my_en_us_config.dart';
import 'package:example_normal/modules/my_module/config/my_zh_cn_config.dart';
//京东模块儿
import 'package:demo_jingdong/demo_jingdong.dart';

import 'http_normal_config.dart';

class GlobalConfig {
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    LaunchzhCN.getInstance().configAllLaunch(list: [
      zhCN,
      examplezhCN,
      myzhCN,
      jingdongzhCN,
    ]);

    LaunchenUS.getInstance().configAllLaunch(list: [
      enUS,
      examplenUS,
      myenUS,
      jingdongenUS,
    ]);

    await initThirdParty();
    await initNetWork();
    await initNormalDefault();
  }

  /// 初始化第三发
  static initThirdParty() async {
    EasyLoading.instance.displayDuration = const Duration(
      milliseconds: 1500,
    );
    await SharedPreferencesTool.getInstance();
  }

  /// 配置默认数据
  static initNormalDefault() async {}

  /// 配置网络请求
  static initNetWork() async {
    /**
     * 后台返回数据格式
     * {
     *  code:200,
     *  message:"成功",
     *  result:{}
     * }
     * 
    */
    HzyNormalDefaultTransFormer.getInstance().setHttpConfig(
      config: HzyNormalHttpResponeConfig(
        status: "code",
        code: "Stamp",
        msg: "message",
        data: "result",
        successcode: 200,
      ),
    );

    // 注入网络请求组件
    Get.put(
      HzyNormalClient(
        normalHttpConfig: HzyNormalHttpConfig(
          baseUrl: HttpNormalConfig.configbaseUrl(),
          interceptors: [],
        ),
      ),
      permanent: true,
      tag: HzyNormalClient.defaultClientTag,
    );
  }
}
