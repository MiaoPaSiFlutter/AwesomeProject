/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-06-25 10:23:27
 * @LastEditors: TT
 * @LastEditTime: 2023-07-07 16:18:39
 */
import 'package:flutter/material.dart';

import '../hzy_normal_abstract/hzy_normal_abstract_index.dart';
import 'hzy_life_cycle_state.dart';

abstract class HzyLisState<T extends StatefulWidget>
    extends HzyLifeCycleState<T>
    with HzyAbstracRefreshWidget, HzyAbstracRefreshMehod {
  @override
  Widget createBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return createRefreshWidget(context);
  }

  /// 创建列表 item
  @override
  Widget createListitem(BuildContext context, int index) {
    return Container();
  }

  /// 创建缺省页界面
  @override
  Widget? createEmptyWidget();
}
