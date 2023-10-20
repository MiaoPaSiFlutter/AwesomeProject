import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class BPProductBottomView extends StatelessWidget {
  const BPProductBottomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets safeAreaPadding = MediaQueryData.fromView(window).padding;

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          bottom: max(safeAreaPadding.bottom, 5), top: 5, left: 10, right: 10),
      child: SizedBox(
        height: 44,
        child: Row(
          children: [
            _shopView(null),
            _shopView(null),
            _shopView(null),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _buttonView("加入购物车")),
                  Expanded(child: _buttonView("立即购买"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _shopView(var vm) {
    return SizedBox(
      width: 55,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonExtendedImageWidget.netWorkImget(
                  url: "", width: 25, height: 25),
              const Text("店铺", style: TextStyle(fontSize: 10))
            ],
          ),
          Visibility(
            visible: true,
            child: Positioned(
              top: 0,
              right: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 5, right: 5),
                  color: Colors.red,
                  child: Text(
                    HyzyTextTools.mpsfStr("14"),
                    maxLines: 1,
                    style: const TextStyle(fontSize: 9, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonView(String buttonText) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          color: (buttonText == "加入购物车") ? Colors.red : Colors.yellow,
          height: 40,
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }
}
