/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-06 10:38:56
 * @LastEditors: TT
 * @LastEditTime: 2023-05-16 17:19:33
 */
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../compontents/compontents.dart';
import '../models/normal_models.dart';

class ExampleModalDialogV extends CommonGetXWidget<ExampleModalDialogC> {
  ExampleModalDialogV({Key? key}) : super(key: key);
  @override
  ExampleModalDialogC get controller => Get.put(ExampleModalDialogC());
  @override
  String? createAppBarTitleStr() => controller.title.value;
  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Container();
    body = ListView(
      children: [
        ...List.generate(controller.list.length, (index) {
          HzyNormalItemModel itemModel = controller.list[index];

          Widget body = configNormalDarkItemWidget(
            itemModel: itemModel,
            index: index,
            allNum: controller.list.length,
            onOtherTap: (_) {
              controller.tapItem(index: index);
            },
          );
          return body;
        })
      ],
    );
    body = Container(
      margin: const EdgeInsets.all(15),
      child: body,
    );
    return body;
  }
}

class ExampleModalDialogC extends CommonGetXController {
  // --------- 属性 --------- //
  Rx<String?> title = "".obs;

  String msg = """
2023年，美国军舰数量锐减，自20世纪90年代以来
，美国海军从建造大量军舰的高峰期开始走下坡路。
而最近，美国军舰造舰出现了问题，连续几个月出现了多个事件，
让人不禁想到了当年苏联的末路。
但是，这种情况是否会给中国的发展提供启示呢？",
""";
  String tile = "温馨提示";
  List<HzyNormalItemModel> list = [
    HzyNormalItemModel(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.r),
      ),
      leftMsg: "默认",
    ),
    HzyNormalItemModel(
      leftMsg: "只有title",
    ),
    HzyNormalItemModel(
      leftMsg: "只有msg",
    ),
    HzyNormalItemModel(
      leftMsg: "只有一个按钮",
    ),
    HzyNormalItemModel(
      leftMsg: "两个按钮上下布局",
    ),
    HzyNormalItemModel(
      leftMsg: "修改按钮圆角",
    ),
    HzyNormalItemModel(
      leftMsg: "修改确认按钮样式",
    ),
    HzyNormalItemModel(
      leftMsg: "点击屏幕不可以关闭弹框",
    ),
    HzyNormalItemModel(
      leftMsg: "修改弹框背景颜色",
    ),
    HzyNormalItemModel(
      leftMsg: "自定义整体弹框",
    ),
    HzyNormalItemModel(
      leftMsg: "自定义title Widget",
    ),
    HzyNormalItemModel(
      leftMsg: "自定义msg Widget",
    ),
    HzyNormalItemModel(
      leftMsg: "自定义底部组合按钮",
    ),
  ];

  List popList = [];
  // --------- 生命周期  --------- //
  @override
  void onInit() {
    super.onInit();
    configNormalData();
  }

  // --------- 数据处理  --------- //
  configNormalData() {
    popList = [
      NormalDialogModel(
        title: tile,
        msg: msg,
      ),
      NormalDialogModel(
        title: tile,
      ),
      NormalDialogModel(
        msg: msg,
      ),
      NormalDialogModel(
        title: tile,
        msg: msg,
        btnType: 1,
      ),
      NormalDialogModel(
        title: tile,
        msg: msg,
        space: 10,
        layoutType: 2,
      ),
      NormalDialogModel(
        title: tile,
        msg: msg,
        space: 10,
        layoutType: 2,
        radius: 8,
      ),
      NormalDialogModel(
        title: tile,
        msg: msg,
        space: 10,
        layoutType: 2,
        sureBgColor: HzyCommonColor().col000000,
        sureTitleColor: HzyCommonColor().whitebackgroundColor,
        sureMsg: "我是确认按钮",
      ),
      NormalDialogModel(
        title: tile,
        msg: msg,
        barrierDismissible: false,
      ),
      NormalDialogModel(
        title: tile,
        msg: msg,
        dialogBackColor: HzyCommonColor().colefedf3,
      ),
      NormalDialogModel(
        body: configBtnImageWidget(
          w: null,
        ),
      ),
      NormalDialogModel(
        titleWidget: configBtnImageWidget(
          w: null,
        ),
        msg: msg,
      ),
      NormalDialogModel(
        msgWidget: configBtnImageWidget(
          w: null,
        ),
        title: tile,
      ),
      NormalDialogModel(
        msg: msg,
        title: tile,
        btnSWidget: configBtnImageWidget(
          w: null,
        ),
      )
    ];
    HzyNormalItemModel itemModel = currentGetArguments();
    title.value = itemModel.leftMsg;
  }
  // --------- 触发事件  --------- //

  tapItem({required int index}) {
    NormalDialogModel dialogModel = popList[index];
    showPopDiaLogWidget(
      context: Get.context!,
      space: dialogModel.space,
      dialogBackColor:
          dialogModel.dialogBackColor ?? HzyCommonColor().whitebackgroundColor,
      barrierDismissible: dialogModel.barrierDismissible!,
      body: dialogModel.body,
      titleWidget: dialogModel.titleWidget,
      title: dialogModel.title,
      titleColor: dialogModel.titleColor ?? HzyCommonColor().col000000,
      msgWidget: dialogModel.msgWidget,
      msgColor: dialogModel.msgColor ?? HzyCommonColor().col5a5a5a,
      msgFontSize: dialogModel.msgFontSize,
      msg: dialogModel.msg,
      btnSWidget: dialogModel.btnSWidget,
      padding: dialogModel.padding,
      msgAndBtnSpace: dialogModel.msgAndBtnSpace,
      titleAndMsgSpace: dialogModel.titleAndMsgSpace,
      sureMsg: dialogModel.sureMsg,
      sureBgColor: dialogModel.sureBgColor,
      sureTitleColor: dialogModel.sureTitleColor,
      cannerMsg: dialogModel.cannerMsg,
      cannerBgColor: dialogModel.cannerBgColor ?? HzyNormalColorS.colefedf3,
      cannerTitleColor:
          dialogModel.cannerTitleColor ?? HzyCommonColor().colplacetextcolor,
      layoutType: dialogModel.layoutType,
      btnType: dialogModel.btnType,
      radius: dialogModel.radius,
      tapSure: () {
        Navigator.of(Get.context!).pop();
      },
      tapCanner: () {},
    );
  }
}
