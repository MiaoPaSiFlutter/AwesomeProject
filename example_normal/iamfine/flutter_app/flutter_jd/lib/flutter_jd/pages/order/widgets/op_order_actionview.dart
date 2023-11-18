import 'package:flutter/material.dart';

class OPOrderActionViews extends StatelessWidget {
  final Map floor;
  const OPOrderActionViews({
    Key? key,
    this.floor = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List buttons = floor["buttons"] ?? [];
    buttons = buttons.reversed.toList();
    return Container(
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: ListView.separated(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: buttons.length > 3 ? 3 : buttons.length,
        itemBuilder: (context, index) {
          Map buttonInfo = buttons[index];
          String showLabel = buttonInfo["showLabel"];
          Color buttonColor = showLabel == "再次购买" ? Colors.red : Colors.black;
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: buttonColor, width: 0.5),
            ),
            child: Text(showLabel,
                style: TextStyle(color: buttonColor, fontSize: 12)),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 5);
        },
      ),
    );
  }
}
