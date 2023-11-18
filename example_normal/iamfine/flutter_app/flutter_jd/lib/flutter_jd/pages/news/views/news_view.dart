import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../vm/news_viewmodel.dart';
import '../widgets/carefully_chosen/carefully_chosen_widget.dart';
import '../widgets/news_navigationbar.dart';
import '../widgets/tendency/qushi_view.dart';

class NewsView extends CommonGetXWidget<NewsController> {
  NewsView({Key? key}) : super(key: key);
  @override
  NewsController get controller => Get.put(NewsController());
  @override
  bool configIsShowAppBar() => false;
  @override
  bool configSafeAreaTop() => false;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return ProviderWidget<NewsViewModel>(
      model: controller.vmModel,
      onReady: (model) {
        controller.vmModel.getPageDatas();
      },
      builder: (context, model, child) {
        return MultiStateWidget(
          state: controller.vmModel.state,
          builder: (context) {
            return Stack(
              children: [
                PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  children: const [
                    CarefullyChosenWidget(),
                    QuShiView(),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent, width: 2)),
                  child: NewsNavigationBar(
                    onTap: (index) {
                      controller.pageController.jumpToPage(index);
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class NewsController extends CommonGetXController {
  final PageController pageController = PageController();
  final vmModel = NewsViewModel();
}
