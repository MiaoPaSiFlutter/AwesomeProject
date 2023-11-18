import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../../core.dart';

class SHDivider extends StatelessWidget {
  const SHDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: SHColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            color: Colors.white54,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: SizedBox(height: 1.r, width: double.infinity),
    );
  }
}
