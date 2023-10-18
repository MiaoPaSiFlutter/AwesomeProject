import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class JdFloorStyleappcenter extends StatefulWidget {
  final Map? floor;

  const JdFloorStyleappcenter({Key? key, this.floor}) : super(key: key);

  @override
  State createState() => _JdFloorStyleappcenterState();
}

class _JdFloorStyleappcenterState extends State<JdFloorStyleappcenter> {
  final int _row = 2;
  final int _clo = 5;
  final int _itemsOnPage = 10;
  int _totalPages = 0;
  List _totalPagesData = [];

  double _itemW = 0;
  double _itemH = 0;

  final _controller = PageController();

  static const _kDuration = Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
    _configDatas();
  }

  /////////////🔥构造数据
  _configDatas() {
    _totalPages = 0;
    _totalPagesData.clear();

    List data = widget.floor?["content"]?["data"] ?? [];

    ///计算
    _totalPages = HzyNormalTools.getPageCount(data.length, _itemsOnPage);
    //分割数组
    _totalPagesData = HzyNormalTools.splitList(data, _itemsOnPage);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _itemW = screenSize.width / _clo;
    _itemH = _itemW * 0.5 + 30;
    double height = _itemH * _row + 10;

    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
        color: Colors.grey[300],
      ),
      child: Stack(
        children: <Widget>[
          PageView(
            scrollDirection: Axis.horizontal,
            reverse: false,
            controller: _controller,
            physics: const AlwaysScrollableScrollPhysics(),
            pageSnapping: true,
            onPageChanged: (index) {
              //监听事件
              print('index=====$index');
            },
            children: _createPages(),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: DotsIndicator(
                  controller: _controller,
                  itemCount: _totalPages,
                  onPageSelected: (int page) {
                    _controller.animateToPage(
                      page,
                      duration: _kDuration,
                      curve: _kCurve,
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _createPages() {
    List<Widget> pageWiget = _totalPagesData.map((item) {
      return GridView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true, //解决无限高度问题
        physics: const NeverScrollableScrollPhysics(), //禁用滑动事件
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _clo, //每行数量
            mainAxisSpacing: 0.0, //主轴(竖直)方向间距
            crossAxisSpacing: 0.0, //纵轴(水平)方向间距
            childAspectRatio: _itemW / _itemH //纵轴缩放比例
            ),
        itemCount: item.length,
        itemBuilder: (BuildContext context, int index) {
          return ListItemWidget(
            listItem: item[index],
            width: _itemW,
            height: _itemH,
          );
        },
      );
    }).toList();
    return pageWiget;
  }
}

class ListItemWidget extends StatelessWidget {
  final Map? listItem;
  final double? width;
  final double? height;
  const ListItemWidget({required this.listItem, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CommonExtendedImageWidget.netWorkImget(
                url: listItem?["icon"] ?? "",
                width: width! * 0.5,
                height: width! * 0.5),
            SizedBox(
              height: 24,
              child: Text(listItem!["name"] ?? "",
                  style: const TextStyle(color: Colors.black, fontSize: 12)),
            )
          ],
        ),
      ),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(listItem?["name"] ?? ""),
        ));
      },
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color = Colors.black,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 5.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2;

  // The distance between the center of each dot
  static const double _kDotSpacing = 15.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return SizedBox(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: color,
          child: SizedBox(
            width: _kDotSize * zoom,
            height: 2 * zoom,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(itemCount, _buildDot),
      ),
    );
  }
}
