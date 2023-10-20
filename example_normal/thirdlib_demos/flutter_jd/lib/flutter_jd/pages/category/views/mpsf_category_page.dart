import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/entrance_catalogItem.dart';
import '../widgets/cate_left_view.dart';
import '../widgets/cate_right_view.dart';

class MpsfCategoryPage extends StatefulWidget {
  const MpsfCategoryPage({Key? key}) : super(key: key);

  @override
  State createState() => _MpsfCategoryPageState();
}

class _MpsfCategoryPageState extends State<MpsfCategoryPage> {
  bool isloading = false;
  List<EntranceCatalogItem> leftDatas = [];
  int selectIndex = 0;
  final _controller = PageController();
  static const _kDuration = Duration(milliseconds: 1);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分类'),
      ),
      body: isloading
          ? const Center(child: CupertinoActivityIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: <Widget>[
                    CateLeftView(
                      width: 100,
                      datas: leftDatas,
                      selectIndex: selectIndex,
                      onSelected: (int index) {
                        setState(() {
                          selectIndex = index;
                          _controller.animateToPage(index,
                              duration: _kDuration, curve: _kCurve);
                        });
                      },
                    ),
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        controller: _controller,
                        itemCount: leftDatas.length,
                        itemBuilder: (context, index) {
                          return CateRightView(
                            width: constraints.maxWidth - 100,
                            item: leftDatas[index],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }

  void onFetchData() {
    isloading = true;
    setState(() {});
    JdService.entranceCatalog().then((resp) {
      configLeftTabDatas(resp.jsonData);
      isloading = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    onFetchData();
  }

  configLeftTabDatas(Map data) {
    leftDatas.clear();
    if (data.containsKey("catelogyList")) {
      List catelogyList = data["catelogyList"];
      for (var i = 0; i < catelogyList.length; i++) {
        Map<String, dynamic> catelogy = catelogyList[i];
        var item = EntranceCatalogItem.fromJson(catelogy);
        leftDatas.add(item);
      }
    }
    setState(() {});
  }
}
