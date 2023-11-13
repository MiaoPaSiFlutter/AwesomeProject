import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter_jd/flutter_jd/pages/news/vm/news_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

import 'SecondaryTabView.dart';
import 'news_carousel_view.dart';
import 'view_model.dart';

class CarefullyChosenWidget extends StatefulWidget {
  const CarefullyChosenWidget({Key? key}) : super(key: key);

  @override
  State createState() => _CarefullyChosenWidgetState();
}

class _CarefullyChosenWidgetState extends State<CarefullyChosenWidget>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _modelVM = CarefullyChosenWidgetViewModel();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //监听列表滚动
      _scrollController.addListener(() {
        _updateAppBarAlpha();
      });
    });
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
    dPrint(offset);
    // final model = Provider.of<CarefullyChosenWidgetModel>(context);
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
        _modelVM.getPageDatas().then((value) {});
      },
      child: Consumer<CarefullyChosenWidgetViewModel>(
        builder: (context, value, child) {
          return MultiStateWidget(
            state: _modelVM.state,
            builder: (context) {
              return Scaffold(
                body: _buildScaffoldBody(),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildScaffoldBody() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return ExtendedNestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext c, bool f) {
        return _buildSliverHeader();
      },
      //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
      pinnedHeaderSliverHeightBuilder: () {
        return pinnedHeaderHeight;
      },
      //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
      onlyOneScrollInBody: true,
      body: const Column(
        children: <Widget>[Expanded(child: SecondaryTabView('Tab0'))],
      ),
    );
  }

  List<Widget> _buildSliverHeader() {
    final List<Widget> widgets = <Widget>[];

    // widgets.add(
    //   SliverAppBar(
    //     pinned: true,
    //     expandedHeight: 200.0,
    //     //title: Text(old ? 'old demo' : 'new demo'),
    //     flexibleSpace: FlexibleSpaceBar(
    //       //centerTitle: true,
    //       collapseMode: CollapseMode.pin,
    //       background: Image.asset(
    //           NormalModuleUtils.configPackagesImage(
    //               packagename: 'scrollerview_demo',
    //               name: 'assets/467141054.jpg'),
    //           fit: BoxFit.fill),
    //     ),
    //   ),
    // );
    widgets.add(SliverList(
      delegate: SliverChildBuilderDelegate(childCount: 1, (context, index) {
        return const NewsCarouselView();
      }),
    ));
    widgets.add(
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              height: 60.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 1.0)),
              child: Text('Gird$index'),
            );
          },
          childCount: 7,
        ),
      ),
    );

    widgets.add(
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext c, int i) {
            return Container(
              alignment: Alignment.center,
              height: 60.0,
              child: Text('SliverList$i'),
            );
          },
          childCount: 3,
        ),
      ),
    );

//  widgets.add(SliverPersistentHeader(
//      pinned: true,
//      floating: false,
//      delegate: CommonSliverPersistentHeaderDelegate(
//          Container(
//            child: primaryTabBar,
//            //color: Colors.white,
//          ),
//          primaryTabBar.preferredSize.height)));
    return widgets;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
