// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/flutter_to_do_app.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../report/report.dart';
import '../home.dart';
import '../homecontroller.dart';
import 'addDialog.dart';

class Demopagestate extends StatelessWidget {
  Demopagestate({Key? key}) : super(key: key);

  var control = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: DragTarget<Task>(
        builder: (_, __, ___) {
          return Obx(
            () => FloatingActionButton(
              backgroundColor:
                  control.deleting.value ? Colors.red : Colors.deepPurple,
              onPressed: () {
                if (control.tasks.isNotEmpty) {
                  Get.to(() => AddDialog(), transition: Transition.downToUp);
                } else {
                  EasyLoading.showInfo("Please create your task type");
                }
              },
              child: Icon(control.deleting.value ? Icons.delete : Icons.add,
                  color: Colors.white, size: 30),
            ),
          );
        },
        onAccept: (Task task) {
          control.deletetask(task);
          EasyLoading.showSuccess("Delete Sucess");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.deepPurple,
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.0.wp),
                child: IconButton(
                    onPressed: () {
                      control.changemypage(0);
                    },
                    icon: const Icon(
                      Icons.list_alt_rounded,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0.wp),
                child: IconButton(
                    onPressed: () {
                      control.changemypage(1);
                    },
                    icon: const Icon(Icons.data_saver_off_rounded,
                        color: Colors.white, size: 30)),
              ),
            ],
          )),
      body: PageView(
        controller: control.mypage,
        children: [
          Home(),
          Report(),
        ],
      ),
    );
  }
}
