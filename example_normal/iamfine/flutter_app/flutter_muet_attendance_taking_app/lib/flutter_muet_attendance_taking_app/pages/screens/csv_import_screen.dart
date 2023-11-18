import 'dart:convert';
import 'dart:io' as SystemIO;

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';

class CSVDataEntryScreen extends StatefulWidget {
  static const String routeName = '/muet_attendance_taking_app/csv-data-entry';
  @override
  State<StatefulWidget> createState() {
    return CSVDataEntryScreenState();
  }
}

class CSVDataEntryScreenState extends State<CSVDataEntryScreen> {
  late List<List<dynamic>> studentData;
  List<PlatformFile>? _paths;
  final String _extension = "csv";
  final FileType _pickingType = FileType.custom;
  bool isCSVLoaded = false;
  @override
  void initState() {
    super.initState();
    studentData = List<List<dynamic>>.empty(growable: true);
  }

  openFile(filepath) async {
    final SystemIO.File f = SystemIO.File(filepath.toString());
    final input = f.openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
    setState(() {
      studentData = fields;
      isCSVLoaded = true;
    });
  }

  void _openFileExplorer() async {
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowedExtensions: (_extension.isNotEmpty)
            ? _extension.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      try {
        openFile(_paths![0].path);
      } catch (e) {
        Navigator.of(context).pushNamed(CSVDataEntryScreen.routeName);
      }
    });
  }

  void _saveRecordsToDatabase() {
    for (int i = 0; i < studentData.length; i++) {
      Provider.of<StudentListProvider>(context).saveStudentDataToDB(
        Student(
          name: studentData[i][1].toString(),
          rollNumber: studentData[i][0].toString(),
        ),
        boxName: StringConstants.studentDBName,
      );
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CSV 数据输入"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: studentData.isEmpty
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            if (studentData.isEmpty)
              const SizedBox()
            else
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: studentData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(studentData[index][0].toString()),
                            Text(studentData[index][1].toString()),
                            Text(studentData[index][2].toString()),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: isCSVLoaded ? 45 : 65,
                    child: MainButton(
                      onPressed: isCSVLoaded
                          ? _saveRecordsToDatabase
                          : _openFileExplorer,
                      buttonColor: Colors.green.shade100,
                      buttonText: isCSVLoaded ? "全部添加到数据库" : "导入 CSV 文件",
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    '请确保您的 CSV 文件第一列包含卷号，第二列包含姓名。',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
