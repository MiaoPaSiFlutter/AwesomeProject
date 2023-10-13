import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

import 'common_state.dart';
import '../models/models_index.dart';
import 'common_extendeed_image_widget.dart';

class CommonLongImageSWidget extends StatefulWidget {
  const CommonLongImageSWidget({
    super.key,
    this.scrollerIndex,
    this.keepAlive = true,
    this.index = 0,
    this.cache = true,
    this.cacheName,
    required this.imageModellist,
    this.controller,
    this.isNeedHero = true,
    this.scrollStar,
    this.scrollUpdata,
    this.scrollEnd,
    this.userScroll,
    this.heroSub,
    this.tapImageCall,
    this.tapImageOnLongPress,
    this.interfaceRender,
  });

  /// 滚动下标回调
  final Function(
    int index,
  )? scrollerIndex;

  /// 滑动开始
  final Function(ScrollNotification notification)? scrollStar;

  /// 滑动中
  final Function(ScrollNotification notification)? scrollUpdata;

  /// 滑动结束
  final Function(ScrollNotification notification)? scrollEnd;

  /// 用户主动滑动结束
  final Function(ScrollNotification notification)? userScroll;

  /// 界面创建完成
  final Function()? interfaceRender;

  /// 点击图片回调
  final Function(int index, ImageNormalModel imageNormalModel)? tapImageCall;

  /// 长按图片回调
  final Function(int index, ImageNormalModel imageNormalModel)?
      tapImageOnLongPress;

  /// 是否开启状态保存
  final bool? keepAlive;

  /// 初始值下标
  final int? index;

  /// 是否缓存图片
  final bool? cache;

  /// 缓存图片地址
  final String? cacheName;

  /// hero开头标志
  final String? heroSub;

  /// 图片缓存数据
  final List<ImageNormalModel> imageModellist;

  /// 滚动控制器
  final ScrollController? controller;

  /// 是否需要hero 动画
  final bool? isNeedHero;
  @override
  State<StatefulWidget> createState() {
    return CommonLongImageSState();
  }
}

