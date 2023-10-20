import 'package:flutter/material.dart';
import 'package:flutter_books/flutter_books.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

import '../details/book_info_page.dart';

///@author longshaohua
///书城 ListView

class HomeTabListView extends StatefulWidget {
  final String major;
  final String gender;

  const HomeTabListView({
    super.key,
    required this.major,
    required this.gender,
  });

  @override
  State<StatefulWidget> createState() => _HomeTabListViewState();
}

class _HomeTabListViewState extends State<HomeTabListView>
    with AutomaticKeepAliveClientMixin
    implements OnLoadReloadListener {
  List<Books> _list = [];
  LoadStatus _loadStatus = LoadStatus.LOADING;
  final List<String> _listImage = [
    Utils.getImag("images/icon_swiper_1.png"),
    Utils.getImag("images/icon_swiper_2.png"),
    Utils.getImag("images/icon_swiper_3.png"),
    Utils.getImag("images/icon_swiper_4.png"),
    Utils.getImag("images/icon_swiper_5.png"),
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loadStatus == LoadStatus.LOADING) {
      return LoadingView();
    }
    if (_loadStatus == LoadStatus.FAILURE) {
      return FailureView(this);
    }
    return ListView.builder(
      itemCount: _list.length + 1,
      itemBuilder: (context, position) {
        if (position == 0) {
          return _swiper();
        }
        return _buildListViewItem(position - 1);
      },
    );
  }

  Widget _buildListViewItem(int position) {
    String imageUrl = Utils.convertImageUrl(_list[position].cover);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookInfoPage(bookId: _list[position].id)),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(
            BooksDimens.leftMargin, 12, BooksDimens.leftMargin, 12),
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
                    _list[position].title,
                    style: const TextStyle(
                        color: BooksColors.textBlack3, fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _list[position].shortIntro,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: BooksColors.textBlack6, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        _list[position].author,
                        style: const TextStyle(
                          color: BooksColors.textBlack9,
                          fontSize: 14,
                        ),
                      )),
                      _list[position].tags.isNotEmpty
                          ? tagView(_list[position].tags[0])
                          : tagView('限免'),
                      _list[position].tags.length > 1
                          ? const SizedBox(
                              width: 4,
                            )
                          : const SizedBox(),
                      _list[position].tags.length > 1
                          ? tagView(_list[position].tags[1])
                          : const SizedBox(),
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

  /// 轮播图
  Widget _swiper() {
    return Container(
      height: 180,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          print("index = $index");
          return Container(
            margin: const EdgeInsets.only(top: 16, bottom: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_listImage[index]),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
          );
        },
        autoplayDisableOnInteraction: true,
        itemHeight: 180,
        itemCount: 5,
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const BookInfoPage(bookId: "59ba0dbb017336e411085a4e")),
          );
        },
        viewportFraction: 0.9,
        scale: 0.93,
        outer: true,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            activeColor: BooksColors.textBlack6,
            color: BooksColors.paginationColor,
            size: 5,
            activeSize: 5,
          ),
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

  void getData() async {
    print('----------------${widget.gender}');
    print('----------------${widget.major}');

    CategoriesReq categoriesReq = CategoriesReq();
    categoriesReq.gender = widget.gender;
    categoriesReq.major = widget.major;
    categoriesReq.type = "hot";
    categoriesReq.start = 0;
    categoriesReq.limit = 40;
    await Repository().getCategories(categoriesReq.toJson()).then((json) {
      var categoriesResp =
          CategoriesResp.fromJson(json as Map<String, dynamic>);
      setState(() {
        _loadStatus = LoadStatus.SUCCESS;
        _list = categoriesResp.books;
      });
    }).catchError((e) {
      setState(() {
        _loadStatus = LoadStatus.FAILURE;
      });
      print(e.toString());
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void onReload() {
    setState(() {
      _loadStatus = LoadStatus.LOADING;
    });
    getData();
  }
}
