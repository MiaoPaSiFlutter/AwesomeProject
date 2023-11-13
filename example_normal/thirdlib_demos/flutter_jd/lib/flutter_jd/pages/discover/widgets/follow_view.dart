import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'package:waterfall_flow/waterfall_flow.dart';
import '../vm/follow_viewmodel.dart';

class FollowView extends StatefulWidget {
  const FollowView({Key? key}) : super(key: key);

  @override
  State createState() => _FollowViewState();
}

class _FollowViewState extends State<FollowView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _modelVM = FollowViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      print("  页面渲染完毕");
      //监听滚动事件，打印滚动位置
      _modelVM.scrollController.addListener(() {
        if (_modelVM.scrollController.position.pixels ==
            _modelVM.scrollController.position.maxScrollExtent) {
          // if (!_model.requesting && !_model.noMore) {
          //   _model.addMoreData();
          // }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<FollowViewModel>(
      model: _modelVM,
      onReady: (model) {
        model.refreshData();
      },
      builder: (context, model, widget) {
        return MultiStateWidget(
          state: model.state,
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.red),
                color: const Color(0xFFEEEEEE),
              ),
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: _buildEasyRefreshView(),
            );
          },
        );
      },
    );
  }

  ///////////////////////
  /////////////////////// EasyRefresh
  ///////////////////////
  Widget _buildEasyRefreshView() {
    return JdCommonEasyRefresh(
      controller: _modelVM.controller,
      onRefresh: _modelVM.refreshData,
      onLoad: _modelVM.addMoreData,
      child: _buildEasyRefreshViewChild(),
    );
  }

  Widget _buildEasyRefreshViewChild() {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverToBoxAdapter(
          child: LiveWallView(),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 12),
          sliver: SliverWaterfallFlow(
            gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 10,
              lastChildLayoutTypeBuilder: (index) =>
                  index == _modelVM.floors.length
                      ? LastChildLayoutType.foot
                      : LastChildLayoutType.none,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: _modelVM.floors.length,
              (BuildContext c, int index) {
                if (_modelVM.floors.isNotEmpty &&
                    index < _modelVM.floors.length) {
                  Map itemData = _modelVM.floors[index];
                  return RecommendWareItem_0(wareInfo: itemData);
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class LiveWallView extends StatelessWidget {
  const LiveWallView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 100,
        color: Colors.white,
        child: Consumer<FollowViewModel>(
          builder: (context, model, _) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model.liveList.length,
              itemBuilder: (context, index) {
                Map info = model.liveList[index];
                String userPic = info["userPic"] ?? "";
                String userName = info["userName"] ?? "";
                return Container(
                  width: 80,
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      CommonExtendedImageWidget.netWorkImget(url: userPic),
                      Text(userName,
                          maxLines: 1, style: const TextStyle(fontSize: 10)),
                    ],
                  ),
                );
              },
            );
          },
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
        // NavigatorUtil.push(context, ProductRouter.product);
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
              _createHeaderView(),
              _createTitleView(),
              _createMediaView(),
              _createToolView(),
              // _createLabelListView(),
              // _createPriceView(),
              // _createPlusPriceView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createHeaderView() {
    String pic = wareInfo?["authorInfo"]?["pic"] ?? "";
    String nickName = wareInfo?["authorInfo"]?["nickName"] ?? "";
    return Row(
      children: [
        CommonExtendedImageWidget.netWorkImget(url: pic, height: 40),
        Expanded(
          child: Row(
            children: [
              Text(
                nickName,
                maxLines: 1,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        )
      ],
    );
  }

  ///商品名
  Widget _createTitleView() {
    String title = wareInfo?["title"] ?? "";
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            style: const TextStyle(color: Colors.white, fontSize: 13),
            children: [
              TextSpan(
                  text: HyzyTextTools.mpsfStr(title),
                  style: const TextStyle(color: Colors.black)),
            ]),
      ),
    );
  }

  ///商品名
  Widget _createMediaView() {
    //229x344
    String imgUri = wareInfo?["imgUri"] ?? "";
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
          width: 160,
          child: CommonExtendedImageWidget.netWorkImget(url: imgUri)),
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
  Widget _createToolView() {
    int likeNum = wareInfo?["likeNum"] ?? 0;
    int commentNum = wareInfo?["commentNum"] ?? 0;
    int seeNum = wareInfo?["seeNum"] ?? 0;
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: null,
            child: Row(
              children: [
                Image.asset(
                  NormalModuleUtils.configPackagesImage(
                    packagename: 'flutter_jd',
                    name: "assets/images/discover/jdfa_see_light_Normal.png",
                  ),
                  width: 15,
                ),
                Text(" $seeNum", style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: null,
                  child: Row(
                    children: [
                      Image.asset(
                        NormalModuleUtils.configPackagesImage(
                          packagename: 'flutter_jd',
                          name:
                              "assets/images/discover/jdfa_like_light_Normal.png",
                        ),
                        width: 15,
                      ),
                      Text(" $likeNum", style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: null,
                  child: Row(
                    children: [
                      Image.asset(
                        NormalModuleUtils.configPackagesImage(
                          packagename: 'flutter_jd',
                          name:
                              "assets/images/discover/jdfa_comm_light_Normal.png",
                        ),
                        width: 15,
                      ),
                      Text(" $commentNum",
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          )
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
                  child: CommonExtendedImageWidget.netWorkImget(
                    url: priceIcon,
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
