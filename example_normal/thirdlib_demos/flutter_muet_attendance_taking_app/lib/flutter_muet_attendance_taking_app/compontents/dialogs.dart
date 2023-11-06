import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app/pages/screens/attendance_page.dart';

Future<void> showRetakeConfirmationDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (ctx) => Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Material(
            elevation: 80,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          '您确定要重新考勤吗？\n所有当前数据都将丢失。',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    MainButton(
                      buttonText: '重置',
                      onPressed: () {
                        Provider.of<StudentListProvider>(context, listen: false)
                            .retakeAttendance();
                        Navigator.pop(ctx);
                        Navigator.of(context)
                            .pushReplacementNamed(AttendancePage.routeName);
                      },
                      buttonColor: Colors.red.shade200,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 12),
                    MainButton(
                      buttonText: '关闭',
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      buttonColor: Colors.teal.shade200,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Future<void> showStudentDataInputDialog(
  BuildContext context, {
  Student? student,
  int? indexForUpdation,
}) async {
  // importing _userData to extract batch and department code.
  final List<String> userData =
      Provider.of<UserDataProvider>(context, listen: false).userData ?? [];
  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController rollNumberController =
      TextEditingController(text: userData[1] + userData[2]);

  if (student != null) {
    studentNameController.text = student.name;
    rollNumberController.text = student.rollNumber;
  }
  final formKey = GlobalKey<FormState>();

  return await showDialog(
    context: context,
    builder: (ctx) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Material(
          elevation: 40,
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '添加新学生',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    AttendanceAppTextField(
                      batchCodeController: studentNameController,
                      hintText: '学生姓名',
                      label: '',
                      title: "输入学生姓名:",
                      onChanged: (v) {},
                      onSubmitted: (v) {},
                    ),
                    const SizedBox(height: 16),
                    AttendanceAppTextField(
                      batchCodeController: rollNumberController,
                      hintText: '',
                      label: '',
                      title: "输入学生的学号:",
                      onChanged: (v) {},
                      onSubmitted: (v) {},
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 55,
                      child: MainButton(
                        buttonText: student == null ? '添加' : '更新',
                        textColor: Colors.white,
                        onPressed: () {
                          if (student != null) {
                            if (studentNameController.text == student.name &&
                                rollNumberController.text == student.rollNumber)
                              return;
                          }
                          if (formKey.currentState!.validate()) {
                            final Student newStudent = Student(
                              name: studentNameController.text,
                              rollNumber: rollNumberController.text,
                            );
                            if (student != null && indexForUpdation != null) {
                              Provider.of<StudentListProvider>(
                                context,
                                listen: false,
                              ).updateStudentDataInDB(
                                newStudent,
                                boxName: 'studentsRecord',
                                index: indexForUpdation,
                              );
                            } else {
                              Provider.of<StudentListProvider>(
                                context,
                                listen: false,
                              ).saveStudentDataToDB(
                                newStudent,
                                boxName: StringConstants.studentDBName,
                              );
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${studentNameController.text} (${rollNumberController.text}) was added to the database.',
                                ),
                              ),
                            );
                            Navigator.of(ctx).pop();
                          }
                        },
                        buttonColor: Colors.red.shade300,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 55,
                      child: MainButton(
                        textColor: Colors.white,
                        buttonText: '消失',
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        buttonColor: Colors.teal.shade300,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

Future<void> showSubjectNameDialog(BuildContext context) async {
  final formKey = GlobalKey<FormState>();
  final TextEditingController subjectNameController = TextEditingController();

  return await showDialog(
    barrierDismissible: true,
    context: context,
    builder: (ctx) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Material(
          elevation: 40,
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          '主题名称',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    AttendanceAppTextField(
                      batchCodeController: subjectNameController,
                      hintText: '',
                      label: '',
                      title: "请输入您要参加的科目名称:",
                      onChanged: (v) {},
                      onSubmitted: (v) {},
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 55,
                      child: MainButton(
                        buttonText: '更新',
                        textColor: Colors.white,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Provider.of<StudentListProvider>(
                              context,
                              listen: false,
                            ).subjectName =
                                subjectNameController.text.toUpperCase();

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  '添加了主题名称.',
                                ),
                              ),
                            );
                            Navigator.pop(ctx);
                          }
                        },
                        buttonColor: Colors.red.shade200,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

// Future<bool> delete(
//   BuildContext context, {
//   required Student student,
// }) {
//   return showCupertinoDialog(
    
//     context: context,
//     builder: (BuildContext ctx) {
//       return CupertinoAlertDialog(
//         title: const Text('Please Confirm'),
//         content: Text('Are you sure to remove ${student.rollNumber}?'),
//         actions: [
//           CupertinoDialogAction(
//             onPressed: () {
//               Navigator.pop(context, true);
//             },
//             isDefaultAction: true,
//             isDestructiveAction: true,
//             child: const Text('Yes'),
//           ),
//           CupertinoDialogAction(
//             onPressed: () {
//               Navigator.pop(context, true);
//             },
//             child: const Text('No'),
//           )
//         ],
//       );
//     },
//   );
// }
