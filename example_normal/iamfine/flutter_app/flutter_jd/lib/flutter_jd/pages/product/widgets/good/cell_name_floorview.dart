import 'package:flutter/material.dart';

import 'bp_aggre_promo.dart';
import 'bp_bpBangDan.dart';
import 'bp_bpUpNaviBar.dart';
import 'bp_jprice.dart';
import 'bp_name.dart';
import 'bp_member.dart';
import 'bp_seckill.dart';
import 'bp_union_rank.dart';
import 'bp_adword.dart';
import 'bp_bpBrightpoint.dart';

class CellNameFloorview extends StatefulWidget {
  final Map? floor;
  const CellNameFloorview({Key? key, this.floor}) : super(key: key);

  @override
  State<CellNameFloorview> createState() => _CellNameFloorviewState();
}

class _CellNameFloorviewState extends State<CellNameFloorview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 1),
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: const Column(
        children: [
          BpBpAggrePromo(),
          BpBpJPrice(),
          BpBpSeckill(),
          BpBpName(),
          BpBpMember(),
          BpBpAdword(),
          BpBpBrightpoint(),
          BpBpUnionRank(),
          BpBpBangDan(),
          BpBpUpNaviBar(),
        ],
      ),
    );
  }
}
