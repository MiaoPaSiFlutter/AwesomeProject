import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
// 京东demo
import 'account/views/login_view.dart';
import 'account_set/account_set_view.dart';
import 'browse_history/browse_history_view.dart';
import 'category/views/category_view.dart';
import 'discover/views/discover_view.dart';
import 'dynamic-fonts/DynamicFontsView.dart';
import 'guide/views/guide_view.dart';
import 'home/views/home_view.dart';
import 'mine/mine_view.dart';
import 'news/views/news_view.dart';
import 'order/order_view.dart';
import 'product/views/product_view.dart';
import 'shopcar/views/shopcar_view.dart';
import 'splash/views/splash_view.dart';
import 'web/common_web_page.dart';
// azlistview_demo
import './azlistview/azlistview_large_data/views/azlistview_large_data_view.dart';
import './azlistview/car_models/views/car_models_view.dart';
import './azlistview/city_list/views/city_list_view.dart';
import './azlistview/city_list_custom_header/views/city_list_custom_header_view.dart';

class JdHubApp extends GetView<JdHubAppController> {
  const JdHubApp({super.key});

  @override
  JdHubAppController get controller => Get.put(JdHubAppController());

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class JdHubAppController extends GetxController {
  JdHubAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JD"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ..._buildProviderUseList(),
              ..._buildAzlistviewUseList(),
              ..._buildOtherList(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildProviderUseList() {
    List<Widget> list = [];
    list.addAll([
      createSectionTitle('JD'),
      createCommonItem("登录页面", LoginView()),
      createCommonItem("新品页面", NewsView()),
      createCommonItem("浏览历史", BrowseHistoryView()),
      createCommonItem("账户设置", AccountSetView()),
      createCommonItem("我的订单", OrderView()),
      createCommonItem("我的", MineView()),
      createCommonItem("发现", DiscoverView()),
      createCommonItem("分类", const CategoryView()),
      createCommonItem("引导页", const GuideView()),
      createCommonItem("闪屏页", const SplashView()),
      createCommonItem("H5", const CommonWebPage()),
      createCommonItem("商品详情", const ProductView()),
      createCommonItem("首页", HomeView()),
      createCommonItem("购物车", ShopcarView()),
    ]);
    return list;
  }

  List<Widget> _buildAzlistviewUseList() {
    List<Widget> list = [];
    list.addAll([
      createSectionTitle('Azlistview'),
      createCommonItem("Azlistview - 大量数据", const AzlistviewLargeDataView()),
      createCommonItem("CarModelsView", const CarModelsView()),
      createCommonItem("CityListView", const CityListView()),
      createCommonItem(
          "CityListCustomHeaderView", const CityListCustomHeaderView()),
    ]);
    return list;
  }

  List<Widget> _buildOtherList() {
    List<Widget> list = [];
    list.addAll([
      createSectionTitle('Other'),
      createCommonItem(
          "Flutter 的 dynamic_fonts 包允许您（相对）轻松地将动态加载的 Web 托管字体添加到您的应用程序中，就像 google_fonts 包一样，但适用于在任何地方托管的任意字体。Dynamic_fonts 是 google_fonts 的一个分支，公开了更多 API，以便您可以指定自己的字体。",
          DynamicFontsView()),
    ]);
    return list;
  }
}

Widget createSectionTitle(String text) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(5),
    color: Colors.blueAccent,
    child: Text("🔥$text"),
  );
}

Widget createCommonItem(String text, Widget nextWidget) {
  return InkWell(
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Text(text),
    ),
    onTap: () {
      //OrientationBuilder
      Navigator.of(Get.context!).push(MaterialPageRoute(builder: (_) {
        return nextWidget;
      }));
    },
  );
}
