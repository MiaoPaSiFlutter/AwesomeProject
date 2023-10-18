import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'mpsf_home_page.dart';

class HomeView extends CommonGetXWidget<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  bool configIsShowAppBar() => false;
  @override
  bool configSafeAreaTop() => false;
  @override
  HomeController get controller => Get.put(HomeController());
  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return const MpsfHomePage();
  }
}

// /// 页面保活
// class HomeView extends StatefulWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// /// Page - State with AutomaticKeepAliveClientMixin
// class _HomeViewState extends State<HomeView>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return const HomeViewWrap();
//   }

//   @override
//   bool get wantKeepAlive => true;
// }

// class HomeViewWrap extends GetView<HomeController> {
//   const HomeViewWrap({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(width: 1, color: Colors.transparent),
//         color: const Color(0xFFEEEEEE),
//       ),
//       child: CustomScrollView(
//         slivers: <Widget>[
//           SliverPadding(
//             padding: const EdgeInsets.all(10),
//             sliver: SliverGrid.count(
//               crossAxisCount: 2,
//               mainAxisSpacing: 10,
//               crossAxisSpacing: 10,
//               children: List.generate(8, (index) {
//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Container(
//                     color: const Color(0xFFFFFFFF),
//                     alignment: Alignment.center,
//                     child: Text('$index',
//                         style:
//                             const TextStyle(color: Colors.black, fontSize: 20)),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate((content, index) {
//               return Container(
//                 height: 85,
//                 alignment: Alignment.center,
//                 color: Colors.primaries[index % Colors.primaries.length],
//                 child: Text(
//                   '$index',
//                   style: const TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               );
//             }, childCount: 25),
//           ),
//         ],
//       ),
//     );
//   }
// }

class HomeController extends CommonGetXController {
  final count = 0.obs;
  @override
  void onInit() {
    dPrint("HomeController - onInit");
    super.onInit();
  }

  @override
  void onClose() {
    dPrint("HomeController - onClose");
    super.onClose();
  }

  void increment() => count.value++;
}
