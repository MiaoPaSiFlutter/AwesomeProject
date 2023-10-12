/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-15 15:54:03
 * @LastEditors: TT
 * @LastEditTime: 2023-05-15 22:09:48
 */

import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';

class ExampleMoreBtnWidget extends CommonLessV {
  ExampleMoreBtnWidget({
    super.key,
    required this.onTap,
    this.isRefresh = true,
  });
  final bool? isRefresh;
  final Function(int) onTap;
  @override
  bool get isNeedScaffol => false;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = configMoreBtnWidget();
    return body;
  }

  @override
  configBoxDecoreation() {
    return BoxDecoration(
      color: HzyCommonColor().backgroudgrey.withOpacity(0),
    );
  }

  configMoreBtnWidget() {
    Widget body = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        configBtn(
          text: "空数据",
          tapCall: () {
            onTap(0);
          },
        ),
        isRefresh == true ? Gaps.vGap10 : Container(),
        isRefresh == true
            ? configBtn(
                index: 1,
                text: "无更多",
                tapCall: () {
                  onTap(1);
                },
              )
            : Container(),
      ],
    );

    return body;
  }

  configBtn({
    required String text,
    Function()? tapCall,
    int index = 0,
  }) {
    Widget body = HzyBtnWidget(
      text: text,
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: index == 0
              ? [
                  Colors.orange,
                  Colors.white,
                  Colors.greenAccent,
                ]
              : [
                  Colors.greenAccent,
                  Colors.white,
                  Colors.orange,
                ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          configThemeShadow(
            opacity: 0.5,
          ),
        ],
        borderRadius: BorderRadius.circular(
          50.r,
        ),
      ),
      textStyle: HzyTextStyle.fontBold(
        size: 14,
        color: Colors.black87,
      ),
      tapCall: () {
        if (tapCall != null) {
          tapCall();
        }
      },
    );
    return body;
  }
}
