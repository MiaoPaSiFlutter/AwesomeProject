import 'dart:math';

import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:loading_more_list/loading_more_list.dart';

class LoadMoreListSource extends LoadingMoreBase<Map> {
  int pageindex = 1;
  bool _hasMore = true;

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    List<Map> newDatas = [];

    try {
      MpsfResponse resp = await JdService.getTabMineRecommend(pageindex);

      if (pageindex == 1) {
        clear();
      }

      if (!resp.hasError) {
        List historyList = resp.jsonData["cards"] ?? [];
        for (var item in historyList) {
          List labelList = item?["benefits"] ?? [];
          if (labelList.isEmpty) {
            final labels = List.generate(Random().nextInt(5), (i) {
              return {"title": "标签$i"};
            });
            item["benefits"] = labels;
          }
          newDatas.add(item);
        }
        addAll(newDatas);
        _hasMore = newDatas.isNotEmpty;
        pageindex++;
        isSuccess = true;
      } else {
        isSuccess = false;
        print("请求异常 status=${resp.status}");
      }
    } catch (e) {
      isSuccess = false;
      print(e);
    }
    return isSuccess;
  }

  /// 获取底部推荐信息
  Future<List> getRecommendList(int page) async {
    List newDatas = [];

    //执行网络请求
    MpsfResponse resp = await JdService.getTabMineRecommend(page);

    //请求出错时
    if (!resp.hasError) {
      List historyList = resp.jsonData["cards"] ?? [];
      for (var item in historyList) {
        List labelList = item?["benefits"] ?? [];
        if (labelList.isEmpty) {
          final labels = List.generate(Random().nextInt(5), (i) {
            return {"title": "标签$i"};
          });
          item["benefits"] = labels;
        }

        newDatas.add(item);
      }
    }
    return newDatas;
  }
}

class HomeArticlesListPage extends StatefulWidget {
  final Key uniqueKey;
  final int? activeCatId; //当前选择的栏目ID
  final Function? showTopContainer;
  const HomeArticlesListPage(
      {Key? key,
      this.activeCatId,
      this.showTopContainer,
      required this.uniqueKey})
      : super(key: key);

  @override
  State<HomeArticlesListPage> createState() => HomeArticlesListPageState();
}

