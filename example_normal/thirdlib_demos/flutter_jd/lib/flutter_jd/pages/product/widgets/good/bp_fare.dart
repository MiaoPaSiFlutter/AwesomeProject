import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpFare extends StatelessWidget {
  const BpBpFare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpFare");
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
            child: const Text("运费", style: TextStyle(fontSize: 12)),
          ),
          Expanded(
            child: Column(
              children: [
                _buildDefaultAddr(context),
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
    final Map? floor = model.getFloorInfo("bpFare");

    String fare = floor?["data"]?["fare"] ?? "";
    return Row(
      children: [
        Expanded(child: Text(fare, style: const TextStyle(fontSize: 12)))
      ],
    );
  }
}
