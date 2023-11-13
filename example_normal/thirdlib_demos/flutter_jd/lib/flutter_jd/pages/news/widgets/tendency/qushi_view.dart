import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../vm/news_viewmodel.dart';
import 'qushi_feed_view.dart';
import 'qushi_viewmodel.dart';

class QuShiView extends StatefulWidget {
  const QuShiView({Key? key}) : super(key: key);

  @override
  State createState() => _QuShiViewState();
}

class _QuShiViewState extends State<QuShiView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _modelVM = QuShiViewModel();
  final Map _childGlobalKeys = {};
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<QuShiViewModel>(
      model: _modelVM,
      onReady: (model) {
        model.getPageDatas();
      },
      builder: (context, model, widget) {
        return MultiStateWidget(
          state: model.state,
          builder: (context) {
            return Scaffold(
              body: Stack(
                children: [
                  _buildTabbarView(),
                  _buildSegmentView(),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildSegmentView() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + kToolbarHeight,
      left: 0,
      right: 0,
      child: CommonSegmentView(onTap: didTapSegmentIndex),
    );
  }

  void didTapSegmentIndex(int index) {
    // 切换视图
    _pageController.jumpToPage(index);

    // 调用子组件方法
    for (var element in _childGlobalKeys.values) {
      element.currentState?.childFunction();
    }
  }

  Widget _buildTabbarView() {
    // final model = Provider.of<JingXuanViewModel>(context);
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      child: PageView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: _modelVM.tabList.length,
        onPageChanged: (int index) {
          _modelVM.updateSelectIndex(index);
        },
        itemBuilder: (context, index) {
          Map info = _modelVM.tabList[index];
          if (!_childGlobalKeys.keys.contains(index)) {
            _childGlobalKeys.addAll({index: QuShiFeedView.createGlobalKey()});
          }
          return QuShiFeedView(
            key: _childGlobalKeys[index],
            info: info,
          );
        },
      ),
    );
  }
}

///////////SegmentView
class CommonSegmentView extends StatefulWidget {
  const CommonSegmentView({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final void Function(int)? onTap;

  @override
  State<CommonSegmentView> createState() => _CommonSegmentViewState();
}

class _CommonSegmentViewState extends State<CommonSegmentView>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    QuShiViewModel vm = Provider.of<QuShiViewModel>(context, listen: false);
    vm.addListener(() {
      _controller?.animateTo(vm.selectIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          Consumer<NewsViewModel>(
            builder: (context, model, child) {
              return Container(
                  height: 40,
                  color: Color.fromRGBO(255, 255, 255, model.appBarAlpha));
            },
          ),
          SizedBox(
            height: 40,
            child: Container(
              child: _getSegment(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSegment() {
    return Consumer<QuShiViewModel>(
      builder: (context, modelVM, child) {
        _controller ??= TabController(
            initialIndex: 0, length: modelVM.tabList.length, vsync: this);

        List<Widget> tabs = modelVM.tabList.map((e) {
          int index = modelVM.tabList.indexOf(e);
          Map itemInfo = modelVM.tabList[index];
          String name = HyzyTextTools.mpsfStr(itemInfo["name"]);
          bool isSelect = modelVM.selectIndex == index;
          return Consumer<NewsViewModel>(
            builder: (context, model, child) {
              TextStyle textStyle;
              if (model.appBarAlpha >= 1) {
                textStyle =
                    TextStyle(color: isSelect ? Colors.black : Colors.black45);
              } else {
                textStyle =
                    TextStyle(color: isSelect ? Colors.white : Colors.white54);
              }
              return Text(name, style: textStyle);
            },
          );
        }).toList();

        return TabBar(
          controller: _controller,
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true, //允许滚动
          tabs: tabs,
          onTap: (index) {
            if (mounted) {
              modelVM.updateSelectIndex(index);
            }
            if (widget.onTap != null) {
              widget.onTap!(index);
            }
          },
        );
      },
    );
  }
}
