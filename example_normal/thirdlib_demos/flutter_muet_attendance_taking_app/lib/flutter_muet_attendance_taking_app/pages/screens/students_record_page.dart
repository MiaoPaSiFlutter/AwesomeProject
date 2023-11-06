import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';

import 'csv_import_screen.dart';

class StudentsRecordPage extends StatefulWidget {
  static const String routeName =
      '/muet_attendance_taking_app/students-record-page';
  const StudentsRecordPage({super.key});

  @override
  State<StudentsRecordPage> createState() => _StudentsRecordPageState();
}

class _StudentsRecordPageState extends State<StudentsRecordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool? isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value!.isNotEmpty ? null : "输入任意文字";
                        },
                        decoration: const InputDecoration(hintText: "请输入文字"),
                      ),
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value!.isNotEmpty ? null : "输入任意文字";
                        },
                        decoration: const InputDecoration(hintText: "请输入文字"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("选择框"),
                          Checkbox(
                              value: isChecked,
                              onChanged: (checked) {
                                setState(() {
                                  isChecked = checked;
                                });
                              })
                        ],
                      )
                    ],
                  )),
              title: const Text('状态对话'),
              actions: <Widget>[
                InkWell(
                  child: const Text('好的   '),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('学生数据库'),
        actions: [
          IconButton(
            tooltip: '添加新学生',
            onPressed: () {
              showStudentDataInputDialog(context);
              // await showInformationDialog(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<StudentListProvider>(
          builder: (context, listProvider, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (listProvider.allStudents.length > 1)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listProvider.allStudents.length,
                      itemBuilder: (context, index) {
                        return listProvider.allStudents.length - 1 != index
                            ? Dismissible(
                                confirmDismiss: (v) async {
                                  return showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext ctx) {
                                      return CupertinoAlertDialog(
                                        title: const Text('请确认'),
                                        content: Text(
                                            '您确定要删除吗 ${listProvider.allStudents[index]}?'),
                                        actions: [
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              Navigator.pop(ctx, true);
                                            },
                                            isDefaultAction: true,
                                            isDestructiveAction: true,
                                            child: const Text('是'),
                                          ),
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              Navigator.pop(ctx, false);
                                            },
                                            child: const Text('否'),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                onDismissed: (direction) {
                                  Provider.of<StudentListProvider>(
                                    context,
                                    listen: false,
                                  ).deleteStudentDataFromDB(
                                    index,
                                    boxName: 'studentsRecord',
                                  );
                                },
                                background: Row(
                                  children: [
                                    const Spacer(),
                                    Icon(
                                      Icons.delete,
                                      color: Colors.red.shade300,
                                    )
                                  ],
                                ),
                                key: Key(
                                  listProvider.allStudents[index].rollNumber,
                                ),
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: TranslucentColors
                                        .colors[Random().nextInt(
                                      TranslucentColors.colors.length - 1,
                                    )],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      listProvider
                                          .allStudents[index].rollNumber,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      listProvider.allStudents[index].name,
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(
                                        CupertinoIcons.pencil_circle,
                                      ),
                                      onPressed: () {
                                        showStudentDataInputDialog(
                                          context,
                                          student:
                                              listProvider.allStudents[index],
                                          indexForUpdation: index,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink();
                      },
                    )
                  else
                    Column(
                      children: [
                        LottieBuilder.asset(Images.sadAnim),
                        const Text(
                          '记录中未找到任何学生。请点击绿色按钮开始添加学生。',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24)
                      ],
                    ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 50,
                    child: MainButton(
                      buttonText: '+ 添加学生',
                      textColor: Colors.white,
                      onPressed: () {
                        showStudentDataInputDialog(context);
                      },
                      buttonColor: Colors.green.shade300,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      '或',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, CSVDataEntryScreen.routeName);
                    },
                    child: const Text(
                      '从 CSV 文件添加记录',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
