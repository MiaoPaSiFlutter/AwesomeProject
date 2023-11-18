/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-20 08:49:44
 * @LastEditors: TT
 * @LastEditTime: 2023-03-20 08:49:46
 */

import 'package:easy_refresh/easy_refresh.dart';

class CommonRefreshWidget {
  static configHeader() {
    return const ClassicHeader(
      dragText: "下拉刷新",
      armedText: "释放开始",
      readyText: "刷新中...",
      processingText: "刷新中...",
      processedText: "成功了",
      noMoreText: "没有更多",
      failedText: "失败了",
      messageText: "最后更新于 %T",
      safeArea: false,
    );
  }

  static configFooter() {
    return const ClassicFooter(
      dragText: "下拉刷新",
      armedText: "释放开始",
      readyText: "刷新中...",
      processingText: "刷新中...",
      processedText: "成功了",
      noMoreText: "没有更多",
      failedText: "失败了",
      messageText: "最后更新于 %T",
      infiniteOffset: 20,
    );
  }
}
