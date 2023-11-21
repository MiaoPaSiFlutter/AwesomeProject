import 'package:game_math_app/game_math_app/pages/GameMathApp.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';

import '../../../compontents/interesting_ui_widget.dart';
import '../../../models/interesting_ui_model.dart';

class FlutterGamesHomePage
    extends CommonGetXWidget<FlutterGamesHomeController> {
  FlutterGamesHomePage({Key? key}) : super(key: key);
  @override
  FlutterGamesHomeController get controller =>
      Get.put(FlutterGamesHomeController());
  @override
  bool configSafeAreaTop() => false;
  @override
  bool configIsShowAppBar() => false;

  @override
  Widget createScallBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    return const GamesHomePage();
  }
}

class GamesHomePage extends StatefulWidget {
  const GamesHomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return GamesHomePageState();
  }
}

class GamesHomePageState extends CommonState<GamesHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  String? createAppBarTitleStr() => LaunchIdConfig.flutterGame.tr;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return createBuild(context: context);
  }

  @override
  Widget createScallBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    return GetBuilder<FlutterGamesHomeController>(
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.uiModels.length,
          itemBuilder: (context, index) {
            return InterestingUIWidget(model: controller.uiModels[index]);
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class FlutterGamesHomeController extends CommonGetXController {
  FlutterGamesHomeController();

  var uiModels = [].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  /// give access to currentContext
  BuildContext? get context => Get.context;

  getData() {
    uiModels.assignAll([
      InterestingUIModel(
          title: '编写数学游戏',
          description: '',
          date: '2022年7月24日',
          tags: ['游戏'],
          gifOrPictures: ['screenshots/MathGameUI.gif'],
          app: const GameMathApp(),
          author: 'Mitch Koko',
          url: 'https://youtu.be/2FmDfpI7jPM'),
    ]);
  }
}
