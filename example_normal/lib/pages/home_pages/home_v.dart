/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-09 21:39:44
 * @LastEditors: TT
 * @LastEditTime: 2023-05-15 21:32:31
 */

import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends CommonState<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  String? get appBarTitle => "首页";

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return createBuild(context: context);
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Container();
    return body;
  }

  @override
  bool get wantKeepAlive => true;
}
