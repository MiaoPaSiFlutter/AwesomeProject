import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';

import '../vm/jingxuan_viewmodel.dart';
import '../vm/news_viewmodel.dart';
import '../widgets/jingxuan_feed_view.dart';

import 'news_carousel_view.dart';

class JingXuanView extends StatefulWidget {
  const JingXuanView({Key? key}) : super(key: key);

  @override
  State createState() => _JingXuanViewState();
}

class _JingXuanViewState extends State<JingXuanView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _modelVM = JingXuanViewModel();

  final ScrollController _scrollController = ScrollController();
  ScrollPhysics? _physics;
  final PageController _pageController = PageController();

  final GlobalKey _listGlobalKey = GlobalKey();
  final GlobalKey _segmentGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //监听列表滚动
      _scrollController.addListener(() {
        _checkScrollEnable();
        _updateAppBarAlpha();
      });
    });
  }

  //判断外部ScrollView是否能滑动
  _checkScrollEnable() {
    double offset = _scrollController.position.pixels;
    double offSetMax = _modelVM.offSetMax;
    print("最外部CustomScrollView offset $offset  offSetMax=$offSetMax");
    if (offset > offSetMax) {
      _scrollController.jumpTo(offSetMax);
      // print("设置外部列表无法滑动");
      if (mounted) {
        setState(() {
          _physics = const NeverScrollableScrollPhysics();
        });
      }
    } else {
      // mpsfLogger.i("设置外部列表可以滑动");
      if (mounted) {
        setState(() {
          _physics = null;
        });
      }
    }
  }

  //更新AppBarAlpha
  _updateAppBarAlpha() {
    double offset = _scrollController.position.pixels;
    double alpha = offset / (MediaQuery.of(context).padding.top + 44);
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    // final model = Provider.of<JingXuanViewModel>(context);
    Provider.of<NewsViewModel>(context, listen: false).updateAppBarAlpha(alpha);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiProviderWidget(
      providers: [
        ChangeNotifierProvider(create: (_) => _modelVM),
      ],
      onReady: () {
        _modelVM.getPageDatas().then((value) {
          //这里延迟1s获取可偏移高度，不延迟获取到的是0.
          Future.delayed(const Duration(seconds: 1), () {
            final listHeight = _listGlobalKey.currentContext?.size?.height ?? 0;
            final appBarHeight = MediaQuery.of(context).padding.top + 44;
            final segmentHeight =
                _segmentGlobalKey.currentContext?.size?.height ?? 0;
            double offSetMax = listHeight - appBarHeight - segmentHeight;
            print("offSetMax = $offSetMax");
            _modelVM.updateOffSetMax(offSetMax);
            _modelVM.updateAppBarHeight(appBarHeight);
            _modelVM.updateSegmentHeight(segmentHeight);
          });
        });
      },
      child: Consumer<JingXuanViewModel>(
        builder: (context, value, child) {
          return MultiStateWidget(
            state: _modelVM.state,
            builder: (context) {
              return Scaffold(
                body: CustomScrollView(
                  physics: _physics,
                  controller: _scrollController,
                  slivers: [
                    _buildTopNipScrollerView(),
                    _buildTabbarView(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildTopNipScrollerView() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: 1, (context, index) {
        return Column(
          key: _listGlobalKey,
          children: [
            const NewsCarouselView(),
            CommonSegmentView(
              key: _segmentGlobalKey,
              onTap: didTapSegmentViewItem,
            )
          ],
        );
      }),
    );
  }

  void didTapSegmentViewItem(int index) {
    _pageController.jumpToPage(index);
    //重新判断外部ScrollView是否能滑动
    _checkScrollEnable();
  }

  Widget _buildTabbarView() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (content, index) {
          return Consumer<JingXuanViewModel>(
            builder: (context, vm, child) {
              double safeTop = vm.appBarHeight + vm.segmentHeight;
              double height = MediaQuery.of(context).size.height - safeTop;
              return Container(
                height: height,
                decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.blue),
                ),
                child: PageView.builder(
                  onPageChanged: (int index) {
                    _modelVM.updateSelectIndex(index);
                  },
                  // physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: _modelVM.tabList.length,
                  itemBuilder: (context, index) {
                    Map tabInfo = _modelVM.tabList[index];
                    return JingXuanFeedView(
                      tabInfo: tabInfo,
                      controller: _scrollController,
                      changeParentScroll: (bool canScroll) {
                        if (canScroll) {
                          // mpsfLogger.i("changeParentScroll 设置外部列表无法滑动");
                          setState(() {
                            _physics = null;
                          });
                        } else {
                          // mpsfLogger.i("changeParentScroll 设置外部列表可以滑动");
                          setState(() {
                            _physics = const NeverScrollableScrollPhysics();
                          });
                        }
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
    JingXuanViewModel vm =
        Provider.of<JingXuanViewModel>(context, listen: false);
    vm.addListener(() {
      _controller?.animateTo(vm.selectIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: _getSegment(),
          ),
        ),
        InkWell(
          child: SizedBox(
              width: 40,
              child: Image.asset(
                NormalModuleUtils.configPackagesImage(
                    packagename: 'demo_jingdong',
                    name:
                        "assets/images/home/sss_aso_category_btn_black_Normal.png"),
                fit: BoxFit.fill,
              )),
          onTap: () {
            // NavigatorUtil.push(context, AccountRouter.setting);
            // currentToPage(CommonPageId.CATEGORY);
          },
        )
      ],
    );
  }

  Widget _getSegment() {
    return Consumer<JingXuanViewModel>(
      builder: (context, _modelVM, child) {
        _controller ??= TabController(
            initialIndex: 0, length: _modelVM.tabList.length, vsync: this);

        List<Widget> tabs = _modelVM.tabList.map((e) {
          int index = _modelVM.tabList.indexOf(e);
          Map itemInfo = _modelVM.tabList[index];
          String text = HyzyTextTools.mpsfStr(itemInfo["firstTabName"]);
          bool isSelect = _modelVM.selectIndex == index;
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.transparent),
            ),
            height: 50,
            child: Text(
              text,
              style: TextStyle(
                color: isSelect ? Colors.red : Colors.black,
              ),
            ),
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
              _modelVM.updateSelectIndex(index);
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
