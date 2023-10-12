import 'package:flutter/material.dart';

import '../models/image_model.dart';

class ExampleTuConfig {
  /// 背景颜色
  static Color backgroundColor = const Color(0xff181818);

  ///  第一次切换
  bool isfistchange = true;

  /// 控制器
  late TabController tabController;

  /// 当前下表
  int index = 0;

  /// 图片数据源
  List<ImageModel> imageList = [];

  /// 创建tabController 控制器
  createTabController({required int length, required TickerProvider vsync}) {
    tabController = TabController(length: length, vsync: vsync);
  }
}
