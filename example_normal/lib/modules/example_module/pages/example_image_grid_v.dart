/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-04 18:07:16
 * @LastEditors: TT
 * @LastEditTime: 2023-05-19 17:33:16
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../compontents/compontents.dart';
import '../routers/example_module_routers.dart';

class ExampleImageGridV extends CommonGetXWidget<ExampleImageGridC> {
  ExampleImageGridV({Key? key}) : super(key: key);
  @override
  String? createAppBarTitleStr() => controller.title.value;
  @override
  ExampleImageGridC get controller => Get.put(ExampleImageGridC());

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        configImageGridImageWidget(),
        configToolWidget(),
      ],
    );
    return body;
  }

  /// 配置导航栏 右边按钮
  @override
  List<Widget>? createAppBaractions() {
    return [
      GetBuilder<ExampleImageGridC>(
        builder: (ct) {
          return HzyBtnWidget(
            text: LaunchIdConfig.done.tr,
            margin: EdgeInsets.only(
              right: 10.w,
              top: 8.w,
              bottom: 8.w,
            ),
            fontSize: 14.sp,
            height: 30,
            fontColor: ct.isCanTap
                ? HzyNormalColorS.colffffff
                : HzyCommonColor().colplacetextcolor,
            isFittedBox: false,
            padding: EdgeInsets.symmetric(
              horizontal: 5.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                4.r,
              ),
              color: ct.isCanTap
                  ? HzyCommonColor().colthemes
                  : HzyNormalColorS.coldadada,
            ),
            tapCall: () {
              ct.tapDone();
            },
          );
        },
      )
    ];
  }

  /// 创建图格视图
  configImageGridImageWidget() {
    Widget body = CommonGirdImageV(
      crossAxisCount: controller.crossAxisCount.value,
      mainAxisSpacing: controller.mainAxisSpacing.value,
      crossAxisSpacing: controller.crossAxisSpacing.value,
      onChange: (p0, p1) {
        controller.configSelectImageList(
          list: p0,
          btlist: p1,
        );
      },
      onTapItem: (index) {},
    );

    body = Container(
      width: SizeMacro.screenWidth,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: HzyCommonColor().whitebackgroundColor,
      ),
      child: body,
    );
    body = Expanded(child: body);
    return body;
  }

  /// 创建工具
  configToolWidget() {
    Widget body = Column(
      children: [
        HzyNormalItemWidget(
          itemModel: HzyNormalItemModel(
            leftMsg: LaunchIdConfig.row.tr + LaunchIdConfig.number.tr,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.r),
            ),
            isShowLine: true,
            rightType: 1,
            leftMsgColor: HzyCommonColor().wbgblacktextcolor,
            backGroudColor: HzyCommonColor().whitebackgroundColor,
            rightWidget: configAddorSubtractWidget(
              type: 1,
              ts: "${controller.crossAxisCount}",
              tapAdd: (p0) {
                controller.tapAdd(type: p0);
              },
              tapReduce: (p0) {
                controller.tapReduce(type: p0);
              },
            ),
          ),
        ),
        HzyNormalItemWidget(
          itemModel: HzyNormalItemModel(
            leftMsg: LaunchIdConfig.row.tr + LaunchIdConfig.space.tr,
            isShowLine: true,
            rightType: 1,
            leftMsgColor: HzyCommonColor().wbgblacktextcolor,
            backGroudColor: HzyCommonColor().whitebackgroundColor,
            rightWidget: configAddorSubtractWidget(
              type: 2,
              ts: "${controller.mainAxisSpacing}",
              tapAdd: (p0) {
                controller.tapAdd(type: p0);
              },
              tapReduce: (p0) {
                controller.tapReduce(type: p0);
              },
            ),
          ),
        ),
        HzyNormalItemWidget(
          itemModel: HzyNormalItemModel(
            leftMsg: LaunchIdConfig.column.tr + LaunchIdConfig.space.tr,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16.r),
            ),
            rightType: 3,
            leftMsgColor: HzyCommonColor().wbgblacktextcolor,
            backGroudColor: HzyCommonColor().whitebackgroundColor,
            rightWidget: configAddorSubtractWidget(
              type: 3,
              ts: "${controller.crossAxisSpacing}",
              tapAdd: (p0) {
                controller.tapAdd(type: p0);
              },
              tapReduce: (p0) {
                controller.tapReduce(type: p0);
              },
            ),
          ),
        ),
      ],
    );

    body = Container(
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        boxShadow: [
          configShadow(),
        ],
      ),
      child: body,
    );

    return body;
  }
}

class ExampleImageGridC extends CommonGetXController {
  // --------- 属性 --------- //
  Rx<String?> title = "".obs;
  var crossAxisCount = 3.obs;
  var mainAxisSpacing = 10.0.obs;
  var crossAxisSpacing = 10.0.obs;

  int normalNUM = 1;
  double normalSpace = 2.0;
  List<dynamic> selectImageList = [];
  bool isCanTap = false;
  List<Uint8List> blist = [];
  // --------- 生命周期  --------- //
  @override
  void onInit() {
    super.onInit();
    configNormalData();
  }

  // --------- 数据处理  --------- //

  /// 配置初始数据
  configNormalData() {
    HzyNormalItemModel itemModel = currentGetArguments();
    title.value = itemModel.leftMsg;
  }

  /// 监听选择图片数据
  configSelectImageList({List<dynamic>? list, List<Uint8List>? btlist}) {
    if (kIsWeb) {
    } else {}

    isCanTap = list != null;
    if (isCanTap) {
      selectImageList = list!;
      blist = btlist!;
    }
    update();
  }
  // --------- 触发事件  --------- //

  /// 点击加
  tapAdd({required int type}) {
    if (type == 1) {
      crossAxisCount.value = crossAxisCount.value + normalNUM;
    } else if (type == 2) {
      mainAxisSpacing.value = mainAxisSpacing.value + normalSpace;
    } else if (type == 3) {
      crossAxisSpacing.value = crossAxisSpacing.value + normalSpace;
    }
  }

  /// 点击减
  tapReduce({required int type}) {
    if (type == 1) {
      int ct = crossAxisCount.value - normalNUM;
      if (ct <= 1) {
        ct = 1;
      }
      crossAxisCount.value = ct;
    } else if (type == 2) {
      double ms = mainAxisSpacing.value - normalSpace;
      if (ms <= 0) {
        ms = 0;
      }
      mainAxisSpacing.value = 0;
    } else if (type == 3) {
      double cs = crossAxisSpacing.value - normalSpace;
      if (cs <= 0) {
        cs = 0;
      }
      crossAxisSpacing.value = cs;
    }
  }

  /// 点击单个图片
  tapItem({required int index}) {}

  /// 点击完成
  tapDone() {
    if (isCanTap) {
      currentToPage(ExampleModuleRouterS.banner, arguments: blist);
    }
  }
}
