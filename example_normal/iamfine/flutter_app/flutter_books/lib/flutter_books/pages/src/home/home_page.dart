import 'package:flutter/material.dart';
import 'package:flutter_books/flutter_books.dart';

import '../search/book_search_page.dart';
import 'home_tab_list_view.dart';

///@author longshaohua
///书城

class TabHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookSearchPage()));
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: BooksColors.homeGrey,
                          ),
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Image.asset(
                                Utils.getImag("images/icon_home_search.png"),
                                width: 15,
                                height: 15,
                              ),
                              const Text(
                                "   搜索本地及网络书籍",
                                style: TextStyle(
                                  color: BooksColors.homeGreyText,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("333333333333333");
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              Utils.getImag("images/icon_classification.png"),
                              width: 22,
                              height: 22,
                            ),
                            const Text(
                              "分类",
                              style: TextStyle(
                                color: BooksColors.textBlack6,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const TabBar(
                  labelColor: BooksColors.homeTabText,
                  unselectedLabelColor: BooksColors.homeTabGreyText,
                  labelStyle: TextStyle(fontSize: 16),
                  labelPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  indicatorColor: BooksColors.homeTabText,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2,
                  indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                  tabs: <Widget>[
                    Text("精选"),
                    Text("男生"),
                    Text("女生"),
                    Text("出版"),
                  ],
                ),
                const Divider(height: 1, color: BooksColors.dividerDarkColor),
                const Expanded(
                  child: TabBarView(children: [
                    HomeTabListView(major: 'male', gender: '仙侠'),
                    HomeTabListView(major: 'male', gender: '玄幻'),
                    HomeTabListView(major: 'female', gender: '现代言情'),
                    HomeTabListView(major: 'press', gender: '出版小说'),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
