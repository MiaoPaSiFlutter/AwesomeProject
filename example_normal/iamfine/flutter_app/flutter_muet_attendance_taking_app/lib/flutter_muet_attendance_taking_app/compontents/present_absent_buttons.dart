import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';

class OptionButtons extends StatelessWidget {
  const OptionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentListProvider>(
      builder: (context, listProvider, child) => Column(
        children: [
          MainButton(
            buttonText: '展示',
            buttonColor: const Color(0xFFC5FAD6),
            onPressed: () {
              listProvider.addToPresentsList();
            },
          ),
          const SizedBox(height: 12),
          MainButton(
            buttonText: '缺席的',
            textColor: Colors.white,
            buttonColor: const Color(0xFFFA6166),
            onPressed: () {
              listProvider.addToAbsenteesList();
            },
          ),
        ],
      ),
    );
  }
}
