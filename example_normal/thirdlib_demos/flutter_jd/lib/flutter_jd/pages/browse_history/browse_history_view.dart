import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class BrowseHistoryView extends CommonGetXlistWidget<BrowseHistoryController> {
  BrowseHistoryView({Key? key}) : super(key: key);

  @override
  String? createAppBarTitleStr() => "浏览历史";

  @override
  BrowseHistoryController get controller => Get.put(BrowseHistoryController());

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return controller.obx(
      (data) => buildEasyRefreshView(),
      onEmpty: const Center(child: Text('No data found')), //空数据显示
      onError: (error) => Center(
        child: InkWell(
          onTap: controller.loadFirst,
          child: Text(error ?? '请求失败，点击重试'),
        ),
      ), //出错界面显示
    );
  }

  ///////////////////////
  /////////////////////// EasyRefresh
  ///////////////////////
  Widget buildEasyRefreshView() {
    return JdCommonEasyRefresh(
      controller: controller.easyRefreshCtl,
      onRefresh: controller.loadFirst,
      onLoad: controller.loadNext,
      child: buildEasyRefreshViewChild(),
    );
  }

  Widget buildEasyRefreshViewChild() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: controller.listDatas.length, (context, index) {
            return CustomCell(floor: controller.listDatas[index]);
          }),
        ),
      ],
    );
  }
}

class CustomCell extends StatelessWidget {
  final Map? floor;
  const CustomCell({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = floor?["name"] ?? "";
    String img = floor?["img"] ?? "";
    String jprice = floor?["jprice"] ?? "";
    return InkWell(
      onTap: () {
        // NavigatorUtil.push(context, ProductRouter.product);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 1),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.black12, width: 1),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonExtendedImageWidget.netWorkImget(
                url: img, width: 100, height: 100),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, maxLines: 2, overflow: TextOverflow.ellipsis),
                    Text(jprice)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BrowseHistoryController extends CommonGetXListController with StateMixin {
  final easyRefreshCtl = JdCommonEasyRefreshController();
  final count = 0.obs;
  var listDatas = [];

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    loadFirst();
  }

  Future<void> loadFirst() async {
    if (isLoading) {
      return;
    }
    isLoading = true;

    if (listDatas.isEmpty) {
      change(null, status: RxStatus.loading());
    }

    //执行网络请求
    MpsfResponse resp = await JdService.browseHistory(1);

    //请求结束
    easyRefreshCtl.mpsfFinishRefresh();
    easyRefreshCtl.mpsfResetFooter();

    //请求出错时
    if (resp.hasError) {
      listDatas = [];
      page = 1;

      change(null, status: RxStatus.error('Error'));
      isLoading = false;
    } else {
      List historyList = resp.jsonData["historyList"] ?? [];
      List newDatas = [];
      for (var item in historyList) {
        newDatas.add(item);
      }
      listDatas = newDatas;
      page = 1;

      change(listDatas, status: RxStatus.success());
      isLoading = false;
    }
  }

  Future<void> loadNext() async {
    if (isLoading) {
      return;
    }
    isLoading = true;

    //执行网络请求
    MpsfResponse resp = await JdService.browseHistory(page + 1);

    //请求出错时
    if (resp.hasError) {
      easyRefreshCtl.mpsfFinishLoad(CommonIndicatorResult.fail);
      isLoading = false;
    } else {
      List historyList = resp.jsonData["historyList"] ?? [];
      List newDatas = [];
      for (var item in historyList) {
        newDatas.add(item);
      }
      listDatas.addAll(newDatas);

      page = page + 1;

      easyRefreshCtl.mpsfFinishLoad(newDatas.isEmpty
          ? CommonIndicatorResult.noMore
          : CommonIndicatorResult.success);
      isLoading = false;

      update();
    }
  }
}
