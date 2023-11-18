import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../vm/discover_viewmodel.dart';
import '../widgets/follow_view.dart';
import '../widgets/recommend_view.dart';
import '../widgets/tribe_view.dart';

class MpsfDiscoverPage extends StatefulWidget {
  const MpsfDiscoverPage({Key? key}) : super(key: key);

  @override
  State createState() => _MpsfDiscoverPageState();
}

class _MpsfDiscoverPageState extends State<MpsfDiscoverPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  PageController? _pageController;
  final _modelVM = DiscoverViewModel();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _modelVM.selectIndex);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<DiscoverViewModel>(
      model: _modelVM,
      onReady: (model) {
        model.getPageDatas();
      },
      builder: (context, model, _) {
        return MultiStateWidget(
          state: model.state,
          builder: (context) {
            return Column(
              children: [
                _buildNavigationBar(),
                Expanded(
                  child: PageView(
                    onPageChanged: (int index) {
                      model.updateCVS(selectIndex_: index);
                    },
                    controller: _pageController,
                    children: const [
                      FollowView(),
                      RecommendView(),
                      TribeView(),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildNavigationBar() {
    List datas = ["关注", "推荐", "部落"];
    return Container(
      height: MediaQuery.of(context).padding.top + 44,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        children: [
          Consumer<DiscoverViewModel>(
            builder: (context, model, _) {
              return Row(
                children: datas.map((e) {
                  int index = datas.indexOf(e);
                  return InkWell(
                    onTap: () {
                      model.updateCVS(selectIndex_: index);
                      _pageController?.jumpToPage(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        e,
                        style: TextStyle(
                          fontSize: model.selectIndex == index ? 20 : 17,
                          color: model.selectIndex == index
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