class HomeArticlesListPageState extends State<HomeArticlesListPage>
    with AutomaticKeepAliveClientMixin {
  late final LoadMoreListSource source = LoadMoreListSource();

  @override
  void dispose() {
    source.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Widget child = ExtendedVisibilityDetector(
        uniqueKey: widget.uniqueKey,
        child: LoadingMoreList<Map>(
          ListConfig<Map>(
            sourceList: source,
            itemBuilder: (context, item, index) {
              return GestureDetector(
                onTap: () {},
                child: RecommendWareItemStyle0(wareInfo: item),
              );
            },
            indicatorBuilder: (context, status) {
              if (status == IndicatorStatus.fullScreenError) {
                return Container(
                  constraints: const BoxConstraints(minHeight: 300),
                  child: const Text("error"),
                );
              } else {
                return null;
              }
            },
          ),
        ));
    return child;
  }

  @override
  void initState() {
    super.initState();
    source.loadData();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    // });
    // _scrollViewController = ScrollController(initialScrollOffset: 0)
    //   ..addListener(() {
    //     // print(_scrollViewController.position.pixels);
    //     // if (_scrollViewController.position.pixels < 10) {
    //     //   widget.showTopContainer == null ? '' : widget.showTopContainer!(0.0);
    //     // } else {
    //     //   widget.showTopContainer == null ? '' : widget.showTopContainer!(-1.0);
    //     // }
    //     // 当滚动到最底部的时候，加载新的数据
    //     if (_scrollViewController.position.pixels ==
    //         _scrollViewController.position.maxScrollExtent) {
    //       //当还有更多数据的时候才会进行加载新数据
    //       if (_haveMore) {
    //         _getListViewList();
    //       }
    //     }
    //   });
    // _getListViewList();
  }

  // @override
  // Widget build(BuildContext context) {
  //   super.build(context);
  //   return CustomScrollView(
  //     physics: const ClampingScrollPhysics(),
  //     slivers: [
  //       SliverMasonryGrid.count(
  //         // 展示几列
  //         crossAxisCount: 1,
  //         // 元素总个数
  //         childCount: _buildArticleList.length,
  //         // 单个子元素
  //         itemBuilder: (BuildContext context, int index) {
  //           var item = _buildArticleList[index];
  //           return GestureDetector(
  //             onTap: () {},
  //             child: RecommendWareItemStyle0(wareInfo: item),
  //           );
  //         },
  //       ),
  //       // SliverToBoxAdapter(
  //       //   child: MasonryGridView.count(
  //       //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
  //       //     // controller: _scrollViewController,
  //       //     // 展示几列
  //       //     crossAxisCount: 2,
  //       //     // 元素总个数
  //       //     itemCount: _buildArticleList.length,
  //       //     // 单个子元素
  //       //     itemBuilder: (BuildContext context, int index) {
  //       //       var item = _buildArticleList[index];
  //       //       return GestureDetector(
  //       //         onTap: () {},
  //       //         child: RecommendWareItemStyle0(wareInfo: item),
  //       //       );
  //       //     },
  //       //     // 纵向元素间距
  //       //     mainAxisSpacing: 10,
  //       //     // 横向元素间距
  //       //     crossAxisSpacing: 10,
  //       // //本身不滚动，让外面的singlescrollview来滚动
  //       // physics: const NeverScrollableScrollPhysics(),
  //       //     shrinkWrap: true, //收缩，让元素宽度自适应
  //       //   ),
  //       // ),
  //       SliverToBoxAdapter(
  //         key: footerGlobalKey,
  //         child: createFooter(),
  //       )
  //     ],
  //   );
  // }

  // Widget createFooter() {
  //   if (!_isOver) {
  //     return Container(
  //         padding: const EdgeInsets.only(top: 10, bottom: 10),
  //         child: const Center(child: CupertinoActivityIndicator()));
  //   } else {
  //     if (_haveMore) {
  //       return const Center(child: Text(""));
  //     } else {
  //       return Container(
  //           padding: const EdgeInsets.only(top: 10, bottom: 10),
  //           child: const Center(child: Text("加载完毕")));
  //     }
  //   }
  // }

  // @override
  // void dispose() {
  //   _scrollViewController.dispose();
  //   super.dispose();
  // }
}

class RecommendWareItemStyle0 extends StatelessWidget {
  final Map? wareInfo;

  const RecommendWareItemStyle0({Key? key, this.wareInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // NavigatorUtil.push(context, ProductRouter.product);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.red, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _createImageView(),
              _createWnameView(),
              _createLabelListView(),
              _createPriceView(),
              // _createPlusPriceView(),
            ],
          ),
        ),
      ),
    );
  }

  ///图片
  Widget _createImageView() {
    String imageurl = wareInfo?["imageUrl"] ?? "";
    return AspectRatio(
      aspectRatio: 1,
      child: CommonExtendedImageWidget.netWorkImget(url: imageurl),
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
        text: TextSpan(style: FontConfig().fontMedium14Black, children: [
          // WidgetSpan(
          //   alignment: PlaceholderAlignment.middle,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(4),
          //     child: Container(
          //       padding:
          //           const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
          //       decoration: const BoxDecoration(
          //         gradient: LinearGradient(
          //           colors: [Color(0xFFFF0033), Color(0xFFFF3333)],
          //           begin: Alignment.centerLeft,
          //           end: Alignment.centerRight,
          //         ),
          //       ),
          //       child: Text("自营", style: FontConfig().fontMedium12White),
          //     ),
          //   ),
          // ),
          TextSpan(text: (wname), style: FontConfig().fontMedium14Black),
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
                // border: Border.all(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                labelTitle,
                style: const TextStyle(fontSize: 10, color: Colors.red),
              ),
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
            "￥$jdPrice",
            style: const TextStyle(fontSize: 15, color: Colors.red),
          ),
        ],
      ),
    );
  }

  ///价格
  Widget _createPlusPriceView() {
    bool isPlusWare = wareInfo?["isPlusWare"] ?? false;
    String jdPrice = wareInfo?["jdPrice"] ?? "";
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
                  text: jdPrice,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: CommonExtendedImageWidget.netWorkImget(
                      url: priceIcon, height: 9),
                ),
              ]),
            ),
          ],
        ),
      );
    }
  }
}
