import 'package:flutter/material.dart';
import 'package:flutter_books/flutter_books.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../details/book_info_page.dart';

class BookSearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BookSearchPageState();
}

class BookSearchPageState extends State<BookSearchPage> {
  LoadStatus _loadStatus = LoadStatus.SUCCESS;
  List<FuzzySearchList> _list = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          titleView(),
          const Divider(height: 1, color: BooksColors.dividerDarkColor),
          Expanded(
            child: contentView(),
          ),
        ],
      )),
    );
  }

  void getData(String text) async {
    if (text.isEmpty) {
      Fluttertoast.showToast(msg: "请输入要搜索的书籍", fontSize: 14.0);
      return;
    }
    setState(() {
      _loadStatus = LoadStatus.LOADING;
    });
    FuzzySearchReq categoriesReq = FuzzySearchReq(text);
    await Repository()
        .getFuzzySearchBookList(categoriesReq.toJson())
        .then((json) {
      var fuzzySearchResp = FuzzySearchResp.fromJson(json);
      if (fuzzySearchResp.books != null) {
        setState(() {
          _loadStatus = LoadStatus.SUCCESS;
          _list = fuzzySearchResp.books!;
        });
      }
    }).catchError((e) {
      print("2-------------------");
      print(e.toString());
    });
  }

  Widget titleView() {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(height: BooksDimens.titleHeight),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    BooksDimens.leftMargin, 0, BooksDimens.rightMargin, 0),
                child: Image.asset(
                  Utils.getImag('images/icon_title_back.png'),
                  color: BooksColors.black,
                  width: 20,
                  height: BooksDimens.titleHeight,
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            height: 36,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: BooksColors.homeGrey,
            ),
            padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onSubmitted: (s) {
                getData(_controller.text);
              },
              decoration: InputDecoration(
                  icon: Image.asset(
                    Utils.getImag("images/icon_home_search.png"),
                    width: 15,
                    height: 15,
                  ),
                  hintText: "斗破苍穹",
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                  border: InputBorder.none),
              style: const TextStyle(
                color: BooksColors.textBlack6,
                fontSize: BooksDimens.textSizeM,
              ),
            ),
          )),
          MaterialButton(
            minWidth: 10,
            onPressed: () {
              getData(_controller.text);
            },
            height: BooksDimens.titleHeight,
            child: const Text(
              "搜索",
              style: TextStyle(
                  fontSize: BooksDimens.textSizeM,
                  color: BooksColors.textPrimaryColor),
            ),
          )
        ],
      ),
    );
  }

  Widget contentView() {
    if (_loadStatus == LoadStatus.LOADING) {
      return LoadingView();
    } else {
      return ListView.builder(
        itemBuilder: (context, index) => _buildListViewItem(index),
        padding: const EdgeInsets.fromLTRB(
            BooksDimens.leftMargin, 0, BooksDimens.leftMargin, 0),
        itemCount: _list.length,
      );
    }
  }

  Widget _buildListViewItem(int position) {
    String imageUrl = Utils.convertImageUrl(_list[position].cover ?? '');
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  BookInfoPage(bookId: _list[position].id ?? '')),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              imageUrl,
              height: 99,
              width: 77,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _list[position].title ?? 'title',
                    style: const TextStyle(
                        color: BooksColors.textBlack3, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _list[position].author ?? 'author',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: BooksColors.textBlack6, fontSize: 14),
                        ),
                      ),
                      const MaterialButton(
                        color: BooksColors.textPrimaryColor,
                        onPressed: null,
                        minWidth: 10,
                        height: 32,
                        child: Text(
                          "阅读",
                          style: TextStyle(
                              color: BooksColors.white,
                              fontSize: BooksDimens.textSizeL),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      tagView(_list[position].cat ?? ''),
                      const SizedBox(
                        width: 6,
                      ),
                      tagView(getWordCount(_list[position].wordCount ?? 0)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tagView(String tag) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          border: Border.all(width: 0.5, color: BooksColors.textBlack9)),
      child: Text(
        tag,
        style: const TextStyle(color: BooksColors.textBlack9, fontSize: 11.5),
      ),
    );
  }

  String getWordCount(int wordCount) {
    if (wordCount > 10000) {
      return "${(wordCount / 10000).toStringAsFixed(1)}万字";
    }
    return "$wordCount字";
  }
}
