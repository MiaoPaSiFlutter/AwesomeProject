/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-19 21:33:46
 * @LastEditors: TT
 * @LastEditTime: 2023-04-19 21:33:47
 */

class HzyNormalLaucnhAbs {
  Map<String, String> launch = {};
  configAllLaunch({required List<Map<String, String>> list}) {
    for (var element in list) {
      launch.addAll(element);
    }
  }
}

