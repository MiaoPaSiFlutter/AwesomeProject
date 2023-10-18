/*
Flutter 监听多种 Notification
https://www.jianshu.com/p/97a661e72f60
*/
import 'package:flutter/material.dart';

/// 添加扩展
extension NotificationExt on Widget {
  NotificationListener<T> intoNotification<T extends Notification>(
      {Key? key, NotificationListenerCallback<T>? onNotification}) {
    return NotificationListener<T>(
        key: key, onNotification: onNotification, child: this);
  }
}
