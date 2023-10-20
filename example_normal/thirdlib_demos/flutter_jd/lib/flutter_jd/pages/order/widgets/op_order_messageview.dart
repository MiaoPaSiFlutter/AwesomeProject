import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class OPOrderMessageView extends StatelessWidget {
  final Map floor;
  const OPOrderMessageView({
    Key? key,
    this.floor = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? message = floor["message"];
    String? messageTime = floor["messageTime"];

    if (HyzyTextTools.isEmpty(message)) {
      return Container();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          border: Border.all(width: 1, color: Colors.transparent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              HyzyTextTools.mpsfStr("$message"),
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(
              HyzyTextTools.mpsfStr("$messageTime"),
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
