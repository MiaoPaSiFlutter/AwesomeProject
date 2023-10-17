import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';

import 'op_order_actionview.dart';
import 'op_order_goodsview.dart';
import 'op_order_headerview.dart';
import 'op_order_messageview.dart';
import 'order_viewmodel.dart';

class OrderSonListView extends StatefulWidget {
  final String functionId;
  const OrderSonListView(this.functionId, {Key? key}) : super(key: key);

  @override
  State createState() => _OrderSonListViewState();
}

class _OrderSonListViewState extends State<OrderSonListView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late JdCommonEasyRefreshController _controller;
  late OrderViewModel _modelVM;
  @override
  void initState() {
    _controller = JdCommonEasyRefreshController();
    _modelVM = OrderViewModel(functionId: widget.functionId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _loadMainView(context),
    );
  }

  Widget _loadMainView(BuildContext context) {
    return Container(
      color: Colors.black26,
      width: double.infinity,
      height: double.infinity,
      child: ProviderWidget<OrderViewModel>(
        model: _modelVM,
        onReady: (model) {
          model.refreshData();
        },
        builder: (context, model, child) {
          return MultiStateWidget(
            builder: (context) => _buildEasyRefreshView(),
            state: model.state,
            onTap: (ScreenState? state) {
              if (state != ScreenState.CONTENT) {
                model.state = ScreenState.LOADING;
                model.refreshData();
              }
            },
          );
        },
      ),
    );
  }

  ///////////////////////
  /////////////////////// EasyRefresh
  ///////////////////////
  Widget _buildEasyRefreshView() {
    return JdCommonEasyRefresh(
      controller: _controller,
      onRefresh: () async {
        if (_modelVM.requesting) {
          return;
        }
        _modelVM.refreshData().then((value) {
          _controller.mpsfFinishRefresh();
          _controller.mpsfResetFooter();
        });
      },
      onLoad: () async {
        if (_modelVM.requesting) {
          return;
        }
        _modelVM.addMoreData().then((MpsfResponse res) {
          _controller.mpsfFinishLoad(_modelVM.noMore
              ? CommonIndicatorResult.noMore
              : CommonIndicatorResult.success);
        });
      },
      child: _buildEasyRefreshViewChild(),
    );
  }

  Widget _buildEasyRefreshViewChild() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _builderCellWidget(_modelVM.floors[index]);
            },
            childCount: _modelVM.floors.length,
          ),
        ),
      ],
    );
  }

  ///楼层构建
  Widget? _builderCellWidget(Map floor) {
    return Column(
      children: [
        _orderCardItemBuilder(floor),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _orderCardItemBuilder(Map floor) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: [
            OPOrderHeaderView(floor: floor),
            OPOrderMessageView(floor: floor),
            OPOrderGoodsView(floor: floor),
            OPOrderActionViews(floor: floor),
          ],
        ),
      ),
    );
  }
}
