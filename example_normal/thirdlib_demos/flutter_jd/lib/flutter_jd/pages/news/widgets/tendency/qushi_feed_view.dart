import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_jd/flutter_jd.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import '../../vm/news_viewmodel.dart';
import 'qushi_viewmodel.dart';

class QuShiFeedView extends StatefulWidget {
  final Map info;
  const QuShiFeedView({Key? key, required this.info}) : super(key: key);

  @override
  State createState() => _QuShiFeedViewState();

  static GlobalKey<_QuShiFeedViewState> createGlobalKey() {
    GlobalKey<_QuShiFeedViewState> globalKey = GlobalKey();
    return globalKey;
  }
}

class _QuShiFeedViewState extends State<QuShiFeedView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final ScrollController _scrollController = ScrollController();
  List _floors = [];
  int crossAxisCount = 2;
  double crossAxisSpacing = 5.0;
  double mainAxisSpacing = 5.0;
  List<Color> colors = <Color>[];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //监听滚动事件，打印滚动位置
      _scrollController.addListener(() {
        double offset = _scrollController.position.pixels;
        print("内部CustomScrollView offset $offset");
        double alpha = offset / (MediaQuery.of(context).padding.top + 44);
        if (alpha < 0) {
          alpha = 0;
        } else if (alpha > 1) {
          alpha = 1;
        }
        // final model = Provider.of<JingXuanViewModel>(context);
        Provider.of<NewsViewModel>(context, listen: false)
            .updateAppBarAlpha(alpha);
      });
    });

    JdService.getTabProductsList(1, {"id": 1}).then((resp) {
      _floors = resp.jsonData["result"]?["list"] ?? [];
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Color getRandomColor(int index) {
    if (index >= colors.length) {
      colors.add(Color.fromARGB(255, Random.secure().nextInt(255),
          Random.secure().nextInt(255), Random.secure().nextInt(255)));
    }
    return colors[index];
  }

  childFunction() {
    print('this is a childFunction 子组件方法被调用');
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 1), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          // SliverGrid.count(
          //   crossAxisCount: 4,
          //   children: List.generate(8, (index) {
          //     return Container(
          //       color: Colors.primaries[index % Colors.primaries.length],
          //       alignment: Alignment.center,
          //       child: Text(
          //         '$index',
          //         style: TextStyle(color: Colors.white, fontSize: 20),
          //       ),
          //     );
          //   }).toList(),
          // ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate((content, index) {
          //     return Container(
          //       height: 85,
          //       alignment: Alignment.center,
          //       color: Colors.primaries[index % Colors.primaries.length],
          //       child: Text(
          //         '$index',
          //         style: TextStyle(color: Colors.white, fontSize: 20),
          //       ),
          //     );
          //   }, childCount: 25),
          // ),
          _buildHeader(),
          _buildRecommendView(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: 1, (content, index) {
        return TrendHeaderView(info: widget.info);
      }),
    );
  }

  Widget _buildRecommendView() {
    return SliverWaterfallFlow(
      gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        lastChildLayoutTypeBuilder: (index) => index == _floors.length
            ? LastChildLayoutType.foot
            : LastChildLayoutType.none,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext c, int index) {
          Map itemData = _floors[index];
          return RecommendWareItem_0(wareInfo: itemData);
        },
        childCount: _floors.length,
      ),
    );
  }
}

class TrendHeaderView extends StatelessWidget {
  final Map info;
  const TrendHeaderView({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //图片尺寸299x344
    String pictureUrl = HyzyTextTools.mpsfStr(info["pictureUrl"]);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / (299 / 344),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NormalModuleUtils.getImageProvider(
              HyzyTextTools.mpsfStr(pictureUrl)),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _headerBuilder(context),
            _orderCardItemBuilder(context),
          ],
        ),
      ),
    );
  }

  Widget _headerBuilder(BuildContext context) {
    Map responseData =
        Provider.of<QuShiViewModel>(context, listen: false).responseData;
    String trendRankToast =
        responseData["result"]?["headResult"]?["trendRankToast"] ?? "";
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      child: Text(
        trendRankToast,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _orderCardItemBuilder(BuildContext context) {
    Map responseData =
        Provider.of<QuShiViewModel>(context, listen: false).responseData;
    List items = responseData["result"]?["headResult"]?["list"] ?? [];
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 150,
      child: ListView.separated(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String skuImage = items[index]["skuImage"] ?? "";
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 100,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                      height: 100,
                      child: CommonExtendedImageWidget.configImage(
                          imageUrl: skuImage)),
                  _createWnameView(items[index]),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }

  ///商品名
  Widget _createWnameView(Map? wareInfo) {
    String wname = wareInfo?["skuName"] ?? "";
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.only(left: 1, right: 1),
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: const TextStyle(color: Colors.white, fontSize: 13),
          children: [
            TextSpan(
                text: HyzyTextTools.mpsfStr(wname),
                style: const TextStyle(color: Colors.black))
          ],
        ),
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
                  style: const TextStyle(color: Colors.black)),
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
