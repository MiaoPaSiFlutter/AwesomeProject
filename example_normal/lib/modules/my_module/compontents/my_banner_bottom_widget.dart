/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-30 21:23:16
 * @LastEditors: TT
 * @LastEditTime: 2023-04-30 21:31:16
 */

import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';

class MyBannerBottomWidget extends StatefulWidget {
  const MyBannerBottomWidget({
    super.key,
    required this.allNum,
  });
  final int allNum;
  @override
  State<StatefulWidget> createState() {
    return MyBannerBottomWidgete();
  }
}

class MyBannerBottomWidgete extends CommonState<MyBannerBottomWidget> {
  int selectIndex = 0;
  @override
  bool get isNeedScaffol => false;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = configBannerBottomItemWidget();
    return body;
  }

  @override
  configBoxDecoreation() {
    return BoxDecoration(
      color: HzyCommonColor().backgroudgrey.withOpacity(0),
    );
  }

  /// 创建轮播图下标
  configBannerBottomItemWidget() {
    Widget body = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          widget.allNum,
          (index) {
            Widget body = Container(
              margin: EdgeInsets.symmetric(
                horizontal: 3.w,
              ),
              decoration: BoxDecoration(
                color: selectIndex == index
                    ? HzyCommonColor().colthemes
                    : scallBackGroundColor,
                borderRadius: BorderRadius.circular(
                  6.r,
                ),
              ),
              width: 6.w,
              height: 6.w,
            );
            return body;
          },
        )
      ],
    );
    return body;
  }

  configSelectIndex({required int index}) {
    setState(() {
      selectIndex = index;
    });
  }
}
