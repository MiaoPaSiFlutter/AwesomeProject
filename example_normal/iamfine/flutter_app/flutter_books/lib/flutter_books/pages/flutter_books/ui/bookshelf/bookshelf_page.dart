import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_books/flutter_books.dart';

import '../details/book_chapters_content_page.dart';
import '../search/book_search_page.dart';

///@author longshaohua
///书架页面

class BookshelfPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BookshelfPageState();
}

class BookshelfPageState extends State<BookshelfPage> {
  var _dbHelper = DbHelper();
  List<BookshelfBean> _listBean = [];
  StreamSubscription? booksSubscription;
  final String _emptyTitle = "添加书籍";

  @override
  void initState() {
    super.initState();
    booksSubscription = eventBus.on<BooksEvent>((event) {
      getDbData();
    });
    getDbData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            titleView(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(BooksDimens.leftMargin,
                          0, BooksDimens.rightMargin, 20),
                      padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                      decoration: const BoxDecoration(
                          color: Color(0XFFEBF9F6),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: const Text(
                        "【Panda看书】全网小说不限时免费观看",
                        style: TextStyle(
                            color: BooksColors.textBlack6,
                            fontSize: BooksDimens.textSizeL),
                      ),
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _listBean.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.5,
                      ),
                      itemBuilder: (context, index) {
                        return itemView(index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemView(int index) {
    String? readProgress = _listBean[index].readProgress;
    if (readProgress == "0") {
      readProgress = "未读";
    } else {
      readProgress = "已读$readProgress%";
    }

    bool addBookshelfItem = false;
    if (_listBean[index].title == _emptyTitle) {
      addBookshelfItem = true;
      readProgress = "";
    }

    var position = index == 0 ? 0 : index % 3;
    CrossAxisAlignment axisAlignment;
    if (position == 0) {
      axisAlignment = CrossAxisAlignment.start;
    } else if (position == 1) {
      axisAlignment = CrossAxisAlignment.center;
    } else if (position == 2) {
      axisAlignment = CrossAxisAlignment.end;
    } else {
      axisAlignment = CrossAxisAlignment.start;
    }
    return Column(
      crossAxisAlignment: axisAlignment,
      children: <Widget>[
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3)),
          ),
          clipBehavior: Clip.antiAlias,
          child: GestureDetector(
            child: addBookshelfItem
                ? Image.asset(
                    Utils.getImag("images/icon_bookshelf_empty_add.png"),
                    height: 121,
                    width: 92,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    Utils.convertImageUrl(_listBean[index].image ?? ''),
                    height: 121,
                    width: 92,
                    fit: BoxFit.cover,
                  ),
            onLongPress: () {
              if (!addBookshelfItem) {
                showDeleteDialog(index);
              }
            },
            onTap: () {
              if (addBookshelfItem) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookSearchPage()),
                );
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BookContentPage(
                    bookId: _listBean[index].bookId ?? '1111',
                    bookImage: _listBean[index].image ?? '???',
                    bookName: _listBean[index].title ?? '???',
                    bookUrl: _listBean[index].bookUrl ?? '',
                    index: _listBean[index].chaptersIndex ?? 0,
                    isReversed: _listBean[index].isReversed == 1,
                    initOffset: _listBean[index].offset ?? 0,
                  );
                }));
              }
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 96,
          child: Text(
            _listBean[index].title ?? '',
            maxLines: 2,
            style: TextStyle(
              fontSize: BooksDimens.textSizeM,
              color: addBookshelfItem
                  ? BooksColors.textBlack9
                  : BooksColors.textBlack3,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 96,
          child: Text(
            readProgress,
            style: const TextStyle(
                fontSize: BooksDimens.textSizeL, color: BooksColors.textBlack9),
          ),
        ),
      ],
    );
  }

  ///书架标题
  Widget titleView() {
    return Container(
      color: BooksColors.primary,
      constraints: BoxConstraints.expand(height: BooksDimens.titleHeight),
      padding: const EdgeInsets.fromLTRB(BooksDimens.leftMargin, 0, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            "书架",
            style: TextStyle(
                fontSize: BooksDimens.titleTextSize,
                color: BooksColors.textBlack3),
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(child: Container()),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookSearchPage()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    BooksDimens.leftMargin, 0, BooksDimens.rightMargin, 0),
                child: Image.asset(
                  Utils.getImag('images/icon_bookshelf_search.png'),
                  width: 20,
                  height: BooksDimens.titleHeight,
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Image.asset(
                  Utils.getImag('images/icon_bookshelf_more.png'),
                  width: 3.5,
                  height: BooksDimens.titleHeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showDeleteDialog(int index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text("删除书籍"),
          content: const Text("删除此书后，书籍源文件及阅读进度也将被删除"),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                _dbHelper.deleteBooks(_listBean[index].bookId!).then((i) {
                  setState(() {
                    _listBean.removeAt(index);
                  });
                });
              },
              child: const Text("确定"),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text("取消"),
            ),
          ],
        );
      },
    );
  }

  /// 从数据库查询书架书籍
  void getDbData() async {
    await _dbHelper.getTotalList().then((list) {
      _listBean.clear();
      list.reversed.forEach((item) {
        BookshelfBean todoItem = BookshelfBean.fromMap(item);
        setState(() {
          _listBean.add(todoItem);
        });
      });
      setAddItem();
    }).catchError((e) {});
  }

  /// add 样式 item
  void setAddItem() {
    BookshelfBean todoItem =
        BookshelfBean(_emptyTitle, null, "", "", "", 0, 0, 0);
    setState(() {
      _listBean.add(todoItem);
    });
  }

  @override
  void dispose() {
    super.dispose();
    booksSubscription?.cancel();
    _dbHelper.close();
  }
}
