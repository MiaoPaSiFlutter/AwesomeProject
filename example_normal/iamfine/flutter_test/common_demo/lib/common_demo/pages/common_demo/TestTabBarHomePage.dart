import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestTabBarHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SliderHomePageState();
  }
}

class SliderHomePageState extends State with SingleTickerProviderStateMixin {
  ///Tab 与 TabView 联动使用的控制器
  late TabController tabController;
  //当前显示页面的
  int currentIndex = 0;
  //点击导航项是要显示的页面
  final pages = [
    const Text("首页"),
    const Text("发现"),
    const Text("动态"),
    const Text("我的")
  ];

  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次
    super.initState();
    tabController = TabController(length: pages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试 Tab "),
        bottom: buildPreferredSize(),
      ),
      body: TabBarView(controller: tabController, children: pages),
    );
  }

  PreferredSize buildPreferredSize() {
    return PreferredSize(
      preferredSize: const Size(0, 84),
      child: buildTheme(),
    );
  }

  Widget buildTabBar() {
    return TabBar(
      controller: tabController,
      tabs: const <Tab>[
        Tab(text: "首页", icon: Icon(Icons.home)),
        Tab(text: "发现", icon: Icon(Icons.find_in_page)),
        Tab(text: "动态", icon: Icon(Icons.message)),
        Tab(text: "我的", icon: Icon(Icons.person)),
      ],
      indicatorWeight: 0.1,
    );
  }

  Widget testCustomTabBar() {
    return CustomTabBar(
      controller: tabController,
    );
  }

  Theme buildTheme() {
    return Theme(
      data: ThemeData(
        ///默认显示的背影颜色
        backgroundColor: Colors.blue[500],

        ///点击的高亮颜色
        highlightColor: Colors.blueGrey[600],

        ///水波纹颜色
        splashColor: const Color.fromRGBO(0, 0, 0, 0),
      ),
      child: TabBar(
        controller: tabController,
        tabs: const <Tab>[
          Tab(text: "首页", icon: Icon(Icons.home)),
          Tab(text: "发现", icon: Icon(Icons.find_in_page)),
          Tab(text: "动态", icon: Icon(Icons.message)),
          Tab(text: "我的", icon: Icon(Icons.person)),
        ],
        indicatorWeight: 0.1,
      ),
    );
  }
}

class CustomTabBar extends StatefulWidget {
  final TabController controller;

  const CustomTabBar({required this.controller, Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        ///默认显示的背影颜色
        backgroundColor: Colors.blue[500],

        ///点击的高亮颜色
        highlightColor: Colors.blueGrey[600],

        ///水波纹颜色
        splashColor: const Color.fromRGBO(0, 0, 0, 0),
      ),
      child: TabBar(
        controller: widget.controller,
        tabs: const <Tab>[
          Tab(text: "首页", icon: Icon(Icons.home)),
          Tab(text: "发现", icon: Icon(Icons.find_in_page)),
          Tab(text: "动态", icon: Icon(Icons.message)),
          Tab(text: "我的", icon: Icon(Icons.person)),
        ],
        indicatorWeight: 0.1,
      ),
    );
  }
}
