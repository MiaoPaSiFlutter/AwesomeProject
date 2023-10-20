import 'package:flutter/material.dart';

import 'bp_evaluate.dart';
import 'bp_ask.dart';

class CellEvaluateFloorview extends StatefulWidget {
  final Map? floor;
  const CellEvaluateFloorview({Key? key, this.floor}) : super(key: key);

  @override
  State<CellEvaluateFloorview> createState() => _CellEvaluateFloorviewState();
}

class _CellEvaluateFloorviewState extends State<CellEvaluateFloorview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 1),
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: const Column(
        children: [
          BpBpEvaluate(),
          BpBpAsk(),
        ],
      ),
    );
  }
}
