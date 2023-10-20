import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../models/entrance_catalogItem.dart';

class CateLeftView extends StatefulWidget {
  final double width;
  final List<EntranceCatalogItem> datas;
  final int selectIndex;
  final ValueChanged<int>? onSelected;
  const CateLeftView({
    Key? key,
    this.datas = const [],
    this.selectIndex = 0,
    this.onSelected,
    this.width = 100,
  }) : super(key: key);

  @override
  State createState() => _CateLeftViewState();
}

class _CateLeftViewState extends State<CateLeftView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: widget.datas.length,
        itemBuilder: (context, index) {
          EntranceCatalogItem item = widget.datas[index];
          bool select = widget.selectIndex == index;
          Color bgColor = select ? Colors.white : getColorFromHex("#D8D9D8");
          Color textColor = select ? Colors.black : Colors.black54;
          double fontSize = select ? 15 : 14;

          return GestureDetector(
            onTap: () {
              if (widget.onSelected != null) {
                widget.onSelected!(index);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(0),
              height: 44,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: bgColor),
                    child: Text(
                      "${item.name}",
                      style: TextStyle(color: textColor, fontSize: fontSize),
                    ),
                  ),
                  Visibility(
                    visible: select,
                    child: Positioned(
                      left: 0,
                      top: 5,
                      bottom: 5,
                      child: Container(width: 5, color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
