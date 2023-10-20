import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';

import 'compontents/ListViewTabWidget.dart';
import 'compontents/WaterfallFlowTabWidget.dart';
import 'view_model.dart';

class SecondaryTabView extends StatefulWidget {
  const SecondaryTabView(this.tabKey);

  final String tabKey;

  @override
  _SecondaryTabViewState createState() => _SecondaryTabViewState();
}

class _SecondaryTabViewState extends State<SecondaryTabView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // CarefullyChosenWidgetViewModel vm =
    //     Provider.of<CarefullyChosenWidgetViewModel>(context, listen: false);
    return Consumer<CarefullyChosenWidgetViewModel>(
        builder: (context, vm, child) {
      _controller ??= TabController(
          initialIndex: vm.selectIndex, length: vm.tabList.length, vsync: this);

      return Column(
        children: <Widget>[
          JdCommonSegmentWidget(
            controller: _controller,
            items: vm.tabList.map((e) {
              int index = vm.tabList.indexOf(e);
              Map itemInfo = vm.tabList[index];
              String text = HyzyTextTools.mpsfStr(itemInfo["firstTabName"]);
              return text;
            }).toList(),
            onTap: (index) {
              vm.updateSelectIndex(index);
            },
          ),
          Expanded(
            child: TabBarView(
                controller: _controller,
                children: vm.tabList.map((e) {
                  int index = vm.tabList.indexOf(e);
                  Map tabInfo = vm.tabList[index];
                  if (index == 0) {
                    return WaterfallFlowTabWidget(
                        Key('${widget.tabKey}$index'), tabInfo);
                  } else {
                    return ListViewTabWidget(Key('${widget.tabKey}$index'));
                  }
                }).toList()),
          ),
        ],
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
