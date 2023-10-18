// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/components/common_extendeed_image_widget.dart';

/// 内容视图
class HGCatgFloorContent_TMP extends StatelessWidget {
  final Map? floor;
  const HGCatgFloorContent_TMP({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        String style = floor?["style"] ?? "";
        String floorName = floor?["floorName"] ?? "";
        String rightImg = floor?["rightImg"] ?? "";
        String rightText = floor?["rightText"] ?? "";
        List content = floor?["content"];
        double itemCardW = (screenWidth - 24 - 10 * 2) / 3;
        double itemCardH = 30 + itemCardW + 55;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.red),
              ),
              child: Row(
                children: <Widget>[
                  CommonExtendedImageWidget.netWorkImget(
                      url: "", width: 12, height: 12),
                  Text("$floorName ", style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// 头部视图
class HGCatgFloorHeader extends StatelessWidget {
  final Map? floor;
  const HGCatgFloorHeader({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int showHead = floor?["showHead"];
    String headImg = floor?["headImg"] ?? "";
    String floorName = floor?["floorName"] ?? "";
    String rightImg = floor?["rightImg"] ?? "";
    String rightText = floor?["rightText"] ?? "";

    if (showHead == 0) {
      return const Text("showHead == 0");
    } else {}

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.green),
            ),
            child: Row(
              children: <Widget>[
                Container(
                    child: CommonExtendedImageWidget.netWorkImget(url: "")),
                Text("$floorName ", style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(floorName),
                ));
              },
              child: Row(
                children: <Widget>[
                  Text("$rightText ", style: const TextStyle(fontSize: 12)),
                  CommonExtendedImageWidget.netWorkImget(
                      url: rightImg,
                      width: 12,
                      height: 12,
                      fit: BoxFit.contain),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
