import 'package:flutter/material.dart';

import 'bp_fare.dart';
import 'bp_param.dart';
import 'bp_serve.dart';
import 'bp_activity.dart';
import 'bp_addr.dart';
import 'bp_choice.dart';

class CellChoiceFloorview extends StatefulWidget {
  const CellChoiceFloorview({Key? key}) : super(key: key);

  @override
  State<CellChoiceFloorview> createState() => _CellChoiceFloorviewState();
}

class _CellChoiceFloorviewState extends State<CellChoiceFloorview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 1),
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: const Column(
        children: [
          BpBpChoice(),
          BpBpParam(),
          BpBpAddr(),
          BpBpActivity(),
          BpBpFare(),
          BpBpServe(),
        ],
      ),
    );
  }
}
