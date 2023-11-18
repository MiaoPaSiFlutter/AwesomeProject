/*
 * @Description: 
 * @Version: 2.0
 * @Autor: ftt
 * @Date: 2022-06-09 11:20:18
 * @LastEditors: TT
 * @LastEditTime: 2023-09-07 17:37:03
 */

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'common_getx_v.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';
import 'common_getx_controller.dart';
import 'common_refresh_widgets.dart';

abstract class CommonGetXlistWidget<T extends CommonGetXListController>
    extends CommonGetXWidget<T> with HzyAbstracRefreshWidget {
  CommonGetXlistWidget({Key? key}) : super(key: key);

  @override
  Widget createBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    return createRefreshWidget(context);
  }

  @override
  Widget createRefreshWidget(BuildContext context) {
    Widget body = EasyRefresh(
      key: key,
      controller: controller.refreshController,
      onRefresh: () async {
        controller.configRefresh();
      },
      onLoad: () async {
        controller.configLoading();
      },
      header: createHeader(),
      footer: createFooter(),
      child: createListView(context),
    );
    return body;
  }

  /// 创建列表 item
  @override
  Widget createListitem(BuildContext context, int index) {
    return Container();
  }

  Header? createHeader() {
    return CommonRefreshWidget.configHeader();
  }

  Footer? createFooter() {
    return CommonRefreshWidget.configFooter();
  }
}
