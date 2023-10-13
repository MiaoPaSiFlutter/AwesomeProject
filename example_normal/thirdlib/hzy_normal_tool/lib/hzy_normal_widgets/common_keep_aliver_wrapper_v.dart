/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-07-10 11:09:25
 * @LastEditors: TT
 * @LastEditTime: 2023-07-10 11:09:26
 */
import 'package:flutter/material.dart';

class CommonKeepAliverWrapper extends StatefulWidget {
  const CommonKeepAliverWrapper({
    super.key,
    required this.child,
    this.keepAlive,
  });
  final bool? keepAlive;
  final Widget child;
  @override
  State<StatefulWidget> createState() {
    return CommonKeepAliverWrapperState();
  }
}

class CommonKeepAliverWrapperState extends State<CommonKeepAliverWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant CommonKeepAliverWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive ?? true;
}
