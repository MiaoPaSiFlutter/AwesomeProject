import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_books/flutter_books.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'book_chapters_content_page.dart';
import 'book_chapters_page.dart';

///@author longshaohua
///详情页

class BookInfoPage extends StatefulWidget {
  final String bookId;
  final bool back;

  const BookInfoPage({
    super.key,
    required this.bookId,
    this.back = false,
  });

  @override
  State<StatefulWidget> createState() => BookInfoPageState();
}

class BookInfoPageState extends State<BookInfoPage>
    implements OnLoadReloadListener {
  LoadStatus _loadStatus = LoadStatus.LOADING;
  BookInfoResp? _bookInfoResp;
  final ScrollController _controller = ScrollController();
  Color _iconColor = const Color.fromARGB(255, 255, 255, 255);
  Color _titleBgColor = const Color.fromARGB(0, 255, 255, 255);
  Color _titleTextColor = const Color.fromARGB(0, 0, 0, 0);
  bool _isDividerGone = true;
  String? _image;
  String? _bookName;
  final _dbHelper = DbHelper();

  //判断是否加入书架
  bool _isAddBookshelf = false;
  BookshelfBean? _bookshelfBean;
  StreamSubscription? booksSubscription;

  @override
  void initState() {
    super.initState();
    booksSubscription = eventBus.on<BooksEvent>((event) {
      getDbData();
    });
    getData();
    _controller.addListener(() {
      print(_controller.offset);
      //170
      if (_controller.offset <= 170) {
        setState(() {
          double num = (1 - _controller.offset / 170) * 255;
          _iconColor =
              Color.fromARGB(255, num.toInt(), num.toInt(), num.toInt());
          _titleBgColor = Color.fromARGB(255 - num.toInt(), 255, 255, 255);
          if (_controller.offset > 90) {
            _titleTextColor = Color.fromARGB(255 - num.toInt(), 0, 0, 0);
          } else {
            _titleTextColor = const Color.fromARGB(0, 0, 0, 0);
          }
          if (_controller.offset > 160) {
            _isDividerGone = false;
          } else {
            _isDividerGone = true;
          }
        });
      } else {
        setState(() {
          _isDividerGone = false;
          _iconColor = const Color.fromARGB(255, 0, 0, 0);
          _titleTextColor = const Color.fromARGB(255, 0, 0, 0);
          _titleBgColor = const Color.fromARGB(255, 255, 255, 255);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BooksColors.white,
      body: SafeArea(
        child: childLayout(),
      ),
    );
  }

  Widget childLayout() {
    if (_loadStatus == LoadStatus.LOADING) {
      return LoadingView();
    }
    if (_loadStatus == LoadStatus.FAILURE) {
      return FailureView(this);
    }

    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        contentView(),
        titleView(),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: MaterialButton(
            height: BooksDimens.titleHeight,
            color: BooksColors.textPrimaryColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0))),
            onPressed: () {
              if (widget.back) {
                Navigator.pop(context);
                return;
              }
              if (_isAddBookshelf) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BookContentPage(
                    bookId: widget.bookId,
                    bookImage: _image ?? '',
                    bookName: _bookName ?? '',
                    bookUrl: _bookshelfBean?.bookUrl ?? '',
                    index: _bookshelfBean?.chaptersIndex ?? 0,
                    isReversed: _bookshelfBean?.isReversed == 1,
                    initOffset: _bookshelfBean?.offset ?? 0,
                  );
                }));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BookContentPage(
                    bookId: widget.bookId,
                    bookImage: _image ?? '',
                    bookName: _bookName ?? '',
                  );
                }));
              }
            },
            child: Text(
              _isAddBookshelf
                  ? (_bookshelfBean?.readProgress == "0" ? "开始阅读" : "继续阅读")
                  : "开始阅读",
              style: const TextStyle(color: BooksColors.white, fontSize: 16),
            ),
          ),
        )
      ],
    );
  }

  Widget titleView() {
    return Container(
      color: _titleBgColor,
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
                      color: _iconColor,
                      width: 20,
                      height: BooksDimens.titleHeight,
                    ),
                  ),
                ),
              )),
          Text(
            _bookInfoResp?.title ?? '',
            style: TextStyle(
                fontSize: BooksDimens.titleTextSize, color: _titleTextColor),
            overflow: TextOverflow.ellipsis,
          ),
          Positioned(
            right: 0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      BooksDimens.leftMargin, 0, BooksDimens.rightMargin, 0),
                  child: Image.asset(
                    Utils.getImag('images/icon_share.png'),
                    color: _iconColor,
                    width: 18,
                    height: BooksDimens.titleHeight,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Offstage(
              offstage: _isDividerGone,
              child:
                  const Divider(height: 1, color: BooksColors.dividerDarkColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget contentView() {
    return SingleChildScrollView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          coverView(),
          bodyView(),
          Container(
            height: 14,
            color: BooksColors.dividerColor,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(
                  BooksDimens.leftMargin, 20, BooksDimens.rightMargin, 20),
              child: Text(
                _bookInfoResp?.longIntro ?? '',
                style: const TextStyle(
                    fontSize: BooksDimens.textSizeM, color: BooksColors.black),
              )),
          Container(
            height: 14,
            color: BooksColors.dividerColor,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                BooksDimens.leftMargin, 12, BooksDimens.rightMargin, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "最新书评",
                  style: TextStyle(
                      fontSize: BooksDimens.textSizeM,
                      color: BooksColors.textBlack3),
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 1, 3, 0),
                  child: Image.asset(
                    Utils.getImag('images/icon_info_edit.png'),
                    width: 16,
                    height: 16,
                  ),
                ),
                const Text(
                  "写书评",
                  style: TextStyle(
                      fontSize: BooksDimens.textSizeL,
                      color: Color(0xFF33C3A5)),
                )
              ],
            ),
          ),
          commentList(),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: const Text(
              "查看更多评论（268）",
              style: TextStyle(
                  color: BooksColors.textPrimaryColor,
                  fontSize: BooksDimens.textSizeL),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: BooksColors.dividerColor,
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 68),
            child: Text(
              _bookInfoResp?.copyrightDesc ?? '',
              style:
                  const TextStyle(color: BooksColors.textBlack9, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  ///封面view
  Widget coverView() {
    return Container(
      color: BooksColors.infoBgColor,
      padding: const EdgeInsets.fromLTRB(
          BooksDimens.leftMargin, 68, BooksDimens.rightMargin, 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            Utils.convertImageUrl(_bookInfoResp?.cover ?? ''),
            height: 137,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _bookInfoResp?.title ?? '',
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: BooksDimens.titleTextSize,
                      color: BooksColors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  _bookInfoResp?.author ?? '',
                  style: const TextStyle(
                      fontSize: BooksDimens.textSizeM,
                      color: BooksColors.white),
                ),
                const SizedBox(
                  height: 61,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _bookInfoResp?.cat ?? '',
                      style: const TextStyle(
                          fontSize: BooksDimens.textSizeL,
                          color: BooksColors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                      color: const Color(0x50FFFFFF),
                      width: 1,
                      height: 12,
                      child: const Text(""),
                    ),
                    Text(
                      getWordCount(_bookInfoResp?.wordCount ?? 0),
                      style: const TextStyle(
                          fontSize: BooksDimens.textSizeL,
                          color: BooksColors.white),
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 3, 4),
                      child: Text(
                        _bookInfoResp?.rating != null
                            ? (_bookInfoResp!.rating!.score ?? 0)
                                .toStringAsFixed(1)
                            : "7.0",
                        style: const TextStyle(
                            color: BooksColors.fractionColor, fontSize: 23),
                      ),
                    ),
                    const Text(
                      "分",
                      style: TextStyle(
                          color: BooksColors.white,
                          fontSize: BooksDimens.textSizeL),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bodyView() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        bodyChildView(
            _isAddBookshelf
                ? Utils.getImag('images/icon_details_bookshelf_add.png')
                : Utils.getImag('images/icon_details_bookshelf.png'),
            _isAddBookshelf ? "已在书架" : "加入书架",
            0),
        bodyChildView(Utils.getImag('images/icon_details_chapter.png'),
            "${_bookInfoResp?.chaptersCount ?? 0}章", 1),
        bodyChildView(
            Utils.getImag('images/icon_details_reward.png'), "支持作品", 2),
        bodyChildView(
            Utils.getImag('images/icon_details_download.png'), "批量下载", 3),
      ],
    );
  }

  Widget bodyChildView(String img, String content, int tap) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          if (tap == 0) {
            if (!_isAddBookshelf) {
              var bean = BookshelfBean(
                _bookName,
                _image,
                "0",
                "",
                widget.bookId,
                0,
                0,
                0,
              );
              _dbHelper.addBookshelfItem(bean);
              _bookshelfBean = bean;
              setState(() {
                _isAddBookshelf = true;
              });
              eventBus.emit(BooksEvent(''));
            }
          }
          if (tap == 1) {
            /// 章节目录页
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (content) => BookChaptersPage(
                    bookId: widget.bookId,
                    bookImage: _image ?? '',
                    bookName: _bookName ?? ''),
              ),
            );
          }
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                img,
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
              Text(
                content,
                style: const TextStyle(
                    color: BooksColors.textBlack3,
                    fontSize: BooksDimens.textSizeM),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //评论列表
  Widget commentList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          BooksDimens.leftMargin, 0, BooksDimens.rightMargin, 0),
      child: Column(
        children: <Widget>[
          itemView("嘻嘻", "求更新，不够看", 4.5, "9", true),
          itemView("书友805699513", "不错不错。", 5, "8", false),
          itemView("书友007", "没看先点赞", 5, "5", true),
          itemView("书友00888", "好文章不错，就是更新太慢了。", 3, "1", false),
          itemView("书友00666", "打卡", 5, "9", true),
        ],
      ),
    );
  }

  Widget itemView(
      String name, String content, double rate, String likeNum, bool image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipOval(
              child: SizedBox(
                width: 32,
                height: 32,
                child: Image.asset(
                    Utils.getImag("images/icon_default_avatar.png")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name,
                      style: const TextStyle(
                          color: BooksColors.textBlack6,
                          fontSize: BooksDimens.textSizeL)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: StaticRatingBar(
                      size: 10,
                      rate: rate,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
          child: Text(
            content,
            style: const TextStyle(
                color: BooksColors.textBlack3, fontSize: BooksDimens.textSizeL),
          ),
        ),
        Row(
          children: <Widget>[
            const Text(
              "2019.05.09",
              style: TextStyle(color: BooksColors.textBlack9, fontSize: 12),
            ),
            Expanded(
              child: Container(),
            ),
            GestureDetector(
              child: image
                  ? Image.asset(
                      Utils.getImag("images/icon_like_true.png"),
                      width: 18,
                      height: 18,
                    )
                  : Image.asset(
                      Utils.getImag("images/icon_like_false.png"),
                      width: 18,
                      height: 18,
                    ),
              onTap: () {
                Fluttertoast.showToast(msg: "本app不允许点赞", fontSize: 14.0);
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(2, 0, 20, 0),
              child: Text(
                likeNum,
                style: const TextStyle(
                    color: BooksColors.textBlack9, fontSize: 12),
              ),
            ),
            Image.asset(
              Utils.getImag("images/icon_comment.png"),
              width: 18,
              height: 18,
            ),
          ],
        ),
        const SizedBox(
          height: 18,
        )
      ],
    );
  }

  String getWordCount(int wordCount) {
    if (wordCount > 10000) {
      return "${(wordCount / 10000).toStringAsFixed(1)}万字";
    }
    return "$wordCount字";
  }

  void getData() async {
    await Repository().getBookInfo(widget.bookId).then((json) {
      print("getData1");
      setState(() {
        _loadStatus = LoadStatus.SUCCESS;
        _bookInfoResp = BookInfoResp(json);
        _image = _bookInfoResp?.cover;
        _bookName = _bookInfoResp?.title;
      });
      getDbData();
    }).catchError((e) {
      print("getData2${e.toString()}");
      setState(() {
        _loadStatus = LoadStatus.FAILURE;
      });
    });
  }

  void getDbData() async {
    var list = await _dbHelper.queryBooks(_bookInfoResp?.id ?? '');
    if (list != null) {
      print("getDbData1");
      _bookshelfBean = list;
      setState(() {
        _isAddBookshelf = true;
      });
    } else {
      print("getDbData2");
      setState(() {
        _isAddBookshelf = false;
      });
    }
  }

  @override
  void onReload() {
    setState(() {
      _loadStatus = LoadStatus.LOADING;
    });
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    booksSubscription?.cancel();
  }
}
