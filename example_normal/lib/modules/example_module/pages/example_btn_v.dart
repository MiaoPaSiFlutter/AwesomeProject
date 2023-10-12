/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-06 11:16:49
 * @LastEditors: TT
 * @LastEditTime: 2023-05-19 17:32:54
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../module_index.dart';

import '../compontents/compontents.dart';

class ExampleBtnV extends CommonGetXWidget<ExampleBtnC> {
  ExampleBtnV({Key? key}) : super(key: key);
  @override
  ExampleBtnC get controller => Get.put(ExampleBtnC());
  @override
  String? createAppBarTitleStr() => controller.title.value;
  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    /// 创建按钮列表
    Widget body = Column(
      children: [
        ...List.generate(
          controller.list.length,
          (index) {
            NormalBtnModel normalBtnModel = controller.list[index];
            double space =
                (normalBtnModel.btnLayoutType == BtnLayoutType.bottomImg ||
                        normalBtnModel.btnLayoutType == BtnLayoutType.topImg)
                    ? controller.crossAxisSpacing.value
                    : controller.mainAxisSpacing.value;
            Widget body = HzyBtnWidget(
              text: normalBtnModel.text,
              bgColor: configScallBackgroundColor(),
              btnLayoutType: normalBtnModel.btnLayoutType,
              space: space,
              fontColor: HzyCommonColor().wbgblacktextcolor,
              height: normalBtnModel.height,
              imageWidget: configBtnImageWidget(),
              padding: EdgeInsets.all(controller.padding.value),
              margin: EdgeInsets.all(controller.margin.value),
              borderRadius: normalBtnModel.borderRadius,
              tapCall: () {
                controller.tapItem(msg: normalBtnModel.text);
              },
            );

            body = Column(
              children: [
                body,
                Gaps.vGap10,
              ],
            );
            return body;
          },
        )
      ],
    );

    body = Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w, top: 10.w),
      child: body,
    );
    body = SingleChildScrollView(
      child: body,
    );
    body = Expanded(child: body);
    body = Column(
      children: [
        body,
        configToolWidget(),
      ],
    );
    return body;
  }

  /// 创建工具栏
  configToolWidget() {
    Widget body = Column(
      children: [
        /// 外边距
        HzyNormalItemWidget(
          itemModel: HzyNormalItemModel(
            leftMsg: LaunchIdConfig.margin.tr,
            isShowLine: true,
            rightType: 1,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.r),
            ),
            leftMsgColor: HzyCommonColor().wbgblacktextcolor,
            backGroudColor: HzyCommonColor().whitebackgroundColor,
            rightWidget: configAddorSubtractWidget(
              type: 0,
              ts: "${controller.margin.value}",
              tapAdd: (p0) {
                controller.tapAdd(type: p0);
              },
              tapReduce: (p0) {
                controller.tapReduce(type: p0);
              },
            ),
          ),
        ),

        /// 内边距
        HzyNormalItemWidget(
          itemModel: HzyNormalItemModel(
            leftMsg: LaunchIdConfig.padding.tr,
            isShowLine: true,
            rightType: 1,
            leftMsgColor: HzyCommonColor().wbgblacktextcolor,
            backGroudColor: HzyCommonColor().whitebackgroundColor,
            rightWidget: configAddorSubtractWidget(
              type: 1,
              ts: "${controller.padding.value}",
              tapAdd: (p0) {
                controller.tapAdd(type: p0);
              },
              tapReduce: (p0) {
                controller.tapReduce(type: p0);
              },
            ),
          ),
        ),

        /// 行间距
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

        /// 列间距
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
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w, top: 10.w),
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

class ExampleBtnC extends CommonGetXController {
  // --------- 属性 --------- //
  Rx<String?> title = "".obs;

  /// 行间距
  var mainAxisSpacing = 4.0.obs;

  /// 列间距
  var crossAxisSpacing = 4.0.obs;

  /// 内边距
  var padding = 0.0.obs;

  /// 外边距
  var margin = 0.0.obs;

  /// 默认添加基数
  double normalSpace = 2.0;

  List<NormalBtnModel> list = [
    NormalBtnModel(
      text: "默认",
    ),
    NormalBtnModel(
      text: "设置左圆角",
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(20.r),
      ),
    ),
    NormalBtnModel(
      text: "设置右圆角",
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(20.r),
      ),
    ),
    NormalBtnModel(
      text: "设置上圆角",
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.r),
      ),
    ),
    NormalBtnModel(
      text: "设置下圆角",
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20.r),
      ),
    ),
    NormalBtnModel(
      btnLayoutType: BtnLayoutType.img,
      height: null,
    ),
    NormalBtnModel(
      btnLayoutType: BtnLayoutType.topImg,
      text: "图片在上",
      height: null,
    ),
    NormalBtnModel(
      btnLayoutType: BtnLayoutType.bottomImg,
      text: "图片在下",
      height: null,
    ),
    NormalBtnModel(
      btnLayoutType: BtnLayoutType.letfImg,
      text: "图片在左",
      height: null,
    ),
    NormalBtnModel(
      btnLayoutType: BtnLayoutType.rightImg,
      text: "图片在右",
      height: null,
    ),
  ];
  // --------- 生命周期  --------- //
  @override
  void onInit() {
    super.onInit();
    configNormalData();
  }

  // --------- 数据处理  --------- //
  configNormalData() {
    HzyNormalItemModel itemModel = currentGetArguments();
    title.value = itemModel.leftMsg;
  }
  // --------- 触发事件  --------- //

  /// 点击加号
  tapAdd({required int type}) {
    if (type == 0) {
      margin.value = margin.value + normalSpace;
    } else if (type == 1) {
      padding.value = padding.value + normalSpace;
    } else if (type == 2) {
      mainAxisSpacing.value = mainAxisSpacing.value + normalSpace;
    } else if (type == 3) {
      crossAxisSpacing.value = crossAxisSpacing.value + normalSpace;
    }
  }

  /// 点击减号
  tapReduce({required int type}) {
    if (type == 0) {
      double mgs = margin.value - normalSpace;
      if (mgs <= 0) {
        mgs = 0;
      }
      margin.value = mgs;
    } else if (type == 1) {
      double pgs = padding.value - normalSpace;
      if (pgs <= 0) {
        pgs = 0;
      }
      padding.value = pgs;
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

  /// 点击按钮
  tapItem({
    String? msg,
  }) {
    showToastMsg(msg ?? "我是纯图");
  }
}
