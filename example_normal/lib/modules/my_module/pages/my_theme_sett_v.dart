/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-10 20:28:24
 * @LastEditors: TT
 * @LastEditTime: 2023-05-02 23:33:55
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../config/my_launch_id_config.dart';
import '../config/my_normal_config.dart';
import '../pages/pages_index.dart';

class MyThemeV extends CommonGetXWidget<MyThemeC> {
  MyThemeV({Key? key, this.isShowBack}) : super(key: key);

  final bool? isShowBack;
  @override
  MyThemeC get controller => Get.put(MyThemeC());

  /// 配置导航栏 标题
  @override
  String? createAppBarTitleStr() {
    return MyLaunchIdConfig.dark.tr;
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = ListView.separated(
      itemBuilder: createItemBuilder,
      separatorBuilder: createSparatorBuilder,
      itemCount: controller.switchValue.value ? 1 : 4,
    );
    body = Expanded(child: body);
    body = Column(
      children: [
        Gaps.vGap10,
        body,
      ],
    );
    return body;
  }

  Widget createItemBuilder(BuildContext context, int index) {
    Widget body = Container();
    if (index == 0) {
      body = createfirstwidget();
    } else if (index == 1) {
      body = Container(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 10.w,
          bottom: 10.w,
        ),
        child: Text(
          MyLaunchIdConfig.manually.tr,
          style: FontConfig.fontMedium145a5a5a,
        ),
      );
    } else if (index == 2) {
      body = createdarkitemwidget(
        MyLaunchIdConfig.normalModel.tr,
        index,
      );
    } else if (index == 3) {
      body = createdarkitemwidget(
        MyLaunchIdConfig.dark.tr,
        index,
      );
    }
    return body;
  }

  Widget createSparatorBuilder(BuildContext context, int index) {
    if (index == 2) {
      return Container(
        decoration: BoxDecoration(
          color: HzyCommonColor().whitebackgroundColor,
        ),
        child: Container(
          height: 0.5,
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          decoration: BoxDecoration(
            color: HzyCommonColor().linecolor,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  // 创建跟随系统
  Widget createfirstwidget() {
    return Container(
      decoration: BoxDecoration(
        color: HzyCommonColor().whitebackgroundColor,
      ),
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 15.w,
        bottom: 15.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MyLaunchIdConfig.system.tr,
                  style: FontConfig.fontMedium16Black,
                ),
                Gaps.vGap5,
                Text(
                  MyLaunchIdConfig.systemMsg.tr,
                  style: FontConfig.fontMedium14PlaceColor,
                ),
              ],
            ),
          ),
          CupertinoSwitch(
            value: controller.switchValue.value,
            dragStartBehavior: DragStartBehavior.down,
            onChanged: (value) {
              controller.configSwitchOnchanged(value);
            },
          )
        ],
      ),
    );
  }

  Widget createdarkitemwidget(String text, int index) {
    return InkWell(
      onTap: () {
        controller.tapdarkitem(index: index);
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 10.w,
          top: 10.w,
        ),
        decoration: BoxDecoration(
          color: HzyCommonColor().whitebackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style: FontConfig.fontMedium14Black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            controller.selectIndex.value == index
                ? Icon(
                    Icons.check,
                    size: 16.w,
                    color: HzyCommonColor().colthemes,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  configShowBack() {
    return isShowBack ?? true;
  }
}

class MyThemeC extends CommonGetXController {
  // --------- 属性 --------- //
  var switchValue = false.obs;
  var selectIndex = 2.obs;
  // --------- 生命周期  --------- //
  @override
  void onInit() {
    super.onInit();
    configlocaltheme();
  }

  /// 配置本地主题配置
  configlocaltheme() {
    ThemeMode themeMode = ThemeTool.getlocalprofileaboutThemeModel();
    if (themeMode == ThemeMode.system) {
      switchValue.value = true;
    } else {
      switchValue.value = false;
      if (themeMode == ThemeMode.light) {
        selectIndex.value = 2;
      } else if (themeMode == ThemeMode.dark) {
        selectIndex.value = 3;
      }
    }
  }
  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //

  /// 点击开关 回调
  configSwitchOnchanged(bool value) {
    switchValue.value = value;
    ThemeTool.changeTheme(type: 2);
  }

  tapdarkitem({required int index}) async {
    int type = 0;
    if (index == 2) {
      type = 0;
    } else if (index == 3) {
      type = 1;
    }
    if (selectIndex.value == index) {
      return;
    }
    selectIndex.value = index;

    await ThemeTool.changeTheme(type: type);
    MyGeneralC generalC = Get.put(MyGeneralC());
    generalC.msg = MyNormalConfig.configDarkModelIsOpen(
        isUserCache: false, themeType: type);
  }
}
