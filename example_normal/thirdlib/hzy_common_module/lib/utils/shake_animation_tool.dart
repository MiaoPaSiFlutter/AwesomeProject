/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-29 21:14:29
 * @LastEditors: TT
 * @LastEditTime: 2023-03-29 21:34:01
 */

import 'package:flutter/material.dart';

class ShakeAnimationTool {
  late final AnimationController shakeController;

  late Animation<double> animation;
  Function({AnimationStatus status})? listener;

  /// 开始动画
  star({
    bool? reverse = true,
  }) {
    if (reverse == true) {
      shakeController.repeat(reverse: true);
    } else {
      shakeController.forward();
    }
  }

  /// 停止动画
  stop() {
    shakeController.stop();
  }

  /// 释放控制器
  dispose() {
    shakeController.dispose();
  }

  /// 创建动画
  createAnimation({
    required TickerProvider tickerProvider,
    Duration? duration = const Duration(milliseconds: 200),
    double begin = 0.008,
    double end = -0.008,
    bool isListen = false,
  }) {
    shakeController = AnimationController(
      vsync: tickerProvider,
      duration: duration,
      reverseDuration: duration,
    );
    animation = Tween(
      begin: begin,
      end: end,
    ).animate(
      shakeController,
    );

    if (isListen) {
      shakeController.addStatusListener((status) {
        if (listener != null) {
          listener!(status: status);
        }
      });
    }
  }
}
