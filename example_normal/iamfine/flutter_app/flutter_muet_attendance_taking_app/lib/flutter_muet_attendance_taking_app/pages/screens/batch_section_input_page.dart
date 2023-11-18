import 'package:flutter/material.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';

import 'attendance_page.dart';

class BatchAndSectionSpecificationScreen extends StatefulWidget {
  static const String routeName =
      '/muet_attendance_taking_app/batch-section-specification-page';
  const BatchAndSectionSpecificationScreen({super.key});

  @override
  State<BatchAndSectionSpecificationScreen> createState() =>
      _BatchAndSectionSpecificationScreenState();
}

class _BatchAndSectionSpecificationScreenState
    extends State<BatchAndSectionSpecificationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _batchCodeController = TextEditingController();
  final TextEditingController _deptCodeController = TextEditingController();
  final TextEditingController _sectionCodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final FocusNode _nameFieldFocusNode = FocusNode();
  final FocusNode _batchFieldFocusNode = FocusNode();
  final FocusNode _deptFieldFocusNode = FocusNode();
  final FocusNode _sectionFieldFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _batchCodeController.dispose();
    _deptCodeController.dispose();
    _sectionCodeController.dispose();

    _nameFieldFocusNode.dispose();
    _batchFieldFocusNode.dispose();
    _deptFieldFocusNode.dispose();
    _sectionFieldFocusNode.dispose();
  }

  void saveAndContinue() {
    if (_formKey.currentState!.validate()) {
      PrefsDBService.saveCRData(
        name: _nameController.text.trim(),
        batchCode: _batchCodeController.text,
        deptCode: _deptCodeController.text.toUpperCase(),
        section: _sectionCodeController.text.toUpperCase(),
      );
      Navigator.pushReplacementNamed(context, AttendancePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Column(
        children: [
          if (_nameController.text != '')
            Text('欢迎, ${_nameController.text}!👋🏻')
          else
            const Text('欢迎'),
          const SizedBox(height: 3),
          const Text(
            "请输入所需的详细信息.",
            style: TextStyle(fontSize: 12),
          ),
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AttendanceAppTextField(
                  batchCodeController: _nameController,
                  focusNode: _nameFieldFocusNode,
                  hintText: '',
                  title: '名称:',
                  label: '你的名字',
                  textInputType: TextInputType.name,
                  onChanged: (v) {
                    setState(() {});
                  },
                  onSubmitted: (v) {
                    _batchFieldFocusNode.requestFocus();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                AttendanceAppTextField(
                  batchCodeController: _batchCodeController,
                  focusNode: _batchFieldFocusNode,
                  hintText: 'i.e 19',
                  title: 'Batch:',
                  label: 'Batch 号码',
                  textInputType: TextInputType.number,
                  onChanged: (v) {
                    setState(() {});
                  },
                  onSubmitted: (v) {
                    _deptFieldFocusNode.requestFocus();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: AttendanceAppTextField(
                    batchCodeController: _deptCodeController,
                    focusNode: _deptFieldFocusNode,
                    hintText: 'i.e SW',
                    title: '部门 (Code):',
                    label: '部门 Code',
                    onChanged: (v) {
                      setState(() {});
                    },
                    onSubmitted: (v) {
                      _sectionFieldFocusNode.requestFocus();
                    },
                  ),
                ),
                AttendanceAppTextField(
                  batchCodeController: _sectionCodeController,
                  focusNode: _sectionFieldFocusNode,
                  hintText: 'i.e 01/A',
                  title: '部分:',
                  label: '部分',
                  onChanged: (v) {
                    setState(() {});
                  },
                  onSubmitted: (v) {},
                ),
                const SizedBox(height: 32),
                const Center(
                    child: Text(
                  '报告中的部分文本:',
                  style: TextStyle(color: Colors.white70),
                )),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.red.shade200),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      '${_batchCodeController.text}${_deptCodeController.text.toUpperCase()} - ${_sectionCodeController.text.toUpperCase()}',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 50,
                  child: MainButton(
                    buttonText: '保存并继续',
                    onPressed: saveAndContinue,
                    buttonColor: Colors.green.shade300,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Center(
                  child: Text(
                    "请确保仔细检查数据，这将包含在您生成的报告中！\n不用担心，这是一次性设置。",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white60),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
