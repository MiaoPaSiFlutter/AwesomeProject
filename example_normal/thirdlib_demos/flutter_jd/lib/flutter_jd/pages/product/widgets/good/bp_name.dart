import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpName extends StatelessWidget {
  const BpBpName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Expanded(
            child: _buildDefaultAddr(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAddr(BuildContext context) {
    Map bpMasterdata = context.watch<ProductDetailViewModel>().bpMasterdata;
    Map wareInfo = bpMasterdata["data"]?["wareInfo"] ?? {};
    String name = wareInfo["name"] ?? "";
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        )
      ],
    );
  }
}
