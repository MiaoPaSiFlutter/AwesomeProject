import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:intl/intl.dart';
import '../util/price_tracker.dart';
import 'components.dart';


class BottomRow extends StatelessWidget {
  BottomRow({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  final value = NumberFormat("#,##0", "en_US");
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '\$${value.format(Provider.of<PriceTracker>(context, listen: false).totalAmount)}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28.sp,
          ),
        ),
        SizedBox(
          width: 60.w,
        ),
        Expanded(
          child: AppButton(onPressed: onPressed),
        )
      ],
    );
  }
}
