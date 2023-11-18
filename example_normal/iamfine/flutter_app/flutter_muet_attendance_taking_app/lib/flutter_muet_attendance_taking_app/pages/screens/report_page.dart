import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';

class ReportPage extends StatefulWidget {
  static const String routeName = '/muet_attendance_taking_app/report-page';
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  late List<String> userInfo =
      Provider.of<UserDataProvider>(context, listen: false).userData ?? [];

  @override
  Widget build(BuildContext context) {
    final int absenteeCount =
        Provider.of<StudentListProvider>(context).absentStudents.length;
    final String date = DateFormat.yMMMEd().format(DateTime.now());
    // ignore: cast_nullable_to_non_nullable
    String report = ModalRoute.of(context)!.settings.arguments as String;
    report = report.substring(0, int.tryParse(report.length.toString())! - 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('考勤报告'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: screenshotController,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Image.asset(
                      (absenteeCount == 0)
                          ? Images.smiley
                          : Images.disappointed,
                      width: 100,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      (absenteeCount == 0)
                          ? '所有出席的学生!'
                          : '$absenteeCount 个学生今天缺席!',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                '${userInfo[1]}${userInfo[2]} - ${userInfo[3]}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                date,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                Provider.of<StudentListProvider>(context)
                                        .ifGetAbsenteesList
                                    ? '缺席学生名单: ${Provider.of<StudentListProvider>(context).subjectName.toUpperCase()}'
                                    : '在校学生名单: ${Provider.of<StudentListProvider>(context).subjectName.toUpperCase()}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Provider.of<StudentListProvider>(context)
                                              .ifGetAbsenteesList
                                          ? Colors.red.shade300
                                          : Colors.green,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                report,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                '报告生成者: ${userInfo[0]}',
                                style: const TextStyle(fontSize: 11),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 50,
                child: MainButton(
                  buttonText: '复制文本',
                  onPressed: () {
                    Utils.getCopyableTextAndCopy(
                      context,
                      username: userInfo[0],
                      header: '${userInfo[1]}${userInfo[2]} - ${userInfo[3]}',
                      date: date,
                      report: report,
                    );
                  },
                  buttonColor: Colors.blue.shade200,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '或',
                style: TextStyle(
                    color: Colors.white54, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 50,
                child: MainButton(
                  buttonText: '截图',
                  onPressed: () {
                    Utils.takeAndShareScreenshot(screenshotController);
                  },
                  buttonColor: Colors.green.shade200,
                ),
              ),
            ),
            const SizedBox(height: 48)
          ],
        ),
      ),
    );
  }
}
