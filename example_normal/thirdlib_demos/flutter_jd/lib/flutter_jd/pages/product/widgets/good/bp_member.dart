import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpMember extends StatelessWidget {
  const BpBpMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpMember");
    if (floor == null) {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(5),
          color: Colors.yellow.shade100,
          child: Row(
            children: [Expanded(child: _content(context)), _rightMore(context)],
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpMember");

    Map unitedPLUSExpansion =
        floor?["data"]?["data"]?["other"]?["unitedPLUSExpansion"] ?? {};
    String discount = unitedPLUSExpansion["floorDO"]?["discount"] ?? "";
    String textBeforeDiscount =
        unitedPLUSExpansion["floorDO"]?["textBeforeDiscount"] ?? "";
    String iImg = unitedPLUSExpansion["floorDO"]?["iImg"] ?? "";
    return RichText(
      overflow: TextOverflow.clip,
      text: TextSpan(
        children: [
          buildCenteredTextSpan(
              child: Text(textBeforeDiscount,
                  style: const TextStyle(fontSize: 12, color: Colors.black))),
          buildCenteredTextSpan(
              child: Text(discount,
                  style: const TextStyle(fontSize: 12, color: Colors.red))),
          buildCenteredTextSpan(
              child: CommonExtendedImageWidget.netWorkImget(
                  url: iImg, width: 12, height: 12)),
        ],
      ),
    );
  }

  Widget _rightMore(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpMember");

    Map unitedPLUSExpansion = floor?["data"]?["unitedPLUSExpansion"] ?? {};
    String tailText = unitedPLUSExpansion["floorDO"]?["tailText"] ?? "";
    String tailArrow = unitedPLUSExpansion["floorDO"]?["tailArrow"] ?? "";
    return RichText(
      maxLines: 1,
      text: TextSpan(
        children: [
          buildCenteredTextSpan(
              child: Text(tailText,
                  style: const TextStyle(fontSize: 12, color: Colors.black))),
          buildCenteredTextSpan(
              child: CommonExtendedImageWidget.netWorkImget(
                  url: tailArrow, width: 5, height: 10)),
        ],
      ),
    );
  }

  WidgetSpan buildCenteredTextSpan({required Widget child}) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: child,
    );
  }
}
