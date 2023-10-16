import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';

import 'package:hzy_common_module/hzy_common_module.dart';
import '../vm/news_viewmodel.dart';
import '../widgets/jingxuan_view.dart';
import '../widgets/news_navigationbar.dart';
import '../widgets/qushi_view.dart';

class NewsView extends CommonGetXWidget<NewsController> {
  NewsView({Key? key}) : super(key: key);
  @override
  NewsController get controller => Get.put(NewsController());
  // 隐藏导航条
  @override
  bool configIsShowAppBar() {
    return false;
  }

  @override
  bool configSafeAreaTop() {
    // TODO: implement configSafeAreaTop
    return false;
  }

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
                    JingXuanView(),
                    QuShiView(),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2)),
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
