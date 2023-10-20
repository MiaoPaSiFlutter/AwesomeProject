import 'dart:math';

import 'package:flutter_jd/flutter_jd/tools/Service/JdService.dart';
import 'package:flutter_jd/flutter_jd/tools/factory_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class OrderFilterDialog extends StatefulWidget {
  final void Function(List<String> selectedNames)? callback;
  const OrderFilterDialog({
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  State createState() => _OrderFilterDialogState();
}

class _OrderFilterDialogState extends State<OrderFilterDialog> {
  final ScrollController _scrollController = ScrollController();
  List _newAllOrdersFunctionList = [];
  List _dateOptionFunctionList = [];
  final double _leftOffSet = 40;
  final List<String> _selectDatas = [];
  bool isloading = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isloading = true;
    });
    JdService.allOrdersFunctionNewList().then((resp) {
      _newAllOrdersFunctionList =
          resp.jsonData["newAllOrdersFunctionList"] ?? [];
      _dateOptionFunctionList = resp.jsonData["dateOptionFunctionList"] ?? [];
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 1),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(width: _leftOffSet),
            ),
            isloading
                ? createActivityIndicator()
                : Flexible(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: CustomScrollView(
                          controller: _scrollController,
                          slivers: <Widget>[
                            SliverToBoxAdapter(
                              child: Container(
                                height:
                                    max(MediaQuery.of(context).padding.top, 22),
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (content, index) {
                                  if (index == 0) {
                                    return _createFilterGroupViews();
                                  } else {
                                    return _createActionsViews();
                                  }
                                },
                                childCount: 2,
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (content, index) {
                                  return _createGroupViews(
                                      _newAllOrdersFunctionList[index]);
                                },
                                childCount: _newAllOrdersFunctionList.length,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                height: max(
                                    MediaQuery.of(context).padding.bottom, 22),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget _createFilterGroupViews() {
    String functionName = "按时间";

    int crossAxisCount = 3;
    double mainAxisSpacing = 5;
    double crossAxisSpacing = 5;
    double scrollViewW = MediaQuery.of(context).size.width - _leftOffSet;
    double itemW = (scrollViewW - (crossAxisCount - 1) * crossAxisSpacing) /
        crossAxisCount;
    double childAspectRatio = itemW / 40;
    return CustomScrollView(
      shrinkWrap: true,
      controller: _scrollController,
      slivers: <Widget>[
        //组头
        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 1, (content, index) {
            return Container(
              height: 44,
              alignment: Alignment.centerLeft,
              child: Text(functionName,
                  style: const TextStyle(color: Colors.black, fontSize: 13)),
            );
          }),
        ),
        //组内容
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            childAspectRatio: childAspectRatio,
          ),
          delegate: SliverChildBuilderDelegate(
            childCount: _dateOptionFunctionList.length,
            (BuildContext context, int index) {
              String name = _dateOptionFunctionList[index]["name"] ?? "";
              bool isSelect = _selectDatas.contains(name);

              return InkWell(
                onTap: () {
                  if (isSelect) {
                    _selectDatas.remove(name);
                  } else {
                    _selectDatas.add(name);
                  }
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelect ? Colors.red : const Color(0xFFEEEEEE),
                      width: 1,
                    ), //边框
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    color: isSelect ? Colors.red : const Color(0xFFEEEEEE),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isSelect ? Colors.white : Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _createActionsViews() {
    return CustomScrollView(
      shrinkWrap: true,
      controller: _scrollController,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 1, (content, index) {
            return Container(
              height: 35,
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _selectDatas.clear();
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1), //边框
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: const Text("重置",
                            style:
                                TextStyle(color: Colors.black, fontSize: 10)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (widget.callback != null) {
                          widget.callback!(_selectDatas);
                        }
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(color: Colors.red, width: 1), //边框
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: const Text("确定",
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _createGroupViews(Map? group) {
    String functionName = group?["functionName"] ?? "";
    List orderStatList = group?["orderStatList"] ?? [];
    return CustomScrollView(
      shrinkWrap: true,
      controller: _scrollController,
      slivers: <Widget>[
        //组头
        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 1, (content, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 1),
              ),
              height: 44,
              alignment: Alignment.centerLeft,
              child: Text(
                functionName,
                style: const TextStyle(color: Colors.black, fontSize: 13),
              ),
            );
          }),
        ),
        //组内容
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            childCount: orderStatList.length,
            (BuildContext context, int index) {
              String icon = orderStatList[index]["icon"] ?? "";
              String name = orderStatList[index]["name"] ?? "";
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent, width: 1),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FractionallySizedBox(
                              widthFactor: 0.5,
                              child: CommonExtendedImageWidget.netWorkImget(
                                  url: icon),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent, width: 1),
                      ),
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
