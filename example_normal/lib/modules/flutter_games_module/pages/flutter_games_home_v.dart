import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';
import '../config/flutter_games_config.dart';

class FlutterGamesHomePage extends StatefulWidget {
  const FlutterGamesHomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return FlutterGamesHomePageState();
  }
}

class FlutterGamesHomePageState extends CommonState<FlutterGamesHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  String? createAppBarTitleStr() => LaunchIdConfig.flutterGame.tr;

  FlutterGamesConfig get config => FlutterGamesConfig();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return createBuild(context: context);
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = ListView.builder(
      itemBuilder: configItemBuilder,
      itemCount: config.itemList.length,
    );
    body = Container(child: body);
    return body;
  }

  /// 创建item
  Widget configItemBuilder(BuildContext context, int index) {
    HzyNormalItemModel itemModel = config.itemList[index];
    if (index == 0) {
      itemModel.borderRadius =
          BorderRadius.vertical(top: Radius.circular(16.r));
    } else if (index == config.itemList.length - 1) {
      itemModel.borderRadius =
          BorderRadius.vertical(bottom: Radius.circular(16.r));
    }
    itemModel.rightType = 1;
    itemModel.isShowLine = (index != config.itemList.length - 1);
    Widget body = configNormalDarkItemWidget(
      itemModel: itemModel,
      onOtherTap: (_) {},
    );
    return body;
  }

  @override
  bool get wantKeepAlive => true;
}