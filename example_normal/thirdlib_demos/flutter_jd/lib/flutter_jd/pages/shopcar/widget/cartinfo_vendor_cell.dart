import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';
import 'op_order_goodsview.dart';

class CartInfoVendorCell extends StatefulWidget {
  final Map? vendor;
  const CartInfoVendorCell({Key? key, this.vendor}) : super(key: key);

  @override
  State createState() => _CartInfoVendorCellState();
}

class _CartInfoVendorCellState extends State<CartInfoVendorCell> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CartShopInfoView(vendor: widget.vendor),
        CartShopSortedInfoView(vendor: widget.vendor),
      ],
    );
  }
}

/// 店铺信息
class CartShopInfoView extends StatelessWidget {
  final Map? vendor;
  const CartShopInfoView({Key? key, this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String shopName = vendor?["shopName"] ?? "---";
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Row(
        children: [_buildCheckBox(), Text(shopName)],
      ),
    );
  }

  Widget _buildCheckBox() {
    return Consumer<CarProvider>(
      builder: (context, vm, _) {
        int vendorId = vendor?["vendorId"] ?? -1;
        bool isSelect = vm.selectedVendorIds.contains(vendorId);
        return SizedBox(
          width: 30,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.circle,
              color: isSelect ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              vm.updateSelectedVendorIds(vendorId);
            },
          ),
        );
      },
    );
  }
}

/// 店铺下面的商品
class CartShopSortedInfoView extends StatelessWidget {
  final Map? vendor;
  const CartShopSortedInfoView({
    Key? key,
    this.vendor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List sorted = vendor?["sorted"] ?? [];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      itemCount: sorted.length,
      itemBuilder: (context, index) {
        Map dants = sorted[index] ?? {};
        int itemType = dants["itemType"] ?? 0;
        int vendorId = vendor?["vendorId"] ?? -1;

        if (itemType == 1) {
          return CartShopSortedProduct1View(dants: dants, vendorId: vendorId);
        } else if (itemType == 9) {
          return CartShopSortedProduct9View(dants: dants, vendorId: vendorId);
        }
        return Center(child: Text("itemType = $itemType"));
      },
    );
  }
}

class CartShopSortedProduct1View extends StatefulWidget {
  final Map? dants;
  final int? vendorId;
  const CartShopSortedProduct1View({
    Key? key,
    this.dants,
    this.vendorId,
  }) : super(key: key);

  @override
  State<CartShopSortedProduct1View> createState() =>
      _CartShopSortedProduct1ViewState();
}

class _CartShopSortedProduct1ViewState
    extends State<CartShopSortedProduct1View> {
  var _item = {};

  @override
  void initState() {
    _item = widget.dants?["item"] ?? {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // OPOrderHeaderView(floor: floor),
        // OPOrderMessageView(floor: floor),
        OPOrderGoodsView(floor: _item, vendorId: widget.vendorId),
        // OPOrderActionViews(floor: floor),
      ],
    );
  }
}

class CartShopSortedProduct9View extends StatefulWidget {
  final Map? dants;
  final int? vendorId;

  const CartShopSortedProduct9View({
    Key? key,
    this.dants,
    this.vendorId,
  }) : super(key: key);

  @override
  State<CartShopSortedProduct9View> createState() =>
      _CartShopSortedProduct9ViewState();
}

class _CartShopSortedProduct9ViewState
    extends State<CartShopSortedProduct9View> {
  var _items = [];

  @override
  void initState() {
    _items = widget.dants?["item"]?["items"] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSTip(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          scrollDirection: Axis.vertical,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            int itemType = _items[index]["itemType"] ?? 0;
            if (itemType == 1) {
              return CartShopSortedProduct1View(
                dants: _items[index],
                vendorId: widget.vendorId,
              );
            } else if (itemType == 9) {
              return CartShopSortedProduct9View(
                dants: _items[index],
                vendorId: widget.vendorId,
              );
            }
            return Center(child: Text("itemType = $itemType"));
          },
        )
      ],
    );
  }

  Widget _buildSTip() {
    String STip = widget.dants?["item"]?["STip"] ?? "";
    String suitLabel = widget.dants?["item"]?["suitLabel"] ?? "";
    TextStyle style = const TextStyle(
        fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold);
    TextStyle sTipStyle = const TextStyle(
        fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold);
    if (HyzyTextTools.isEmpty(STip)) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.only(left: 35),
      child: CommonIconLableWidget(
        text: STip,
        style: sTipStyle,
        iconWidget: Container(
          padding: const EdgeInsets.only(left: 2, right: 2),
          margin: const EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(3),
            color: Colors.red,
          ),
          child: Text(suitLabel, style: style),
        ),
      ),
    );
  }
}
