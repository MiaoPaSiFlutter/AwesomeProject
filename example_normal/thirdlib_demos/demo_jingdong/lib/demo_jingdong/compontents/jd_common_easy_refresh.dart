import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

/// The status returned after the task is completed.
enum CommonIndicatorResult {
  /// No state until the task is not triggered.
  none,

  /// Task succeeded.
  success,

  /// Task failed.
  fail,

  /// No more data.
  noMore,
}

class JdCommonEasyRefreshController extends EasyRefreshController {
  /// 要将父类controlFinishRefresh，controlFinishLoad两个参数设置为true，否则会报错
  JdCommonEasyRefreshController()
      : super(controlFinishRefresh: true, controlFinishLoad: true);

  /// Reset Header indicator state.
  void mpsfResetHeader() {
    resetHeader();
  }

  /// Reset Footer indicator state.
  void mpsfResetFooter() {
    resetFooter();
  }

  /// Finish the refresh task and return the result.
  /// [result] Result of task completion.
  void mpsfFinishRefresh(
      [CommonIndicatorResult result = CommonIndicatorResult.success]) {
    finishRefresh(getIndicatorResult(result));
  }

  /// Finish the load task and return the result.
  /// [result] Result of task completion.
  void mpsfFinishLoad(
      [CommonIndicatorResult result = CommonIndicatorResult.success]) {
    finishLoad(getIndicatorResult(result));
  }

  IndicatorResult getIndicatorResult(CommonIndicatorResult result) {
    if (result == CommonIndicatorResult.success) {
      return IndicatorResult.success;
    } else if (result == CommonIndicatorResult.fail) {
      return IndicatorResult.fail;
    } else if (result == CommonIndicatorResult.noMore) {
      return IndicatorResult.noMore;
    } else {
      return IndicatorResult.none;
    }
  }
}

class JdCommonEasyRefresh extends StatefulWidget {
  /// Try to avoid including multiple ScrollViews.
  /// Or set separate ScrollPhysics for other ScrollView.
  /// Otherwise use [EasyRefresh.builder].
  final Widget? child;

  /// EasyRefresh controller.
  final JdCommonEasyRefreshController? controller;

  /// Refresh callback.
  /// Triggered on refresh.
  /// When null, disable refresh.
  /// The Header current state is [IndicatorMode.processing].
  /// More see [IndicatorNotifier._onTask].
  final FutureOr Function()? onRefresh;

  /// Load callback.
  /// Triggered on load.
  /// When null, disable load.
  /// The Footer current state is [IndicatorMode.processing].
  /// More see [IndicatorNotifier._onTask].
  final FutureOr Function()? onLoad;

  const JdCommonEasyRefresh({
    Key? key,
    this.child,
    this.controller,
    this.onRefresh,
    this.onLoad,
  }) : super(key: key);

  @override
  State<JdCommonEasyRefresh> createState() => _JdCommonEasyRefreshState();
}

class _JdCommonEasyRefreshState extends State<JdCommonEasyRefresh> {
  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: widget.controller,
      header: const ClassicHeader(),
      footer: const ClassicFooter(),
      onRefresh: widget.onRefresh,
      onLoad: widget.onLoad,
      child: widget.child,
    );
  }
}
