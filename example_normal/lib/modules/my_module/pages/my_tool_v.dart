/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-20 17:30:46
 * @LastEditors: TT
 * @LastEditTime: 2023-05-03 15:54:47
 */
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';
import '../../../pages/root_pages/root_v.dart';
import '../config/my_normal_config.dart';

class MyToollessV extends CommonLessV {
  MyToollessV({super.key});

  List<HzyNormalItemModel> get list => MyNormalConfig().toolItemList;

  List<HzyNormalItemModel> get otherList => MyNormalConfig().toolBottomList;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = configToolListWidget();
    return body;
  }

  configToolListWidget() {
    Widget body = Column(
      children: [
        ...List.generate(
          list.length,
          (index) {
            HzyNormalItemModel itemModel = list[index];
            if (itemModel.isHintWidget != true) {
              itemModel.height = 60.h;
            }
            itemModel.leftSpace = 10.w;
            itemModel.isCanTap = true;
            Widget body = configNormalDarkItemWidget(
              itemModel: itemModel,
              onTap: (HzyNormalItemModel itemModel) {
                configTapItem(model: itemModel);
              },
            );
            return body;
          },
        )
      ],
    );

    body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        body,
        Column(
          children: [
            ...List.generate(
              otherList.length,
              (index) {
                HzyNormalItemModel itemModel = otherList[index];
                if (itemModel.isHintWidget != true) {
                  itemModel.height = 60.h;
                }
                itemModel.leftSpace = 10.w;
                itemModel.isCanTap = true;
                Widget body = configNormalDarkItemWidget(itemModel: itemModel);
                return body;
              },
            )
          ],
        )
      ],
    );
    return body;
  }

  ///
  configTapItem({required HzyNormalItemModel model}) async {
    if (model.tapType == 1 && model.router != null) {
      await currentToPage(model.router!);
      RootC rootC = Get.put(RootC());
      rootC.tapNavItem();
    }
  }
}
