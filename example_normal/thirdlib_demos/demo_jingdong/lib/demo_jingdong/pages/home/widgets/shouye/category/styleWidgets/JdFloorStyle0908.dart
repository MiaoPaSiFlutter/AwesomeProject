// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class JdFloorStyle0908 extends StatelessWidget {
  final Map? floor;
  const JdFloorStyle0908({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String style = floor?["style"] ?? "";
    String floorName = floor?["floorName"] ?? "";
    String rightImg = floor?["rightImg"] ?? "";
    String rightText = floor?["rightText"] ?? "";
    List content = floor?["content"];
    return Container(
      width: double.infinity,
      height: double.parse("${floor?["height"]}") / 2,
      child: CommonExtendedImageWidget.netWorkImget(url: content[0]["img"]),
    );
  }
}
