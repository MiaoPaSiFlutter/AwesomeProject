import 'package:flutter/material.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app.dart';

class Dot extends StatelessWidget {
  const Dot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dotRadius * 2.5,
      width: dotRadius * 0.4,
      decoration: BoxDecoration(
        color: AppColors.red.withOpacity(0.2),
      ),
    );
  }
}
