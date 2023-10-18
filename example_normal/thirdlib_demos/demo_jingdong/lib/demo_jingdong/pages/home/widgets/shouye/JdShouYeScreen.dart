import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'package:provider/provider.dart';

import '../../vm/home_viewmodel.dart';
import '../home_navigationbar.dart';
import 'category/hg_category_146_page.dart';
import 'category/hg_category_page.dart';
import 'tuijian/hg_welcome_home_page.dart';

class JdShouYeScreen extends StatefulWidget {
  const JdShouYeScreen({Key? key}) : super(key: key);

  @override
  State createState() => _JdShouYeScreenState();
}

class _JdShouYeScreenState extends State<JdShouYeScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _controller = ScrollController();
  PageController _pageController = PageController(viewportFraction: 1);
  final _modelVM = HomeViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      _pageController = PageController(initialPage: _modelVM.selectIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiProviderWidget(
      providers: [
        ChangeNotifierProvider(create: (_) => _modelVM),
      ],
      onReady: () {},
      child: ProviderWidget<HomeViewModel>(
        model: _modelVM,
        onReady: (model) {
          _modelVM.getWelcomeHomeData().then((value) {
            //这里延迟1s获取可偏移高度，不延迟获取到的是0.
            Future.delayed(const Duration(seconds: 1), () {
              final appBarHeight = model.getNavigationViewSize().height;
              final segmentHeight = model.getSegmentViewSize().height;
              model.updateCSD(
                appBarHeight_: appBarHeight,
                segmentHeight_: segmentHeight,
                segmentViewOffSet_: appBarHeight,
              );
            });
          });
        },
        builder: (context, model, child) {
          return MultiStateWidget(
            state: model.state,
            builder: (context) {
              return Stack(
                children: [
                  _buildPageView(),
                  _buildSegmentView(),
                  HomeNavigationBar(key: model.navigationGlobalKey),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (int index) {
        _modelVM.updateCSD(selectIndex_: index);
      },
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      itemCount: _modelVM.segments.length,
      itemBuilder: (context, index) {
        return _pageItemBuilder(index);
      },
    );
  }

  Widget _pageItemBuilder(int index) {
    if (index == 0) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.transparent),
        ),
        child: HGWelcomeHomePage(itemObj: _modelVM.welcomeHomeData),
      );
    } else if (index == 1) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.transparent),
        ),
        child: const HGCategory146Page(),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.red),
        ),
        child: HGCategoryPage(index: index, itemObj: _modelVM.segments[index]),
      );
    }
  }

  Widget _buildSegmentView() {
    return Consumer<HomeViewModel>(
      builder: (context, model, widget) {
        return Positioned(
          left: 0,
          right: 0,
          top: model.segmentViewOffSet,
          child: CommonSegmentView(
            key: model.segmentGlobalKey,
            onTap: (index) {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.ease);
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
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
    HomeViewModel vm = Provider.of<HomeViewModel>(context, listen: false);
    vm.addListener(() {
      _controller?.animateTo(vm.selectIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        children: [
          Expanded(child: Container(child: _getSegment())),
          InkWell(
            child: SizedBox(
              height: 30,
              child: Image.asset(
                NormalModuleUtils.configPackagesImage(
                    packagename: 'demo_jingdong',
                    name:
                        "assets/images/home/sss_aso_category_btn_black_Normal.png"),
                fit: BoxFit.fill,
                color: Colors.white,
              ),
            ),
            onTap: () {
              // NavigatorUtil.push(context, HomeRouter.category);
            },
          )
        ],
      ),
    );
  }

  Widget _getSegment() {
    return Column(
      children: [
        Consumer<HomeViewModel>(
          builder: (context, model, child) {
            Map welcomeHomeData = model.welcomeHomeData;
            String topBgImgBig = welcomeHomeData["topBgImgBig"] ?? "";

            _controller ??= TabController(
                initialIndex: 0, length: model.segments.length, vsync: this);

            List<Widget> tabs = model.segments.map((e) {
              int index = model.segments.indexOf(e);
              Map itemInfo = model.segments[index];
              String text =
                  HyzyTextTools.mpsfStr(itemInfo["tabTitle"], placehold: "推荐");
              bool isSelect = model.selectIndex == index;
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.transparent),
                ),
                height: 30,
                child: Text(
                  text,
                  style: TextStyle(
                    color: isSelect ? Colors.white : Colors.white54,
                  ),
                ),
              );
            }).toList();

            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExtendedNetworkImageProvider(
                      HyzyTextTools.mpsfStr(topBgImgBig)),
                  fit: BoxFit.cover,
                ),
              ),
              child: TabBar(
                controller: _controller,
                indicatorColor: Colors.white54,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true, //允许滚动
                tabs: tabs,
                onTap: (index) {
                  if (mounted) {
                    model.updateCSD(selectIndex_: index);
                  }
                  if (widget.onTap != null) {
                    widget.onTap!(index);
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
