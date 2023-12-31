import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/10/31.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单 下拉刷新 RefreshIndicator

///下拉刷新组件
class PullToRefreshDemo4 extends StatefulWidget {
  const PullToRefreshDemo4({super.key});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<PullToRefreshDemo4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("下拉刷新"),
      ),
      //下拉刷新组件
      body: RefreshIndicator(
        //圆圈进度颜色
        color: Colors.blue,
        //下拉停止的距离
        displacement: 44.0,
        //背景颜色
        backgroundColor: Colors.grey[200],
        onRefresh: () async {
          //模拟网络请求
          await Future.delayed(const Duration(milliseconds: 2000));
          //结束刷新
          return Future.value(true);
        },
        //一个列表
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 66,
              child: const Text("测试数据"),
            );
          },
          //列表数据源数量
          itemCount: 100,
        ),
      ),
    );
  }
}
