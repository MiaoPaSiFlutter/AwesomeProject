import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class BpSuitFloorView extends StatelessWidget {
  final Map? floor;
  const BpSuitFloorView({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.red),
      ),
      child: Text(HyzyTextTools.mpsfStr(floor?["mId"])),
    );
  }
}
