import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/10/31.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单 下拉刷新 RefreshIndicator

class PullToRefreshDemo5 extends StatefulWidget {
  const PullToRefreshDemo5({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PullToRefreshDemo5> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream =
      Stream<int>.periodic(const Duration(seconds: 3), (x) => refreshNum);

  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  static final List<String> _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N'
  ];

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      refreshNum = Random().nextInt(100);
    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState!.show();
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Stack(
          children: <Widget>[
            const Align(
              alignment: Alignment(-1.0, 0.0),
              child: Icon(Icons.reorder),
            ),
            Align(
              alignment: const Alignment(-0.3, 0.0),
              child: Text(widget.title ?? ''),
            ),
          ],
        ),
      ),
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        child: StreamBuilder<int>(
          stream: counterStream,
          builder: (context, snapshot) {
            return ListView.builder(
              padding: kMaterialListPadding,
              itemCount: _items.length,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                final String item = _items[index];
                return ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(child: Text(item)),
                  title: Text('This item represents $item.'),
                  subtitle: Text(
                      'Even more additional list item information appears on line three. ${snapshot.data}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
