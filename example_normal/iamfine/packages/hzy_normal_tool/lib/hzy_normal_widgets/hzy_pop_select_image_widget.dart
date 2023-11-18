/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-19 17:15:23
 * @LastEditors: TT
 * @LastEditTime: 2023-09-06 09:55:33
 */

import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

class HzyPopSelectImageWidget extends StatefulWidget {
  const HzyPopSelectImageWidget({
    super.key,
    required this.tapCall,
    this.bgColor,
    this.list,
  });

  final Function(int index) tapCall;
  final List<HzyNormalItemModel>? list;
  final Color? bgColor;

  @override
  State<StatefulWidget> createState() {
    return HzyPopSelectImageWidgetState();
  }
}

class HzyPopSelectImageWidgetState extends State<HzyPopSelectImageWidget> {
  List<HzyNormalItemModel> itemList = [
    HzyNormalItemModel(
      leftMsg: "相册",
      mainAxisAlignment: MainAxisAlignment.center,
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 30,
        bottom: 15,
      ),
      isShowLine: true,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(
          12,
        ),
      ),
    ),
    HzyNormalItemModel(
      leftMsg: "相机",
      mainAxisAlignment: MainAxisAlignment.center,
      borderRadius: BorderRadius.zero,
      isShowLine: true,
      linePadding: EdgeInsets.zero,
      lineMargin: EdgeInsets.zero,
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: HzyNormalColorS.chipBackground,
    ),
    HzyNormalItemModel(
      leftMsg: "取消",
      mainAxisAlignment: MainAxisAlignment.center,
    ),
  ];

  @override
  void initState() {
    super.initState();
    itemList = widget.list ?? itemList;
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          itemList.length,
          (index) => HzyNormalItemWidget(
            itemModel: itemList[index],
            tapItemCallback: (itemModel, idex) {
              widget.tapCall.call(index);
            },
          ),
        )
      ],
    );

    body = Container(
      decoration: BoxDecoration(
        color: widget.bgColor ?? Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(
            16,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      child: body,
    );
    return body;
  }
}
