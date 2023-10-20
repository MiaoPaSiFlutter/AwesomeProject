import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpBrightpoint extends StatelessWidget {
  const BpBpBrightpoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpBrightpoint");
    if (floor == null) {
      return Container();
    }
    String brightPoints = floor["data"]?["brightPoints"] ?? "";

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: getColorFromHex("#EEEEEE"), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              overflow: TextOverflow.clip,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: brightPoints,
                    style: TextStyle(
                        fontSize: 12, color: getColorFromHex("#000000")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