class CommonLongImageSState extends CommonState<CommonLongImageSWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get isNeedScaffol => false;

  @override
  bool configSafeAreaTop() => false;

  /// 图片个数
  int num = 0;

  /// 最大高度
  double maxh = 0;

  /// 滚动控制器
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);

  /// 界面子视图列表
  List<Widget> list = [];

  List sizeList = [];

  /// 是否是用户滚动
  bool isUserScroller = true;

  Map currentInfo = {"index": 0, "star": 0.0, "end": 0.0};
  @override
  void initState() {
    if (widget.controller != null) {
      scrollController = widget.controller!;
    } else {
      scrollController = ScrollController(
          initialScrollOffset:
              configScrollerJumpToHeight(index: widget.index!));
    }
    list = createListImage();
    super.initState();
  }

  @override
  interfaceRenderingCompleted() {
    if (widget.interfaceRender != null) {
      widget.interfaceRender!();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return createBuild(context: context);
  }

  @override
  configBoxDecoreation() {
    return null;
  }

  @override
  bool configIsNeedLayout() {
    return true;
  }

  // 创建图片数组
  createListImage() {
    List<Widget> list = [];
    num = widget.imageModellist.length;
    for (var i = 0; i < num; i++) {
      list.add(createItemBuilder(context, i));
    }
    return list;
  }

  Widget createItemBuilder(BuildContext context, int index) {
    ImageNormalModel imageNormalModel = widget.imageModellist[index];

    double star = maxh;
    maxh = maxh + (imageNormalModel.size?.height ?? 0);
    Map info = {"index": index, "star": star, "end": maxh};
    if (index == widget.index) {
      currentInfo = info;
    }
    imageNormalModel.heroStr = null;
    sizeList.add(info);
    return createImageBuilder(
      imageNormalModel: imageNormalModel,
      index: index,
      cache: widget.cache ?? true,
      heroStr:
          widget.heroSub == null ? widget.heroSub : "${widget.heroSub}$index",
      isNeedHero: widget.isNeedHero ?? true,
      cacheName: widget.cacheName,
      isCanTap: widget.tapImageCall != null,
      tapCall: (p0) {
        if (widget.tapImageCall != null) {
          widget.tapImageCall!(index, imageNormalModel);
        }
      },
      onLongPress: (p0) {
        if (widget.tapImageOnLongPress != null) {
          widget.tapImageOnLongPress!(index, imageNormalModel);
        }
      },
    );
  }

  @override
  Widget createBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: list,
      ),
    );
    // Widget body = ListView.builder(
    //   controller: scrollController,
    //   itemBuilder: createItemBuilder,
    //   itemCount: widget.imageModellist.length,
    // );

    body = Scrollbar(
      notificationPredicate: (notification) {
        configNotification(notification: notification);
        return true;
      },
      controller: scrollController,
      child: body,
    );
    return body;
  }

  configNotification({required ScrollNotification notification}) {
    //1.监听事件的类型
    if (notification is ScrollStartNotification) {
      dPrint("开始滑动");
      configScrollStar(notification: notification);
    } else if (notification is ScrollUpdateNotification) {
      //当前滚动的位置和总长度
      configScrollUpdate(notification: notification);
    } else if (notification is OverscrollNotification) {
      dPrint("OverscrollNotification");
    } else if (notification is ScrollEndNotification) {
      dPrint("滑动停止");
      configScrollEnd(notification: notification);
    } else if (notification is UserScrollNotification) {
      dPrint("UserScrollNotification");
      configUserScroll(notification: notification);
    }
  }

  /// 滚动开始
  configScrollStar({required ScrollNotification notification}) {
    if (widget.scrollStar != null) {
      widget.scrollStar!(notification);
    }
  }

  /// 滑动中
  configScrollUpdate({required ScrollNotification notification}) {
    final currentPixel = notification.metrics.pixels;
    final totalPixel = notification.metrics.maxScrollExtent;
    int index = configScrollerHeightWithIndex(pixels: currentPixel);
    double bottomM = (totalPixel - (100));
    if (scrollController.position.pixels > bottomM) {
      index = num - 1;
    }
    if (widget.scrollUpdata != null) {
      widget.scrollUpdata!(notification);
    }
    if (widget.scrollerIndex != null && isUserScroller) {
      widget.scrollerIndex!(index);
    }
  }

  /// 滑动结束
  configScrollEnd({required ScrollNotification notification}) {
    if (widget.scrollEnd != null) {
      widget.scrollEnd!(notification);
    }
  }

  /// 用户滑动有距离后停止
  configUserScroll({required ScrollNotification notification}) {
    isUserScroller = true;
    if (widget.userScroll != null) {
      widget.userScroll!(notification);
    }
  }

  /// 根据图片 大小  获取 滚动距离
  configScrollerJumpToHeight({
    required int index,
  }) {
    double jumptoheight = 0;
    for (var i = 0; i < index; i++) {
      ImageNormalModel imageNormalModel = widget.imageModellist[i];
      jumptoheight = jumptoheight + (imageNormalModel.size?.height ?? 0);
    }
    return jumptoheight;
  }

  /// 对外公开跳转到指定的下标
  configLongImageSjumpToIndex({
    required int index,
  }) {
    double jumpH = configScrollerJumpToHeight(index: index);
    if (index == num - 1) {
      jumpH = scrollController.position.maxScrollExtent;
    }
    isUserScroller = false;
    scrollController.jumpTo(jumpH);
  }

  /// 根据滑动距离，获取当前下标
  configScrollerHeightWithIndex({required double pixels}) {
    double star = currentInfo["star"];
    double end = currentInfo["end"];
    if (pixels > star && pixels <= end) {
      return currentInfo["index"];
    }
    int rIndex = 0;
    for (var element in sizeList) {
      double xStar = element["star"];
      double xEnd = element["end"];
      int xIndex = element["index"];
      if (pixels > xStar && pixels <= xEnd) {
        currentInfo = element;
        rIndex = xIndex;
        break;
      }
    }

    return rIndex;
  }

  updataImageList() {
    setState(() {
      list = createListImage();
    });
  }

  @override
  bool get wantKeepAlive => widget.keepAlive ?? true;
}
