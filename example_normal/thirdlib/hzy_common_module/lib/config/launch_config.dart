/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-19 21:42:49
 * @LastEditors: TT
 * @LastEditTime: 2023-09-07 17:42:34
 */
import 'package:get/get.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

class LaunchenUS extends HzyNormalLaucnhAbs {
  factory LaunchenUS.getInstance() => _instance;
  static final LaunchenUS _instance = LaunchenUS._internal();
  LaunchenUS._internal();
}

class LaunchzhCN extends HzyNormalLaucnhAbs {
  factory LaunchzhCN.getInstance() => _instance;
  static final LaunchzhCN _instance = LaunchzhCN._internal();
  LaunchzhCN._internal();
}

class LaunchConfig extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': LaunchenUS.getInstance().launch,
        'zh_CN': LaunchzhCN.getInstance().launch,
      };
}
