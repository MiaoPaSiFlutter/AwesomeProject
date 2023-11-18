/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-09-23 11:50:22
 * @LastEditors: TT
 * @LastEditTime: 2023-09-23 16:09:39
 */
import 'package:flutter/material.dart';

/// 布局脚手架
mixin HzyLayoutMixin {
  /// 创建脚手架
  Widget createBuild({
    required BuildContext context,
  }) {
    Widget body = configIsNeedLayout()
        ? createLayoutWidget()
        : createLayoutChileWidget(
            context: context,
          );
    return body;
  }

  // 创建layout根视图
  createLayoutWidget() {
    Widget body = LayoutBuilder(
      builder: (context, constraints) {
        return createLayoutChileWidget(
          context: context,
          constraints: constraints,
        );
      },
    );
    return body;
  }

  /// 创建可修改的根视图
  @protected
  createLayoutChileWidget({
    BoxConstraints? constraints,
    required BuildContext context,
  });

  /// 配置是否Layout
  bool configIsNeedLayout() {
    return true;
  }
}
