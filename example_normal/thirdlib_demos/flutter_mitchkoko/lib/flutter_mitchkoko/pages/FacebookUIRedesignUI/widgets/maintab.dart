import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:badges/badges.dart' as badges;
import '../pages/friends_page.dart';
import '../pages/home_page.dart';
import '../pages/market_page.dart';
import '../pages/message_page.dart';
import '../pages/notification_page.dart';
import '../pages/video_page.dart';
import 'home/mydrawer.dart';

class MainTab extends StatefulWidget {
  MainTab({Key? key}) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> topTabs = <Tab>[
    const Tab(icon: Icon(Icons.home_outlined)),
    const Tab(icon: Icon(Icons.people_outlined)),
    const Tab(icon: Icon(Icons.message_outlined)),
    Tab(
      icon: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -20, end: -5),
        badgeContent: const Text("3",
            style: TextStyle(fontSize: 18, color: Colors.white)),
        child: const Icon(Icons.notifications_outlined),
      ),
    ),
    const Tab(icon: Icon(Icons.video_library_outlined)),
    const Tab(icon: Icon(Icons.shopping_bag_outlined)),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: topTabs.length, initialIndex: 0, vsync: this)
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  Future<bool> _onWillPop() async {
    print("on will pop");
    if (_tabController?.index == 0) {
      await SystemNavigator.pop();
    }

    Future.delayed(const Duration(milliseconds: 200), () {
      print('Set Index');
      _tabController?.index = 0;
    });

    print("Return");
    return _tabController?.index == 0;
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'facebook',
            style: TextStyle(
              fontFamily: 'Klavika',
              fontSize: 34,
              color: Colors.blue[700],
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: IconButton(
                icon: const Icon(Icons.search),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  print('Search Button Clicked');
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: IconButton(
                icon: const Icon(Icons.menu),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            tabs: topTabs,
          ),
        ),
        endDrawer: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          child: MyDrawer(),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            HomePage(),
            FriendsPage(),
            MessagePage(),
            NotificationPage(),
            VideoPage(),
            MarketPage(),
          ],
        ),
      ),
    );
  }
}
