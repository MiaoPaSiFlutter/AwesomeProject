// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpSeckill extends StatelessWidget {
  const BpBpSeckill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpSeckill");
    if (floor == null) {
      return Container();
    }
    Widget MSYGBtn = Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.red),
      ),
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: const Text(
        "秒杀预告",
        style: TextStyle(
          fontSize: 10,
          color: Colors.red,
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [MSYGBtn, Expanded(child: _buildDefaultAddr(context))],
      ),
    );
  }

  Widget _buildDefaultAddr(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpSeckill");
    Map bpMasterdata = context.watch<ProductDetailViewModel>().bpMasterdata;
    Map miaoshaInfo = bpMasterdata["data"]?["miaoshaInfo"] ?? {};
    String msTrailer = miaoshaInfo["msTrailer"] ?? "";
    return Row(
      children: [
        Expanded(
          child: Text(
            msTrailer,
            style: const TextStyle(fontSize: 11, color: Colors.red),
          ),
        )
      ],
    );
  }
}
