// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import '../../../tools/tools_index.dart';
import '../vm/jingxuan_viewmodel.dart';

class JingXuanFeedView extends StatefulWidget {
  ScrollController controller;
  final Map tabInfo;
  void Function(bool canScroll) changeParentScroll;
  JingXuanFeedView({
    Key? key,
    required this.controller,
    required this.tabInfo,
    required this.changeParentScroll,
  }) : super(key: key);

  @override
  State createState() => _JingXuanFeedViewState();
}

class _JingXuanFeedViewState extends State<JingXuanFeedView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final ScrollController _scrollController = ScrollController();
  ScrollPhysics? _physics = const NeverScrollableScrollPhysics();
  final double _lastOffSet = 0;
  List _floors = [];
  AsyncSnapshot _snapshot = const AsyncSnapshot.nothing();
  AsyncSnapshot? _snapshotFooter;
  int _pageIndex = 1;
  bool _isRequseting = false;
  bool _hasMore = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //监听外部滚动
      widget.controller.addListener(() {
        double offSetMax =
            Provider.of<JingXuanViewModel>(context, listen: false).offSetMax;
        double offset = widget.controller.position.pixels;
        double abs = offset - offSetMax;
        if (offset >= offSetMax && abs < 10.0) {
          if (mounted) {
            setState(() {
              _physics = null;
            });
          }
        } else {
          if (mounted) {
            setState(() {
              _physics = const NeverScrollableScrollPhysics();
            });
          }
        }
      });

      //监听内部滚动
      _scrollController.addListener(() {
        double offset = _scrollController.position.pixels;
        print("内部CustomScrollView offset $offset");
        if (offset > _lastOffSet) {
          //下滑
          widget.changeParentScroll(false);
          if (mounted) {
            setState(() {
              _physics = null;
            });
          }
        } else {
          //上滑
          if (offset == 0) {
            widget.changeParentScroll(true);
            if (mounted) {
              setState(() {
                _physics = const NeverScrollableScrollPhysics();
              });
            }
          } else {
            widget.changeParentScroll(false);
            if (mounted) {
              setState(() {
                _physics = null;
              });
            }
          }
        }

        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          if (!_isRequseting && _hasMore) {
            loadNextPageData();
          }
        }
      });
    });

    loadFirstPageData();
  }

  //////加载第一页数据
  loadFirstPageData() {
    _snapshot = const AsyncSnapshot.waiting();
    setState(() {});

    _pageIndex = 1;
    JdService.getTabProductsList(_pageIndex, widget.tabInfo)
        .then((MpsfResponse resp) {
      if (resp.isOk == false) {
        _snapshot = AsyncSnapshot.withError(
            ConnectionState.done, "第$_pageIndex页数据获取失败");
      } else {
        _floors = resp.jsonData["result"]?["list"] ?? [];
        if (_floors.isEmpty) {
          _hasMore = false;
          _snapshot = const AsyncSnapshot.withData(ConnectionState.done, 0);
        } else {
          _hasMore = true;
          _snapshot = const AsyncSnapshot.withData(ConnectionState.done, 1);
          _pageIndex++;
        }
      }
      setState(() {});
    });
  }

  //////加载下一页数据
  loadNextPageData() {
    _isRequseting = true;
    setState(() {});

    JdService.getTabProductsList(_pageIndex, widget.tabInfo)
        .then((MpsfResponse resp) {
      if (resp.isOk == false) {
        _snapshotFooter = AsyncSnapshot.withError(
            ConnectionState.done, "第$_pageIndex页数据获取失败");
      } else {
        List list = resp.jsonData["result"]?["list"] ?? [];
        _floors.addAll(list);
        if (list.isEmpty) {
          _hasMore = false;
        } else {
          _hasMore = true;
          _pageIndex++;
        }
      }

      _isRequseting = false;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget child = Container();
    if (_snapshot.connectionState == ConnectionState.waiting) {
      child = const Center(child: CupertinoActivityIndicator());
    } else {
      if (_snapshot.hasError) {
        child = InkWell(
          child: Center(
            child: Text('Error: ${_snapshot.error}'),
          ),
          onTap: () {
            loadFirstPageData();
          },
        );
      } else if (_snapshot.hasData && _snapshot.data == 0) {
        child = const Center(child: Text('第一页数据为空'));
      } else if (_snapshot.hasData && _snapshot.data == 1) {
        child = _buildNormalView();
      }
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
        color: const Color(0xFFEEEEEE),
      ),
      child: child,
    );
  }

  Widget _buildNormalView() {
    return CustomScrollView(
      physics: _physics,
      shrinkWrap: true,
      controller: _scrollController,
      slivers: <Widget>[
        SliverWaterfallFlow(
          gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0, //上下item间距
            crossAxisSpacing: 5.0, //左右item间距
            lastChildLayoutTypeBuilder: (index) => index == _floors.length
                ? LastChildLayoutType.foot
                : LastChildLayoutType.none,
          ),
          delegate: SliverChildBuilderDelegate(
            childCount: _floors.length,
            (BuildContext c, int index) {
              Map itemData = _floors[index];
              return RecommendWareItem_0(wareInfo: itemData);
            },
          ),
        ),
        _buildFooterView(),
      ],
    );
  }

  Widget _buildFooterView() {
    Widget child = Container();
    if (_isRequseting) {
      child = const CupertinoActivityIndicator();
    } else if (!_hasMore) {
      child = const Text('~~~没有更多了~~~');
    } else if (_snapshotFooter != null && _snapshotFooter!.hasError) {
      child = Text('Error: ${_snapshotFooter!.error}');
    } else {
      child = const CupertinoActivityIndicator();
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (context, index) {
          return Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.transparent),
            ),
            child: Center(child: child),
          );
        },
      ),
    );
  }
}

