import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';

import '../vm/news_viewmodel.dart';

class NewsNavigationBar extends StatefulWidget {
  final void Function(int)? onTap;
  const NewsNavigationBar({Key? key, this.onTap}) : super(key: key);

  @override
  State createState() => _NewsNavigationBarState();
}

class _NewsNavigationBarState extends State<NewsNavigationBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top + kToolbarHeight,
      child: Stack(
        children: [
          Consumer<NewsViewModel>(
            builder: ((context, model, child) {
              return Container(
                color: Color.fromRGBO(255, 255, 255, model.appBarAlpha),
              );
            }),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              SizedBox(
                height: kToolbarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _attentionItem(),
                    _segmentsView(),
                    _rightBarItems(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _attentionItem() {
    return InkWell(
      onTap: () {
        // NavigatorUtil.goBackWithParams(context, null);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 30,
          color: const Color(0xFFEEEEEE),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Image.asset(
                  NormalModuleUtils.configPackagesImage(
                      packagename: 'flutter_jd',
                      name: "assets/images/news/关注ICON-黑_Normal.png"),
                  width: 12),
              Text("关注", style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rightBarItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            // NavigatorUtil.goBackWithParams(context, null);
          },
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            child: Consumer<NewsViewModel>(
              builder: ((context, model, child) {
                bool showAppBar = model.appBarAlpha >= 1;
                return Image.asset(
                    NormalModuleUtils.configPackagesImage(
                        packagename: 'flutter_jd',
                        name: showAppBar
                            ? "assets/images/product/share_gray_Normal.png"
                            : "assets/images/product/share_white_Normal.png"),
                    width: 25);
              }),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            // NavigatorUtil.goBackWithParams(context, null);
          },
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            child: Consumer<NewsViewModel>(
              builder: ((context, model, child) {
                bool showAppBar = model.appBarAlpha >= 1;
                return Image.asset(
                    NormalModuleUtils.configPackagesImage(
                        packagename: 'flutter_jd',
                        name: showAppBar
                            ? "assets/images/product/more_white_Normal.png"
                            : "assets/images/product/more_black_Normal.png"),
                    width: 25);
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _segmentsView() {
    List segments = ["精选", "趋势"];
    return AnimatedOpacity(
      opacity: 1,
      duration: const Duration(milliseconds: 300),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: const Color(0xFF808080),
          width: 120,
          height: 30,
          child: Row(
            children: segments.map((e) {
              final vm = Provider.of<NewsViewModel>(context);
              return Expanded(
                child: InkWell(
                  onTap: () {
                    vm.updateSelectIndex(segments.indexOf(e));
                    if (widget.onTap != null) {
                      widget.onTap!(segments.indexOf(e));
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: vm.selectIndex == segments.indexOf(e)
                            ? const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 1.0], //[渐变起始点, 渐变结束点]
                                //渐变颜色[始点颜色, 结束颜色]
                                colors: [
                                  Color(0xFFffd700),
                                  Color(0xFFFFFFFF),
                                ],
                              )
                            : null,
                      ),
                      child: Text(
                        "$e",
                        style: TextStyle(
                          fontSize:
                              vm.selectIndex == segments.indexOf(e) ? 16 : 14,
                          color: vm.selectIndex == segments.indexOf(e)
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
