// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_books/flutter_books.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'book_info_page.dart';

///@author longshaohua
///小说内容浏览页

class BookContentPage extends StatefulWidget {
  /// 书籍 id
  final String bookId;

  /// 书籍图片
  final String bookImage;

  /// 保存到数据库里的书名
  final String bookName;

  /// 书籍章节内容 url
  String? bookUrl;

  /// 目录选择的 item 索引
  int index;

  /// 初次进页面 scrollview 滑动到上一次阅读的地方
  double initOffset;

  /// 章节是否倒序
  bool isReversed;

  BookContentPage({
    super.key,
    required this.bookId,
    required this.bookImage,
    required this.bookName,
    this.bookUrl,
    this.index = 0,
    this.isReversed = false,
    this.initOffset = 0,
  });

  @override
  State<StatefulWidget> createState() {
    return BookContentPageState();
  }
}

class BookContentPageState extends State<BookContentPage>
    with OnLoadReloadListener {
  final _dbHelper = DbHelper();
  static const double _addBookshelfWidth = 95;
  static const double _bottomHeight = 200;
  static const double _sImagePadding = 20;

  LoadStatus _loadStatus = LoadStatus.LOADING;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _content = "";
  double _height = 0;
  double _bottomPadding = _bottomHeight;
  double _imagePadding = _sImagePadding;
  double _addBookshelfPadding = _addBookshelfWidth;
  final int _duration = 200;
  double _spaceValue = 1.8;
  double _textSizeValue = 18;
  bool _isNighttime = false;
  bool _isAddBookshelf = false;
  List<BookChaptersBean> _listBean = [];
  String _title = "";
  double _offset = 0;
  ScrollController? _controller;

  @override
  void initState() {
    super.initState();
    _offset = widget.initOffset;
    _spGetTextSizeValue().then((value) {
      setState(() {
        _textSizeValue = value;
      });
    });
    _spGetSpaceValue().then((value) {
      setState(() {
        _spaceValue = value;
      });
    });

    getChaptersListData();
    setStemStyle();
    isAddBookshelf().then((isAdd) {
      setState(() {
        _isAddBookshelf = isAdd;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: _isNighttime ? Colors.black : Colors.white,
      //侧滑菜单显示章节
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).padding.top,
              color: Colors.black,
            ),
            Container(
              height: 50,
              color: BooksColors.homeGrey,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isReversed = !widget.isReversed;
                    widget.index = _listBean.length - 1 - widget.index;
                    _listBean = _listBean.reversed.toList();
                  });
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
              ),
            ),

            /// 章节目录 list
            Expanded(
              child: ListView.separated(
                itemCount: _listBean.length,
                itemBuilder: (context, index) {
                  return itemView(index);
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding:
                        EdgeInsets.fromLTRB(BooksDimens.leftMargin, 0, 0, 0),
                    child:
                        Divider(height: 1, color: BooksColors.dividerDarkColor),
                  );
                },
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _bottomPadding == 0
                    ? _bottomPadding = _bottomHeight
                    : _bottomPadding = 0;
                _height == BooksDimens.titleHeight
                    ? _height = 0
                    : _height = BooksDimens.titleHeight;
                _imagePadding == 0
                    ? _imagePadding = _sImagePadding
                    : _imagePadding = 0;
                _addBookshelfPadding == 0
                    ? _addBookshelfPadding = _addBookshelfWidth
                    : _addBookshelfPadding = 0;
              });
            },
            child: _loadStatus == LoadStatus.LOADING
                ? LoadingView()
                : _loadStatus == LoadStatus.FAILURE
                    ? FailureView(this)
                    : SingleChildScrollView(
                        controller: _controller,
                        padding: EdgeInsets.fromLTRB(
                          16,
                          16 + MediaQuery.of(context).padding.top,
                          9,
                          0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              _title,
                              style: TextStyle(
                                fontSize: _textSizeValue + 2,
                                color: const Color(0xFF9F8C54),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              _content,
                              style: TextStyle(
                                color: _isNighttime
                                    ? BooksColors.contentColor
                                    : BooksColors.black,
                                fontSize: _textSizeValue,
                                height: _spaceValue,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            /// 章节切换
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                MaterialButton(
                                  minWidth: 125,
                                  textColor: BooksColors.textPrimaryColor,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(125)),
                                    side: BorderSide(
                                        color: BooksColors.textPrimaryColor,
                                        width: 1),
                                  ),
                                  onPressed: () {
                                    if (widget.isReversed) {
                                      if (widget.index >=
                                          _listBean.length - 1) {
                                        Fluttertoast.showToast(
                                            msg: "没有上一章了", fontSize: 14.0);
                                      } else {
                                        setState(() {
                                          _loadStatus = LoadStatus.LOADING;
                                        });
                                        widget.initOffset = 0;
                                        ++widget.index;
                                        widget.bookUrl =
                                            _listBean[widget.index].link ?? '';
                                        getData();
                                      }
                                    } else {
                                      if (widget.index == 0) {
                                        Fluttertoast.showToast(
                                            msg: "没有上一章了", fontSize: 14.0);
                                      } else {
                                        setState(() {
                                          _loadStatus = LoadStatus.LOADING;
                                        });
                                        widget.initOffset = 0;
                                        --widget.index;
                                        widget.bookUrl =
                                            _listBean[widget.index].link ?? '';
                                        getData();
                                      }
                                    }
                                  },
                                  child: const Text("上一章"),
                                ),
                                MaterialButton(
                                  minWidth: 125,
                                  textColor: BooksColors.textPrimaryColor,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(125)),
                                    side: BorderSide(
                                        color: BooksColors.textPrimaryColor,
                                        width: 1),
                                  ),
                                  onPressed: () {
                                    if (!widget.isReversed) {
                                      if (widget.index >=
                                          _listBean.length - 1) {
                                        Fluttertoast.showToast(
                                            msg: "没有下一章了", fontSize: 14.0);
                                      } else {
                                        setState(() {
                                          _loadStatus = LoadStatus.LOADING;
                                        });
                                        widget.initOffset = 0;
                                        ++widget.index;
                                        widget.bookUrl =
                                            _listBean[widget.index].link ?? '';
                                        getData();
                                      }
                                    } else {
                                      if (widget.index == 0) {
                                        Fluttertoast.showToast(
                                            msg: "没有下一章了", fontSize: 14.0);
                                      } else {
                                        setState(() {
                                          _loadStatus = LoadStatus.LOADING;
                                        });
                                        _controller = ScrollController();
                                        widget.initOffset = 0;
                                        --widget.index;
                                        widget.bookUrl =
                                            _listBean[widget.index].link ?? '';
                                        getData();
                                      }
                                    }
                                  },
                                  child: const Text("下一章"),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
          ),
          settingView(),

          /// 加入书架
          _isAddBookshelf
              ? Container()
              : Positioned(
                  top: 78,
                  right: 0,
                  child: Container(
                    width: _addBookshelfWidth,
                    child: AnimatedPadding(
                      padding:
                          EdgeInsets.fromLTRB(_addBookshelfPadding, 30, 0, 0),
                      duration: Duration(milliseconds: _duration),
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(msg: "加入书架成功", fontSize: 14.0);
                          addBookshelf();
                          setState(() {
                            _isAddBookshelf = true;
                          });
                        },
                        child: Container(
                          width: _addBookshelfWidth,
                          padding: const EdgeInsets.fromLTRB(10, 7, 0, 7),
                          decoration: const BoxDecoration(
                            color: BooksColors.contentBgColor,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(50),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                Utils.getImag("images/icon_add_bookshelf.png"),
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "加入书架",
                                style: TextStyle(
                                  color: BooksColors.contentColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          //状态栏颜色
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).padding.top,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  //隐藏设置view
  void closeSettingView() {
    setState(() {
      _bottomPadding = _bottomHeight;
      _height = 0;
      _imagePadding = _sImagePadding;
      _addBookshelfPadding = _addBookshelfWidth;
    });
  }

  /// 设置弹窗 View
  Widget settingView() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        AnimatedContainer(
          height: _height,
          duration: Duration(milliseconds: _duration),
          child: Container(
            height: BooksDimens.titleHeight,
            color: BooksColors.contentBgColor,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(BooksDimens.leftMargin,
                          0, BooksDimens.rightMargin, 0),
                      child: Image.asset(
                        Utils.getImag('images/icon_title_back.png'),
                        width: 20,
                        height: BooksDimens.titleHeight,
                        color: BooksColors.contentColor,
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookInfoPage(bookId: widget.bookId),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Image.asset(
                        Utils.getImag('images/icon_bookshelf_more.png'),
                        width: 3.0,
                        height: BooksDimens.titleHeight,
                        color: BooksColors.contentColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        Container(
          margin: const EdgeInsets.fromLTRB(BooksDimens.leftMargin, 0, 0, 0),
          width: _sImagePadding * 2,
          height: _sImagePadding * 2,
          child: AnimatedPadding(
            duration: Duration(milliseconds: _duration),
            padding: EdgeInsets.fromLTRB(
                _imagePadding, _imagePadding, _imagePadding, _imagePadding),
            child: InkWell(
              onTap: () {
                setState(() {
                  _isNighttime = !_isNighttime;
                });
              },
              child: Image.asset(
                _isNighttime
                    ? Utils.getImag("images/icon_content_daytime.png")
                    : Utils.getImag("images/icon_content_nighttime.png"),
                height: 36,
                width: 36,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: _bottomHeight,
          child: AnimatedPadding(
            duration: Duration(milliseconds: _duration),
            padding: EdgeInsets.fromLTRB(0, _bottomPadding, 0, 0),
            child: Container(
              height: _bottomHeight,
              padding: const EdgeInsets.fromLTRB(BooksDimens.leftMargin, 20,
                  BooksDimens.rightMargin, BooksDimens.leftMargin),
              color: BooksColors.contentBgColor,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "字号",
                        style: TextStyle(
                            color: BooksColors.contentColor,
                            fontSize: BooksDimens.textSizeM),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Image.asset(
                        Utils.getImag("images/icon_content_font_small.png"),
                        color: BooksColors.white,
                        width: 28,
                        height: 18,
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            valueIndicatorColor: BooksColors.textPrimaryColor,
                            inactiveTrackColor: BooksColors.white,
                            activeTrackColor: BooksColors.textPrimaryColor,
                            activeTickMarkColor: Colors.transparent,
                            inactiveTickMarkColor: Colors.transparent,
                            trackHeight: 2.5,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 8),
                          ),
                          child: Slider(
                            value: _textSizeValue,
                            label: "字号：$_textSizeValue",
                            divisions: 20,
                            min: 10,
                            max: 30,
                            onChanged: (double value) {
                              setState(() {
                                _textSizeValue = value;
                              });
                            },
                            onChangeEnd: (value) {
                              _spSetTextSizeValue(value);
                            },
                          ),
                        ),
                      ),
                      Image.asset(
                        Utils.getImag("images/icon_content_font_big.png"),
                        color: BooksColors.white,
                        width: 28,
                        height: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "间距",
                        style: TextStyle(
                            color: BooksColors.contentColor,
                            fontSize: BooksDimens.textSizeM),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Image.asset(
                        Utils.getImag("images/icon_content_space_big.png"),
                        color: BooksColors.white,
                        width: 28,
                        height: 18,
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            valueIndicatorColor: BooksColors.textPrimaryColor,
                            inactiveTrackColor: BooksColors.white,
                            activeTrackColor: BooksColors.textPrimaryColor,
                            activeTickMarkColor: Colors.transparent,
                            inactiveTickMarkColor: Colors.transparent,
                            trackHeight: 2.5,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 8),
                          ),
                          child: Slider(
                            value: _spaceValue,
                            label: "字间距：$_spaceValue",
                            min: 1.0,
                            divisions: 20,
                            max: 3.0,
                            onChanged: (double value) {
                              setState(() {
                                _spaceValue = value;
                              });
                            },
                            onChangeEnd: (value) {
                              _spSetSpaceValue(value);
                            },
                          ),
                        ),
                      ),
                      Image.asset(
                        Utils.getImag("images/icon_content_space_small.png"),
                        color: BooksColors.white,
                        width: 28,
                        height: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          print("openDrawer");
                          closeSettingView();
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Image.asset(
                          Utils.getImag("images/icon_content_catalog.png"),
                          height: 50,
                        ),
                      ),
                      Image.asset(
                        Utils.getImag("images/icon_content_setting.png"),
                        height: 50,
                      ),
                      Image.asset(
                        Utils.getImag("images/icon_content_brightness.png"),
                        height: 50,
                      ),
                      Image.asset(
                        Utils.getImag("images/icon_content_read.png"),
                        height: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget itemView(int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            setState(() {
              _loadStatus = LoadStatus.LOADING;
              widget.initOffset = 0;
              widget.index = index;
              widget.bookUrl = _listBean[index].link ?? '';
              getData();
            });
          });
          Navigator.pop(context);
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
                  style: TextStyle(
                    fontSize: BooksDimens.textSizeM,
                    color: widget.index == index
                        ? BooksColors.textPrimaryColor
                        : BooksColors.textBlack9,
                  ),
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

  showVipDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text("该章节为 Vip 章节，请联系作者"),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text("确定"),
            )
          ],
        );
      },
    );
  }

  /// 添加到书架
  void addBookshelf() {
    double index = (widget.index * 100 / _listBean.length);
    if (widget.isReversed) {
      index = 100 - index;
    }
    if (index < 0.1) {
      index = 0.1;
    }
    var bookshelfBean = BookshelfBean(
      widget.bookName,
      widget.bookImage,
      index.toStringAsFixed(1),
      widget.bookUrl,
      widget.bookId,
      _offset,
      widget.isReversed ? 1 : 0,
      widget.index,
    );
    if (_isAddBookshelf) {
      _dbHelper.updateBooks(bookshelfBean).then((i) {});
    } else {
      _dbHelper.addBookshelfItem(bookshelfBean);
    }
    eventBus.emit(BooksEvent(''));
  }

  /// 获取书籍内容
  void getData() async {
    _controller = ScrollController(
        initialScrollOffset: widget.initOffset, keepScrollOffset: false);
    _controller?.addListener(() {
      print("offset = ${_controller!.offset}");
      _offset = _controller!.offset;
    });
    await Repository().getBookChaptersContent(widget.bookUrl).then((json) {
      BookContentResp bookContentResp = BookContentResp(json);
      setState(() {
        _loadStatus = LoadStatus.SUCCESS;

        ///部分小说文字排版有问题，需要特殊处理
        _content = bookContentResp.chapter!.cpContent!
            .replaceAll("\t", "\n")
            .replaceAll("\n\n\n\n", "\n\n");
        _title = bookContentResp.chapter?.title ?? '';

        if (bookContentResp.chapter?.isVip ?? false) {
          showVipDialog();
        }
      });
    }).catchError((e) {
      //请求出错
      print("e = $e");
      setState(() {
        _loadStatus = LoadStatus.FAILURE;
        _title = "";
      });
    });
  }

  //获取章节列表
  void getChaptersListData() async {
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
          if (widget.isReversed) {
            _listBean = _listBean.reversed.toList();
          }
        });
        if (widget.bookUrl != null && widget.bookUrl!.isEmpty) {
          widget.bookUrl = _listBean[0].link ?? '';
        }
        getData();
      }).catchError((e) {
        //请求出错
        print(e.toString());
      });
    }
  }

  //设置状态栏文字颜色
  void setStemStyle() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    });
  }

  /// 判断是否加入书架

  Future<bool> isAddBookshelf() async {
    var bookList = await _dbHelper.queryBooks(widget.bookId);
    if (bookList != null) {
      return true;
    } else {
      return false;
    }
  }

  _spSetSpaceValue(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('spaceValue', value);
  }

  _spSetTextSizeValue(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('textSizeValue', value);
  }

  Future<double> _spGetSpaceValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getDouble('spaceValue');
    return value ?? 1.3;
  }

  Future<double> _spGetTextSizeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getDouble('textSizeValue');
    return value ?? 18;
  }

  @override
  void onReload() {
    _loadStatus = LoadStatus.LOADING;
    getData();
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
    isAddBookshelf().then((isAdd) {
      _isAddBookshelf = true;
      addBookshelf();
    });
  }
}