class RecommendWareItem_0 extends StatelessWidget {
  final Map? wareInfo;
  const RecommendWareItem_0({Key? key, this.wareInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // currentToPage(CommonPageId.PRODUCT);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _createImageView(),
              _createWnameView(),
              _createLabelListView(),
              // _createPriceView(),
              // _createPlusPriceView(),
            ],
          ),
        ),
      ),
    );
  }

  ///图片
  Widget _createImageView() {
    String imageurl = wareInfo?["skuImg"] ?? "";
    return AspectRatio(
      aspectRatio: 1,
      child: CommonExtendedImageWidget.configImage(imageUrl: imageurl),
    );
  }

  ///商品名
  Widget _createWnameView() {
    String wname = wareInfo?["skuName"] ?? "";
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            style: const TextStyle(color: Colors.white, fontSize: 13),
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 2, bottom: 2),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF0033), Color(0xFFFF3333)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: const Text(
                      "自营",
                      style: TextStyle(color: Colors.white, fontSize: 9),
                    ),
                  ),
                ),
              ),
              TextSpan(
                  text: HyzyTextTools.mpsfStr(wname),
                  style: const TextStyle(color: Colors.black))
            ]),
      ),
    );
  }

  ///标签
  Widget _createLabelListView() {
    List labelList = wareInfo?["benefits"] ?? [];
    if (labelList.isEmpty) {
      return Container();
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 5),
        child: Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.start, //沿主轴方向居中
          children: labelList.map((e) {
            String labelTitle = e["title"] ?? "免息";
            return Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(labelTitle,
                  style: const TextStyle(fontSize: 10, color: Colors.red)),
            );
          }).toList(),
        ),
      );
    }
  }

  ///价格
  Widget _createPriceView() {
    String jdPrice = wareInfo?["jdPrice"] ?? "";
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "￥${HyzyTextTools.mpsfStr(jdPrice)}",
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  ///价格
  Widget _createPlusPriceView() {
    bool isPlusWare = wareInfo?["isPlusWare"] ?? false;
    String tryPlusPrice = wareInfo?["tryPlusPrice"] ?? "";
    String priceIcon = wareInfo?["priceIcon"] ?? "";

    if (!isPlusWare) {
      return Container();
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 5),
        child: Wrap(
          children: <Widget>[
            RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(children: <InlineSpan>[
                const TextSpan(
                  text: '￥',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
                TextSpan(
                  text: HyzyTextTools.mpsfStr(tryPlusPrice),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: CommonExtendedImageWidget.configImage(
                    imageUrl: priceIcon,
                    height: 9,
                  ),
                ),
              ]),
            ),
          ],
        ),
      );
    }
  }
}
