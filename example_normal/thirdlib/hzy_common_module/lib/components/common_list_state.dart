/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-20 10:16:37
 * @LastEditors: TT
 * @LastEditTime: 2023-09-07 17:38:25
 */

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';
import '../utils/utils.dart';
import 'common_place_holder_widget.dart';
import 'common_refresh_widgets.dart';
import 'common_state.dart';

class CommonListState<T extends StatefulWidget> extends CommonState<T>
    with HzyAbstracRefreshWidget, HzyAbstracRefreshMehod {
  /// 刷新控制器
  EasyRefreshController? refreshController;

  /// 配置下啦刷新
  bool controlFinishRefresh = true;

  /// 配置上啦加载
  bool controlFinishLoad = true;

  /// =============== UI配置 =============== ///
  ///
  @override
  Widget createBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    return createRefreshWidget(
      context,
    );
  }

  @override
  Widget createRefreshWidget(
    BuildContext context,
  ) {
    Widget body = EasyRefresh(
      controller: refreshController,
      onRefresh: () async {
        configRefresh();
      },
      onLoad: () async {
        configLoading();
      },
      header: createHeader(),
      footer: createFooter(),
      child: createListView(context),
    );
    return body;
  }

  /// 配置刷新header
  Header? createHeader() {
    return CommonRefreshWidget.configHeader();
  }

  /// 配置刷新footer
  Footer? createFooter() {
    return CommonRefreshWidget.configFooter();
  }

  @override
  Widget createListView(
    BuildContext context,
  ) {
    throw UnimplementedError();
  }

  @override
  Widget createListitem(BuildContext context, int index) {
    throw UnimplementedError();
  }

  /// =============== 网络事件 =============== ///

  /// =============== 触发事件 =============== ///

  // 点击缺省页触发事件
  @override
  tapPlaceHoldWidgetMethod({
    required CommonPlaceHoldType placeHoldType,
  }) {}

  // 上啦加载触发事件
  @override
  void configLoading() {
    page++;
    getNetWorkData(
      type: 2,
      info: configNetWorkParmas(),
    );
  }

  // 下啦刷新触发事件
  @override
  void configRefresh() {
    page = 1;
    getNetWorkData(
      type: 1,
      info: configNetWorkParmas(),
    );
  }

  // 创建刷新控制器
  @override
  void configRefreshController() {
    refreshController = EasyRefreshController(
      controlFinishLoad: controlFinishLoad,
      controlFinishRefresh: controlFinishRefresh,
    );
  }

  // 配置结束刷新操作
  PageState configRefreshPageState({
    int? allNum,
    int? netWorkNum,
    required int type,
  }) {
    return endRefresh(
      type: type,
      pageState: HzyNormalTools.configPageState(
        allNum: allNum ?? 0,
        networkNum: netWorkNum ?? 0,
      ),
    );
  }

  // 执行结束刷新
  @override
  PageState endRefresh({required int type, required PageState pageState}) {
    return configEndRefresh(
      type: type,
      state: pageState,
      refreshController: refreshController,
    );
  }
}
