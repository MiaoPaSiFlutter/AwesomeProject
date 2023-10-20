import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/cartinfo_bottomview.dart';
import '../widget/cartinfo_vendor_cell.dart';

class MpsfShopcarPage extends StatefulWidget {
  const MpsfShopcarPage({Key? key}) : super(key: key);

  @override
  State createState() => _MpsfShopcarPageState();
}

class _MpsfShopcarPageState extends State<MpsfShopcarPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: const Text("购物车")),
      body: ProviderWidget<CarProvider>(
        model: Provider.of<CarProvider>(context, listen: false),
        onReady: (model) {
          model.getPageDatas();
        },
        builder: (context, model, child) {
          return MultiStateWidget(
            builder: (context) {
              return _buildNormalView();
            },
            state: model.state,
          );
        },
      ),
    );
  }

  Widget _buildNormalView() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 44),
          child: CustomScrollView(
            slivers: <Widget>[_buildListView()],
          ),
        ),
        _buildBottomView()
      ],
    );
  }

  Widget _buildListView() {
    CarProvider vm = Provider.of<CarProvider>(context, listen: false);
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: vm.vendors.length,
          (content, index) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: const Offset(4, 4),
                  blurRadius: 5,
                ),
              ],
            ),
            child: CartInfoVendorCell(vendor: vm.vendors[index]),
          ),
        );
      }),
    );
  }

  Widget _buildBottomView() {
    return const Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: CartInfoBottomView(),
    );
  }
}
