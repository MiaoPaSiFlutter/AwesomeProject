import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';

class Q_NestedScrollView001 extends StatefulWidget {
  Q_NestedScrollView001({Key? key}) : super(key: key);

  @override
  State<Q_NestedScrollView001> createState() => _Q_NestedScrollView001State();
}

class _Q_NestedScrollView001State extends State<Q_NestedScrollView001> {
  @override
  Widget build(BuildContext context) {
    return Answer();
    // return Question();
  }
}

/*
问题描述：
列表的第一个 Item 会滚动到 Header1 下面。但实际上，我们通常的需求是需要列
表停留在 Header1 底边。
*/
class Question extends StatefulWidget {
  Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              height: 100,
              color: Colors.yellow.withOpacity(0.4),
              child: const Text('Header0: 100高度'),
            ),
          ),
          SliverPinnedToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              height: 100,
              color: Colors.red.withOpacity(0.4),
              child: const Text('Header1: Pinned 100高度'),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              height: 100,
              color: Colors.yellow.withOpacity(0.4),
              child: const Text('Header2: 100高度'),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: List.generate(
                  100,
                  (index) => Container(
                        alignment: Alignment.topCenter,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.4),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Text('body: 里面的内容$index,高度100'),
                      )),
            ),
          )
        ],
      ),
    );
  }
}

class Answer extends StatefulWidget {
  Answer({Key? key}) : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            // 监听计算高度，并且通过 NestedScrollView._absorberHandle 将
            // 自身的高度 告诉 SliverOverlapInjector
            SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverPinnedToBoxAdapter(
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    color: Colors.red.withOpacity(0.4),
                    child: const Text('Header: Pinned 100高度'),
                  ),
                ))
          ];
        },
        body: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              // The "controller" and "primary" members should be left
              // unset, so that the NestedScrollView can control this
              // inner scroll view.
              // If the "controller" property is set, then this scroll
              // view will not be associated with the NestedScrollView.
              slivers: <Widget>[
                // 占位，接收 SliverOverlapAbsorber 的信息
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverFixedExtentList(
                  itemExtent: 48.0,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) =>
                        ListTile(title: Text('Item $index')),
                    childCount: 30,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
