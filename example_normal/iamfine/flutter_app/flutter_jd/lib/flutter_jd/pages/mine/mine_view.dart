// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'widgets/mine_main_home_view.dart';

class MineView extends CommonGetXlistWidget<MineController> {
  MineView({Key? key}) : super(key: key);
  @override
  bool configIsShowAppBar() => false;
  @override
  bool configSafeAreaTop() => false;
  @override
  MineController get controller => Get.put(MineController());

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return LayoutBuilder(
      builder: (p0, p1) {
        return controller.obx(
          (data) => const MineMainHomeView(),
          onEmpty: const Center(child: Text('No data found')), //空数据显示
          onError: (error) => Center(
            child: InkWell(
              onTap: controller.initializeData,
              child: Text(error ?? '请求失败，点击重试'),
            ),
          ), //出错界面显示
        );
      },
    );
  }
}

class MineController extends CommonGetXListController with StateMixin {
  final appBarAlpha = 0.0.obs;

  var pageIndex = 1;
  var listDatas = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> initializeData() async {
    print("getPersoninfoBusiness --- START");
    await getPersoninfoBusiness();
    print("getPersoninfoBusiness --- END");
    update();
  }
}

extension MineControllerNetExt on MineController {
  /// 获取楼层信息
  Future<void> getPersoninfoBusiness() async {
    if (listDatas.isEmpty) {
      change(null, status: RxStatus.loading());
    }

    List newDatas = [];

    //执行网络请求
    MpsfResponse resp = await JdService.personinfoBusiness();
    List floors = resp.jsonData["floors"] ?? [];
    for (var item in floors) {
      newDatas.add(item);
    }

    listDatas = newDatas;

    change(listDatas, status: RxStatus.success());
  }
}
