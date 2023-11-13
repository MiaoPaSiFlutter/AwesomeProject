// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpMainImageFloorView extends StatelessWidget {
  final Map? floor;
  const BpMainImageFloorView({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List wareImage = context.watch<ProductDetailViewModel>().wareImage;
    List<String> imageUrls = wareImage.map((e) => "${e["big"]}").toList();
    imageUrls.insert(0, "");
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.red),
      ),
      child: CustomBannerWidget(
        dataList: imageUrls,
        bannerHeight: MediaQuery.of(context).size.width,
        onBannerPageChanged: (index) {},
        itemBuilder: (context, url, realPos) {
          if (realPos == 0) {
            return _createVideoItem(context, realPos);
          } else {
            return _createImageItem(context, realPos);
          }
        },
      ),
    );
  }

  Widget _createVideoItem(BuildContext context, int index) {
    List wareImage = context.watch<ProductDetailViewModel>().wareImage;
    Map info = wareImage.first;
    String small = info["small"] ?? "";
    String big = info["big"] ?? "";
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      child: CommonExtendedImageWidget.netWorkImget(url: big),
    );
  }

  Widget _createImageItem(BuildContext context, int index) {
    List wareImage = context.watch<ProductDetailViewModel>().wareImage;
    Map info = wareImage[index - 1];
    String small = info["small"] ?? "";
    String big = info["big"] ?? "";
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 10, color: Colors.transparent),
      ),
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      child: CommonExtendedImageWidget.netWorkImget(url: big),
    );
  }
}

typedef OnBannerPageChanged = void Function(int index);
typedef ItemBuilder = Widget Function(
    BuildContext context, String url, int realPos);

class CustomBannerWidget extends StatefulWidget {
  ///源数据
  final List<String> dataList;
  final OnBannerPageChanged? onBannerPageChanged;
  final bool showIndicator;
  final ItemBuilder itemBuilder;
  final double bannerHeight;
  final double bannerRadius;
  final int intervalTime;
  final bool isAuto;

  const CustomBannerWidget({
    Key? key,
    this.onBannerPageChanged,
    required this.dataList,
    required this.itemBuilder,
    this.showIndicator = true,
    this.bannerHeight = 100,
    this.bannerRadius = 0.0,
    this.intervalTime = 2,
    this.isAuto = true,
  });

  @override
  State<StatefulWidget> createState() {
    return _CustomBannerWidgetState();
  }
}

class _CustomBannerWidgetState extends State<CustomBannerWidget> {
  final PageController _pageController = PageController(initialPage: 1);
  int _currentIndex = 1;
  List<String> addedImgs = [];
  bool isEnd = false;
  bool isUserGesture = false;
  ValueNotifier<int> realPos = ValueNotifier(0);
  Timer? _timer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _startTimer();
    });

    super.initState();
    addedImgs.clear();
    if (widget.dataList.isNotEmpty) {
      addedImgs
        ..add(widget.dataList.last)
        ..addAll(widget.dataList)
        ..add(widget.dataList.first);
    }
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dataList.isEmpty) {
      return SizedBox(width: double.infinity, height: widget.bannerHeight);
    }

    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        return _onNotification(notification);
      },
      child: Stack(
        children: [
          _buildPager(),
          _buildInfoView(),
        ],
      ),
    );
  }

  _onPageChanged(int page) async {
    //比如元数据为012则构造完的数据为20120
    if (page == addedImgs.length - 1) {
      //当前选中的是倒数第一个位置，自动选中第二个索引
      _currentIndex = 1;
      await Future.delayed(const Duration(milliseconds: 50));
      _pageController.jumpToPage(_currentIndex);
      realPos.value = 0;
    } else if (page == 0) {
      //当前选中的是第一个位置，自动选中倒数第二个位置
      _currentIndex = addedImgs.length - 2;
      await Future.delayed(const Duration(milliseconds: 50));
      _pageController.jumpToPage(_currentIndex);
      realPos.value = _currentIndex - 1;
    } else {
      _currentIndex = page;
      realPos.value = _currentIndex - 1;
      if (realPos.value < 0) realPos.value = 0;
    }
    setState(() {});
    if (widget.onBannerPageChanged != null) {
      widget.onBannerPageChanged!(realPos.value);
    }
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification.depth == 0 && notification is ScrollStartNotification) {
      if (notification.dragDetails != null) {
        _stopTimer();
      }
    } else if (notification is ScrollEndNotification) {
      _stopTimer();
      _startTimer();
    }
    return false;
  }

  void _startTimer() {
    if (widget.dataList.length > 1 && widget.isAuto) {
      _timer = Timer.periodic(
        Duration(seconds: widget.intervalTime),
        (timer) => _scrollToPage(),
      );
    }
  }

  void _scrollToPage() {
    ++_currentIndex;
    var next = _currentIndex % addedImgs.length;
    _pageController.animateToPage(
      next,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  Widget _buildPager() {
    List<Widget> children = [];
    for (var url in addedImgs) {
      children.add(
        ClipRRect(
          borderRadius: BorderRadius.circular(widget.bannerRadius),
          child: widget.itemBuilder(context, url, realPos.value),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: widget.bannerHeight,
      child: PageView(
        onPageChanged: (index) => _onPageChanged(index),
        controller: _pageController,
        children: children,
      ),
    );
  }

  Widget _buildInfoView() {
    return Positioned(
      right: 10,
      bottom: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30 / 2),
        child: Container(
          height: 20,
          color: Colors.black38,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Text(
            "$_currentIndex / ${widget.dataList.length}",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
