import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpAddr extends StatelessWidget {
  const BpBpAddr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpAddr");
    if (floor == null) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 5),
            child: const Text("送至", style: TextStyle(fontSize: 12)),
          ),
          Expanded(
            child: Column(
              children: [
                _buildDefaultAddr(context),
                _buildBizActs(context),
              ],
            ),
          ),
          const Row(
            children: [
              Column(
                children: [
                  Text("...",
                      style: TextStyle(fontSize: 10, color: Colors.grey))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAddr(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpAddr");

    Map defaultAddr = floor?["data"]?["defaultAddr"] ?? {};
    String provinceName = defaultAddr["provinceName"] ?? "";
    String cityName = defaultAddr["cityName"] ?? "";
    String countyName = defaultAddr["countyName"] ?? "";
    String townName = defaultAddr["townName"] ?? "";

    return Row(
      children: [
        Expanded(
          child: Text(
            "$provinceName省$cityName$countyName$townName",
            style: const TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }

  Widget _buildBizActs(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpAddr");
    String stock = floor?["data"]?["stock"] ?? "";
    return Row(
      children: [
        Expanded(
          child: RichText(
            overflow: TextOverflow.clip,
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "送至",
                  style: TextStyle(fontSize: 12, color: Colors.red),
                ),
                TextSpan(
                  text: stock,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
