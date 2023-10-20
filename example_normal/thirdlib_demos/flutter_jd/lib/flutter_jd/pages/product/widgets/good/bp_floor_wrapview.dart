import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../vm/product_detail_viewmodel.dart';
import './bp_main_image_floorview.dart';
import './bp_match_purchase_floorview.dart';
import './bp_recommend_floorview.dart';
import './bp_suit_floorview.dart';
import '../detail/bp_details.dart';
import 'bp_parts.dart';
import 'bp_shop.dart';
import 'bp_bus_support.dart';
import 'cell_choice_floorview.dart';
import 'cell_evaluate_floorview.dart';
import 'cell_name_floorview.dart';

class BpFloorWrapView extends StatelessWidget {
  final Map? floor;
  const BpFloorWrapView({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _floorViewBuilder(context, floor);
  }

  Widget _floorViewBuilder(BuildContext context, Map? floor) {
    String? mId = floor?["mId"];
    Widget? contentWidget;
    bool hasSpace = false;
    EdgeInsets padding = const EdgeInsets.only(left: 10, right: 10);
    Key? floorKey =
        context.watch<ProductDetailViewModel>().getFloorGlobalKey(mId);

    if (mId == "bpMainImage") {
      hasSpace = true;
      padding = const EdgeInsets.all(0);
      contentWidget = _wrapItem(BpMainImageFloorView(floor: floor));
    } else if (mId == "bpName") {
      hasSpace = true;
      contentWidget = _wrapItem(const CellNameFloorview());
    } else if (mId == "bpChoice") {
      hasSpace = true;
      contentWidget = _wrapItem(const CellChoiceFloorview());
    } else if (mId == "bpEvaluate") {
      hasSpace = true;
      contentWidget = _wrapItem(const CellEvaluateFloorview());
    } else if (mId == "bpBusSupport") {
      hasSpace = true;
      contentWidget = _wrapItem(const BpBpBusSupport());
    } else if (mId == "bpShop") {
      hasSpace = true;
      contentWidget = _wrapItem(const BpBpShop());
    } else if (mId == "bpParts") {
      hasSpace = true;
      contentWidget = _wrapItem(const BpBpParts());
    } else if (mId == "bpDetails") {
      hasSpace = true;
      contentWidget = _wrapItem(const BpBpDetails());
    } else if (mId == "bpSuit") {
      contentWidget = _wrapItem(BpSuitFloorView(floor: floor));
    } else if (mId == "bpMatchPurchase") {
      contentWidget = _wrapItem(BpMatchPurchaseFloorView(floor: floor));
    } else if (mId == "bpRecommend") {
      contentWidget = _wrapItem(BpRecommendFloorView(floor: floor));
    }

    if (contentWidget == null) {
      return Container();
    }
    List floorGlobalKeys =
        context.watch<ProductDetailViewModel>().floorGlobalKeys;
    for (var element in floorGlobalKeys) {
      if (element["mId"] == mId) {
        floorKey = element["key"];
      }
    }

    return Container(
      key: floorKey,
      color: Colors.black12,
      child: Column(
        children: [
          Container(
            padding: padding,
            child: contentWidget,
          ),
          hasSpace ? const SizedBox(height: 10) : const SizedBox(height: 0)
        ],
      ),
    );
  }

  Widget _wrapItem(Widget child) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.transparent),
              color: Colors.white,
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
