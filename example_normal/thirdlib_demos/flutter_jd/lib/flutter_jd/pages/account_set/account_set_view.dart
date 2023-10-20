import 'dart:math';
import 'dart:ui';
import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class AccountSetView extends CommonGetXlistWidget<AccountSetController> {
  AccountSetView({Key? key}) : super(key: key);

  @override
  String? createAppBarTitleStr() => '账户设置';
  @override
  AccountSetController get controller => Get.put(AccountSetController());

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return controller.obx(
      (data) => buildScrollView(),
      onEmpty: const Center(child: Text('No data found')), //空数据显示
      onError: (error) => Center(
        child: InkWell(
          onTap: controller.initializeData,
          child: Text(error ?? '请求失败，点击重试'),
        ),
      ), //出错界面显示
    );
  }

  Widget buildScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: controller.listDatas.length, (context, index) {
            return CardFloor(floor: controller.listDatas[index]);
          }),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: max(MediaQueryData.fromView(window).padding.bottom, 40),
          ),
        )
      ],
    );
  }
}

class CardFloor extends StatelessWidget {
  final Map? floor;
  const CardFloor({Key? key, this.floor}) : super(key: key);
//nodes
  @override
  Widget build(BuildContext context) {
    final List nodes = floor?['data']?["nodes"] ?? [];
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      margin: const EdgeInsets.only(top: 10),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Column(
            children: nodes.map((item) {
              final text = item?["title"]?["value"] ?? "";
              return createCellItemWidget(
                useSliver: false,
                text: text,
                onTap: () {
                  if (text == '通用') {
                    // currentToPage(MyPageId.GENERAL);
                  } else if (text == '关于京东APP') {
                    // currentToPage(CommonPageId.WEB,
                    //     parameters: {"url": "https://www.baidu.com/"});
                  } else {
                    // currentToPage(MyPageId.BROWSE_HISTORY);
                  }

                  // if (text == '通用') {
                  //   CommonSpUtil.saveThemeType(type: 0);
                  //   ThemeTool.changeTheme();
                  // } else {
                  //   CommonSpUtil.saveThemeType(type: 1);
                  //   ThemeTool.changeTheme();
                  // }
                },
              );
            }).toList(),
          )),
    );
  }
}

class AccountSetController extends CommonGetXListController with StateMixin {
  final easyRefreshCtl = JdCommonEasyRefreshController();
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

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> initializeData() async {
    try {
      MpsfResponse response = await JdService.myjdSetBusiness();

      Map<String, dynamic> data = response.jsonData;

      List historyList = data["floors"] ?? [];
      List newDatas = [];
      for (var item in historyList) {
        newDatas.add(item);
      }
      listDatas = newDatas;
      change(listDatas, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error('Error'));
    } finally {
      easyRefreshCtl.finishRefresh();
    }
  }
}
