import 'package:flutter_jd/flutter_jd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartInfoBottomView extends StatelessWidget {
  final Map floor;
  const CartInfoBottomView({
    Key? key,
    this.floor = const {
      "buttons": [
        {"showLabel": "领券结算"},
        {"showLabel": "按钮一"},
      ]
    },
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFEEEEEE), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _createLeftView(),
          _createRightView(),
        ],
      ),
    );
  }

  /// 左侧
  Widget _createLeftView() {
    return Expanded(
      child: Row(
        children: [
          _buildCheckBox(),
          _createIconImageView(),
        ],
      ),
    );
  }

  Widget _buildCheckBox() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Row(
        children: [
          Consumer<CarProvider>(
            builder: (context, vm, _) {
              bool isSelect = vm.selectedAll;
              return SizedBox(
                width: 30,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.check,
                    color: isSelect ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    vm.updateTotalSelect(!isSelect);
                  },
                ),
              );
            },
          ),
          const Text("全选"),
        ],
      ),
    );
  }

  Widget _createIconImageView() {
    TextSpan HJTextSpan = const TextSpan(
        text: "合计:", style: TextStyle(color: Colors.black, fontSize: 15));

    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    HJTextSpan,
                    const TextSpan(
                        text: "￥34.56",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 10, color: Colors.black),
                  children: [
                    TextSpan(
                        text: "优惠减：", style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "34.56", style: TextStyle(color: Colors.red)),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  /// 右侧
  Widget _createRightView() {
    List buttons = floor["buttons"] ?? [];
    buttons = buttons.reversed.toList();
    return Container(
      width: 200,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.red),
      ),
      child: ListView.separated(
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: buttons.length > 3 ? 3 : buttons.length,
        itemBuilder: (context, index) {
          Map buttonInfo = buttons[index];
          String showLabel = buttonInfo["showLabel"];
          Color buttonColor = Colors.red;
          return InkWell(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: buttonColor, width: 0.5),
                color: Colors.red,
              ),
              child: Text(showLabel,
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
            onTap: () {
              // JdToastUtil.show(showLabel);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 5);
        },
      ),
    );
  }
}
