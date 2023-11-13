// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../../../vm/home_viewmodel.dart';

class JdFloorStylebanner extends StatefulWidget {
  final Map? floor;
  const JdFloorStylebanner({Key? key, this.floor}) : super(key: key);

  @override
  State createState() => _JdFloorStylebannerState();
}

class _JdFloorStylebannerState extends State<JdFloorStylebanner> {
  String _background = "";
  final List _banners = [];
  final List<Widget> _imageSliders = [];
  @override
  void initState() {
    super.initState();
    _configDatas();
  }

  double _getNavigationBarHeight() {
    return MediaQuery.of(context).padding.top + 44 + 35;
  }

  double _getSegmentViewHeight() {
    return 40;
  }

  double _getBannerViewHeight() {
    return 150;
  }

  double _getCarouselViewHeight() {
    return _getNavigationBarHeight() +
        _getSegmentViewHeight() +
        _getBannerViewHeight();
  }

  @override
  Widget build(BuildContext context) {
    Map welcomeHomeData = Provider.of<HomeViewModel>(context).welcomeHomeData;
    String topBgImgBig = welcomeHomeData["topBgImgBig"] ?? "";
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        return Container(
          width: double.infinity,
          height: _getCarouselViewHeight(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExtendedNetworkImageProvider(
                  HyzyTextTools.mpsfStr(topBgImgBig)),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(top: _getNavigationBarHeight()),
            child: Column(
              children: [
                _buildSegmentView(),
                SizedBox(
                  height: _getBannerViewHeight(),
                  child: _buildCarousels(screenWidth),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  /////////////🔥构造数据
  _configDatas() {
    _banners.clear();
    _imageSliders.clear();
    Map background = widget.floor?["background"] ?? {};
    _background = background["img"] ?? "";

    List content = widget.floor?["content"] ?? [];
    for (var i = 0; i < content.length; i++) {
      _banners.add(content[i]["horizontalImag"] ?? "");
    }
  }

  /////SegmentView
  Widget _buildSegmentView() {
    return Container(
      height: 40,
    );
  }

  /////////////🔥组件
  //定义轮播图组件
  Widget _buildCarousels(double screenWidth) {
    if (_banners.isNotEmpty) {
      return CarouselSlider(
        options: CarouselOptions(
          height: _getBannerViewHeight(),
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 0,
          autoPlay: true,
          viewportFraction: (screenWidth - 12 * 2) / screenWidth,
        ),
        items: _buildBanners(screenWidth),
      );
    } else {
      return Container();
    }
  }

  List<Widget> _buildBanners(double screenWidth) {
    return _banners
        .map(
          (item) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                SizedBox(
                  width: screenWidth - 12 * 2,
                  child: CommonExtendedImageWidget.netWorkImget(url: item),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  //
  // //自定圆点分页指示器
  // _buildSwiperPagination() {
  //   // 分页指示器
  //   return const SwiperPagination(
  //     //指示器显示的位置
  //     alignment: Alignment.bottomCenter, // 位置 Alignment.bottomCenter 底部中间
  //     // 距离调整
  //     margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
  //     // 指示器构建
  //     builder: DotSwiperPaginationBuilder(
  //         // 点之间的间隔
  //         space: 2,
  //         // 没选中时的大小
  //         size: 6,
  //         // 选中时的大小
  //         activeSize: 8,
  //         // 没选中时的颜色
  //         color: Colors.black54,
  //         //选中时的颜色
  //         activeColor: Colors.white),
  //   );
  // }
}
