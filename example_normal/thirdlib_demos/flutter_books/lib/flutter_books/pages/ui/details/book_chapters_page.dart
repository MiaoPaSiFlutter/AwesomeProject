import 'package:flutter/material.dart';
import 'package:flutter_books/flutter_books.dart';

import 'book_chapters_content_page.dart';

///@author longshaohua
///小说目录章节页

class BookChaptersPage extends StatefulWidget {
  final String bookId;
  final String bookImage;
  final String bookName;

  BookChaptersPage(
      {super.key,
      required this.bookId,
      required this.bookImage,
      required this.bookName});

  @override
  State<StatefulWidget> createState() {
    return BookChaptersPageState();
  }
}

class BookChaptersPageState extends State<BookChaptersPage> {
  List<BookChaptersBean> _listBean = [];
  bool _isReversed = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: titleView(),
      ),
      body: ListView.separated(
        itemCount: _listBean.length,
        itemBuilder: (context, index) {
          return itemView(index);
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.fromLTRB(BooksDimens.leftMargin, 0, 0, 0),
            child: Divider(height: 1, color: BooksColors.dividerDarkColor),
          );
        },
      ),
    );
  }

  Widget titleView() {
    return Container(
      constraints: BoxConstraints.expand(height: BooksDimens.titleHeight),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            child: Material(
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
                    width: 20,
                    height: BooksDimens.titleHeight,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_listBean.isNotEmpty) {
                setState(() {
                  _isReversed = !_isReversed;
                  _listBean = _listBean.reversed.toList();
                });
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "目录",
                  style: TextStyle(
                      fontSize: BooksDimens.titleTextSize,
                      color: BooksColors.textPrimaryColor),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  width: 4,
                ),
                Image.asset(
                  Utils.getImag("images/icon_chapters_turn.png"),
                  width: 15,
                  height: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void getData() async {
    GenuineSourceReq genuineSourceReq =
        GenuineSourceReq("summary", widget.bookId);
    var entryPoint =
        await Repository().getBookGenuineSource(genuineSourceReq.toJson());
    BookGenuineSourceResp bookGenuineSourceResp =
        BookGenuineSourceResp(entryPoint);
    if (bookGenuineSourceResp.data != null &&
        bookGenuineSourceResp.data!.isNotEmpty) {
      await Repository()
          .getBookChapters(bookGenuineSourceResp.data![0].id)
          .then((json) {
        BookChaptersResp bookChaptersResp = BookChaptersResp(json);
        setState(() {
          _listBean = bookChaptersResp.chapters ?? [];
        });
      }).catchError((e) {
        //请求出错
        print(e.toString());
      });
    }
  }

  Widget itemView(int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BookContentPage(
              bookId: widget.bookId,
              bookImage: widget.bookImage,
              bookName: widget.bookName,
              index: index,
              isReversed: _isReversed,
            );
          }));
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              BooksDimens.leftMargin, 16, BooksDimens.rightMargin, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: Text(
                  "${index + 1}.  ",
                  style: const TextStyle(
                      fontSize: 9, color: BooksColors.textBlack9),
                ),
              ),
              Expanded(
                child: Text(
                  _listBean[index].title ?? '',
                  style: const TextStyle(
                      fontSize: BooksDimens.textSizeM,
                      color: BooksColors.textBlack9),
                ),
              ),
              _listBean[index].isVip ?? false
                  ? Image.asset(
                      Utils.getImag("images/icon_chapters_vip.png"),
                      width: 16,
                      height: 16,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
