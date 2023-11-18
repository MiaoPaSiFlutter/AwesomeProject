// ignore_for_file: unused_local_variable

import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import '../vm/product_detail_viewmodel.dart';
import '../widgets/product_bottomview.dart';
import '../widgets/product_navigationbar.dart';
import '../widgets/good/bp_floor_wrapview.dart';

class MpsfProductPage extends StatefulWidget {
  final Map<String, String?> parameters;
  const MpsfProductPage({
    Key? key,
    required this.parameters,
  }) : super(key: key);

  @override
  State createState() => _MpsfProductPageState();
}

class _MpsfProductPageState extends State<MpsfProductPage> {
  final ScrollController _scrollController = ScrollController();
  late ProductDetailViewModel _vmModel;
  @override
  void initState() {
    _vmModel = ProductDetailViewModel(widget.parameters);
    super.initState();
    //监听滚动事件，打印滚动位置
    _scrollController.addListener(() {
      updateAppBarAlpha();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ProductDetailViewModel>(
      model: _vmModel,
      onReady: (_) => _vmModel.getWareBusiness(),
      builder: (context, _, child) {
        return MultiStateWidget(
          state: _vmModel.state,
          builder: (context) {
            return Scaffold(
              body: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(child: renderCustomScrollView()),
                      const BPProductBottomView()
                    ],
                  ),
                  BPProductNavigationBar(onSelectIndex: updateTopBarSelectIndex)
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget renderCustomScrollView() {
    return Container(
      color: Colors.grey.withAlpha(50),
      child: CustomScrollView(
        key: _vmModel.scrollerViewKey,
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: _vmModel.floors.map((e) {
                return BpFloorWrapView(floor: e);
              }).toList(),
            ),
          )
        ],
      ).intoNotification<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            // print('ScrollStartNotification');
          } else if (notification is ScrollUpdateNotification) {
            // 当前滚动的位置和总长度
            double currentPixel = notification.metrics.pixels;
            double totalPixel = notification.metrics.maxScrollExtent;
            double progress = currentPixel / totalPixel;
            // print('ScrollUpdateNotification progress=$progress');
            // print('ScrollUpdateNotification pr
            // ogress=${notification.context}');
            if (_vmModel.scrollerViewKey.currentContext != null) {
              final BuildContext? context = notification.context;

              // print(
              // "scrollerViewKey.currentContext = ${_model.scrollerViewKey.currentContext} notification.context = ${notification.context}");

              // if (_model.scrollerViewKey.currentContext == context) {
              //   print("scrollerViewKey.currentContext == context");
              // } else {
              //   print("scrollerViewKey.currentContext != context");
              // }
            } else {
              // print("scrollerViewKey.currentContext != null");
            }
          } else if (notification is ScrollEndNotification) {
            double offset = _scrollController.position.pixels;
            // print("ScrollEndNotification offset = $offset");
          }
          return false;
        },
      ),
    );
  }
}

extension MpsfProductPageExt on _MpsfProductPageState {
  /// 更新导航条顶部选择指示器
  updateTopBarSelectIndex(int index) {
    var appBarH = MediaQuery.of(context).padding.top + 44;

    if (index == 0) {
      _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    } else if (index == 1) {
      double offSet = _vmModel.getFloorViewOffset("bpEvaluate");
      offSet -= appBarH;
      offSet -= 10;
      _scrollController.animateTo(offSet,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    } else if (index == 2) {
      double offSet = _vmModel.getFloorViewOffset("bpDetails");
      offSet -= appBarH;
      offSet -= 10;
      _scrollController.animateTo(offSet,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    } else if (index == 3) {
      double offSet = _vmModel.getFloorViewOffset("bpRecommend");
      offSet -= appBarH;
      offSet -= 10;
      _scrollController.animateTo(offSet,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  /// 更新导航条透明度
  updateAppBarAlpha() {
    double offset = _scrollController.position.pixels;
    double alpha = offset / (MediaQuery.of(context).padding.top + 44);
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    _vmModel.updateAppBarAlpha(alpha);
  }
}
