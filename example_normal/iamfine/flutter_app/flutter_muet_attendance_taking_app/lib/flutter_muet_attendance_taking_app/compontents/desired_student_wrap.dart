import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';

class DesiredStudentRollNumbersDisplay extends StatelessWidget {
  const DesiredStudentRollNumbersDisplay(this.colors, {super.key});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentListProvider>(
      builder: (context, listProvider, child) => Column(
        children: [
          Text(
            listProvider.ifGetAbsenteesList ? '缺席的学生' : '展示的学生',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          if (listProvider.desiredStudents.isEmpty)
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Image.asset(
                    listProvider.ifGetAbsenteesList
                        ? Images.smiley
                        : Images.disappointed,
                    width: 60,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    listProvider.ifGetAbsenteesList ? '至今无人缺席!' : '所有学生均缺席!',
                    style: const TextStyle(color: Colors.white60),
                  )
                ],
              ),
            )
          else
            Wrap(
              children: [
                for (int i = 0; i < listProvider.desiredStudents.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Chip(
                      deleteButtonTooltipMessage:
                          listProvider.ifGetAbsenteesList
                              ? '从缺席名单中删除'
                              : "从当前学生名单中删除",
                      onDeleted: () {
                        listProvider.removeFromCurrentList(
                          listProvider.desiredStudents[i],
                        );
                      },
                      deleteIcon: const Icon(
                        Icons.close,
                        size: 15,
                        color: Colors.black87,
                      ),
                      visualDensity: VisualDensity.compact,
                      backgroundColor:
                          colors[Random().nextInt(colors.length - 1)],
                      label: Text(
                        listProvider
                            .allStudents[listProvider.desiredStudents[i]]
                            .rollNumber,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            )
        ],
      ),
    );
  }
}
