/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-09 18:46:59
 * @LastEditors: TT
 * @LastEditTime: 2023-07-18 14:54:09
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../config/dataconfig/theme_image_config.dart';

/// 配置item 模型
class TabItemModel {
  String? text;
  String? imagePath;
  String? selectImagePath;

  TabItemModel({
    this.text,
    this.imagePath,
    this.selectImagePath,
  });
}

class RootTabV extends CommonGetXWidget<RootTabC> {
  RootTabV({Key? key}) : super(key: key);
  @override
  RootTabC get controller => Get.put(RootTabC());

  @override
  bool configIsNeedScaffol() => false;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    /// 创建tabBar item
    Widget body = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        controller.list.length,
        (index) => configItem(
          index: index,
          tabItemModel: controller.list[index],
        ),
      ),
    );

    /// 创建底部 body
    body = Container(
      height: 49 + SizeMacro.bottomBarHeight,
      padding: EdgeInsets.only(bottom: SizeMacro.bottomBarHeight),
      width: SizeMacro.screenWidth,
      decoration: BoxDecoration(
        color: configScallBackgroundColor(),
      ),
      child: body,
    );
    return body;
  }

  /// 创建按钮item
  configItem({
    required int index,
    required TabItemModel tabItemModel,
  }) {
    Widget body = HzyBtnWidget(
      height: 49,
      isFittedBox: false,
      btnLayoutType: BtnLayoutType.topImg,
      textStyle: index == controller.selectIndex.value
          ? FontConfig().fontMedium12Theme
          : FontConfig().fontMedium12Grey,
      imageWidget: configItemImageWidget(
        index: index,
        tabItemModel: tabItemModel,
      ),
      text: tabItemModel.text,
      tapCall: () {
        controller.tapItem(index: index);
      },
    );
    body = Expanded(
      child: body,
    );
    return body;
  }

  configItemImageWidget({
    required int index,
    required TabItemModel tabItemModel,
  }) {
    Widget body = Image.asset(
      controller.selectIndex.value == index
          ? tabItemModel.selectImagePath!
          : tabItemModel.imagePath!,
      width: 20,
      height: 20,
    );
    return body;
  }
}

class RootTabC extends CommonGetXController {
  // --------- 属性 --------- //

  var selectIndex = 0.obs;
  ScrollController scrollController = ScrollController();
  List<TabItemModel> get list => [
        TabItemModel(
          text: LaunchIdConfig.example.tr,
          imagePath: HzyThemeImageConfig().configImagePath(
            pathkey: HzyImageId.tabHomeNormal,
          ),
          selectImagePath: HzyThemeImageConfig().configImagePath(
            pathkey: HzyImageId.tabHomeSelect,
          ),
        ),
        TabItemModel(
          text: LaunchIdConfig.my.tr,
          imagePath: HzyThemeImageConfig().configImagePath(
            pathkey: HzyImageId.tabWtNormal,
          ),
          selectImagePath: HzyThemeImageConfig().configImagePath(
            pathkey: HzyImageId.tabWtSelect,
          ),
        ),
        TabItemModel(
          text: LaunchIdConfig.my.tr,
          imagePath: HzyThemeImageConfig().configImagePath(
            pathkey: HzyImageId.tabMyNormal,
          ),
          selectImagePath: HzyThemeImageConfig().configImagePath(
            pathkey: HzyImageId.tabMySelect,
          ),
        ),
      ];

  // --------- 生命周期  --------- //

  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //

  /// 点击item
  tapItem({required int index}) {
    selectIndex.value = index;
  }
}
