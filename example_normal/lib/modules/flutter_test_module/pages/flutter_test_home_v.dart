import 'package:animation_demo/animation_demo/pages/TestAnimationApp.dart';
import 'package:canvas_demo/canvas_demo/pages/TestCanvasApp.dart';
import 'package:common_demo/common_demo/pages/TestCommonApp.dart';
import 'package:extended_sliver_demo/extended_sliver_demo/pages/TestExtendedSliverApp.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';
import 'package:scrollerview_demo/scrollerview_demo/pages/TestScrollerViewApp.dart';

import '../../../compontents/interesting_ui_widget.dart';
import '../../../models/interesting_ui_model.dart';

class FlutterTestHomePage extends CommonGetXWidget<FlutterTestHomeController> {
  FlutterTestHomePage({Key? key}) : super(key: key);
  @override
  FlutterTestHomeController get controller =>
      Get.put(FlutterTestHomeController());
  @override
  bool configSafeAreaTop() => false;
  @override
  bool configIsShowAppBar() => false;

  @override
  Widget createScallBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    return const TestHomePage();
  }
}

class TestHomePage extends StatefulWidget {
  const TestHomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return TestHomePageState();
  }
}

class TestHomePageState extends CommonState<TestHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  String? createAppBarTitleStr() => LaunchIdConfig.flutterTest.tr;

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
    return GetBuilder<FlutterTestHomeController>(
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

class FlutterTestHomeController extends CommonGetXController {
  FlutterTestHomeController();

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
          title: 'Animation 相关测试',
          description: '',
          date: '2022年12月29日',
          tags: [],
          app: const TestAnimationApp(),
          author: '',
          url: ''),
      InterestingUIModel(
          title: 'Canvas 相关测试',
          description: '',
          date: '2022年1月25日',
          tags: [],
          app: const TestCanvasApp(),
          author: '',
          url: ''),
      InterestingUIModel(
          title: '其他 相关测试',
          description: '',
          date: '2023年10月22日',
          tags: [],
          app: const TestCommonApp(),
          author: '',
          url: ''),
      InterestingUIModel(
          title: 'ExtendedSliver 相关测试',
          description: '',
          date: '2023年10月13日',
          tags: [],
          app: const TestExtendedSliverApp(),
          author: '',
          url: ''),
      InterestingUIModel(
          title: 'ScrollerView 相关测试',
          description: '',
          date: '2022年10月30日',
          tags: [],
          app: const TestScrollerViewApp(),
          author: '',
          url: ''),
    ]);
  }
}
