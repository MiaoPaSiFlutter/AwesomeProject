import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_books/flutter_books.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../bookshelf/bookshelf_page.dart';
import '../me/me_page.dart';
import 'home_page.dart';

///@author longshaohua
///小说首页

class MyHomePage extends StatefulWidget {
  static const platform = MethodChannel("samples.flutter.io/permission");

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  int _tabIndex = 0;
  final List<Image> _tabImages = [
    Image.asset(Utils.getImag('images/icon_tab_bookshelf_n.png'),
        width: BooksDimens.homeImageSize, height: BooksDimens.homeImageSize),
    Image.asset(Utils.getImag('images/icon_tab_bookshelf_p.png'),
        width: BooksDimens.homeImageSize, height: BooksDimens.homeImageSize),
    Image.asset(Utils.getImag('images/icon_tab_home_n.png'),
        width: BooksDimens.homeImageSize, height: BooksDimens.homeImageSize),
    Image.asset(Utils.getImag('images/icon_tab_home_p.png'),
        width: BooksDimens.homeImageSize, height: BooksDimens.homeImageSize),
    Image.asset(Utils.getImag('images/icon_tab_me_n.png'),
        width: BooksDimens.homeImageSize, height: BooksDimens.homeImageSize),
    Image.asset(Utils.getImag('images/icon_tab_me_p.png'),
        width: BooksDimens.homeImageSize, height: BooksDimens.homeImageSize),
  ];

  @override
  void initState() {
    super.initState();
//    动态申请相机权限示例，原生部分请查看 Android 下的 MainActivity
    // _getPermission();
    Future.delayed(const Duration(milliseconds: 1000), () {
      showPopDiaLogWidget(context: context, msg: "小说源已不可用，目前仅做参考代码");
    });
  }

  Future<Null> _getPermission() async {
    // final String result =
    //     await MyHomePage.platform.invokeMethod('requestCameraPermissions');
    // print("result=$result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _tabIndex,
        children: <Widget>[
          BookshelfPage(),
          TabHomePage(),
          MePage(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: _getBookshelfImage(0),
            label: "书架",
          ),
          BottomNavigationBarItem(
            icon: _getHomeImage(1),
            label: "书城",
          ),
          BottomNavigationBarItem(
            icon: _getMeImage(2),
            label: "我的",
          ),
        ],
        currentIndex: _tabIndex,
        backgroundColor: BooksColors.white,
        activeColor: BooksColors.homeTabText,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image _getBookshelfImage(int index) {
    if (_tabIndex == index) {
      return _tabImages[1];
    } else {
      return _tabImages[0];
    }
  }

  Image _getHomeImage(int index) {
    if (_tabIndex == index) {
      return _tabImages[3];
    } else {
      return _tabImages[2];
    }
  }

  Image _getMeImage(int index) {
    if (_tabIndex == index) {
      return _tabImages[5];
    } else {
      return _tabImages[4];
    }
  }
}
