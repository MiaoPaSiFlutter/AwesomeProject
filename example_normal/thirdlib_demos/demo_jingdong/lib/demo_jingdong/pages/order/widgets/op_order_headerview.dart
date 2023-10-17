import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'mpsf_countdown.dart';

class OPOrderHeaderView extends StatefulWidget {
  final Map floor;
  const OPOrderHeaderView({
    Key? key,
    this.floor = const {},
  }) : super(key: key);

  @override
  State createState() => _OPOrderHeaderViewState();
}

class _OPOrderHeaderViewState extends State<OPOrderHeaderView> {
  @override
  Widget build(BuildContext context) {
    String? shopName = widget.floor["shopName"];
    String? orderStatusShow = widget.floor["orderStatusShow"];
    String remainTime = widget.floor["countDownFloor"]?["remainTime"] ?? "0";
    int timeLeft = int.parse(remainTime);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              HyzyTextTools.mpsfStr("$shopName"),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          timeLeft > 0 ? MpsfCountdown(timeLeft: timeLeft) : Container(),
          Text(
            HyzyTextTools.mpsfStr("$orderStatusShow"),
          )
        ],
      ),
    );
  }
}
