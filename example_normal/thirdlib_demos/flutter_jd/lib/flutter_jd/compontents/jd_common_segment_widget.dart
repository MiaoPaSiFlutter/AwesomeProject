import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

///////////SegmentView
class JdCommonSegmentWidget extends StatefulWidget {
  const JdCommonSegmentWidget({
    Key? key,
    required this.onTap,
    required this.items,
    required this.controller,
  }) : super(key: key);
  final List<String> items;
  final void Function(int)? onTap;
  final TabController? controller;
  @override
  State<JdCommonSegmentWidget> createState() => _CommonSegmentViewState();
}

class _CommonSegmentViewState extends State<JdCommonSegmentWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    dPrint("JdCommonSegmentWidget - initState");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: _getSegment(),
            ),
          ),
          InkWell(
            child: SizedBox(
                width: 40,
                child: Image.asset(
                  NormalModuleUtils.configPackagesImage(
                      packagename: 'flutter_jd',
                      name:
                          "assets/images/home/sss_aso_category_btn_black_Normal.png"),
                  fit: BoxFit.fill,
                )),
            onTap: () {
              // NavigatorUtil.push(context, AccountRouter.setting);
              // currentToPage(CommonPageId.CATEGORY);
            },
          )
        ],
      ),
    );
  }

  Widget _getSegment() {
    List<Widget> tabs = widget.items.map((e) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.transparent),
        ),
        child: Text(e),
      );
    }).toList();

    return TabBar(
      controller: widget.controller,
      indicatorColor: Colors.red,
      labelColor: Colors.red,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true, //允许滚动
      tabs: tabs,
      onTap: (index) {
        if (widget.onTap != null) {
          widget.onTap!(index);
        }
      },
    );
  }
}
