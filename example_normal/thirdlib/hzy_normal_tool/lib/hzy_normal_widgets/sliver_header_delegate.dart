/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-07-10 11:05:10
 * @LastEditors: TT
 * @LastEditTime: 2023-09-13 09:41:37
 */
import 'package:flutter/material.dart';

import '../hzy_normal_tools/hzy_normal_tools.dart';

typedef SliverHeaderBuilder = Widget Function(
  BuildContext context,
  double shrinkOffset,
  bool overlapsContent,
);

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  // child 为 header
  SliverHeaderDelegate({
    required this.maxHeight,
    this.minHeight = 0,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        assert(minHeight <= maxHeight && minHeight >= 0);

  //最大和最小高度相同
  SliverHeaderDelegate.fixedHeight({
    required double height,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        maxHeight = height,
        minHeight = height;

  //需要自定义builder时使用
  SliverHeaderDelegate.builder({
    required this.maxHeight,
    this.minHeight = 0,
    required this.builder,
  });

  final double maxHeight;
  final double minHeight;
  final SliverHeaderBuilder builder;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    //测试代码：如果在调试模式，且子组件设置了key，则打印日志
    assert(() {
      if (child.key != null) {
        dPrint('${child.key}: shrink: $shrinkOffset，overlaps:$overlapsContent');
      }
      return true;
    }());
    // 让 header 尽可能充满限制的空间；宽度为 Viewport 宽度，
    // 高度随着用户滑动在[minHeight,maxHeight]之间变化。
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent ||
        oldDelegate.minExtent != minExtent;
  }
}

/// 创建Sliver依赖
configSliverOverlapAbsorber({
  required Widget sliver,
  required BuildContext context,
}) {
  Widget body = SliverOverlapAbsorber(
    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
      context,
    ),
    sliver: sliver,
  );
  return body;
}

/// 创建去除Padding控件
configRemovePadding({
  required BuildContext context,
  required Widget child,
  bool removeLeft = true,
  bool removeTop = true,
  bool removeRight = true,
  bool removeBottom = true,
}) {
  return MediaQuery.removePadding(
    removeTop: removeTop,
    removeBottom: removeBottom,
    removeLeft: removeLeft,
    removeRight: removeRight,
    context: context,
    child: child,
  );
}
