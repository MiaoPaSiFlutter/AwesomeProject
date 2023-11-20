import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}
