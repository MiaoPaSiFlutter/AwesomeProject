// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/flutter_to_do_app.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'homecontroller.dart';
import 'widgets/addCard.dart';
import 'widgets/taskCard.dart';

class Home extends GetView<Homecontroller> {
  Home({Key? key}) : super(key: key);

  @override
  Homecontroller get controller => Get.put(Homecontroller(
      taskRepository: TaskRepository(taskProvider: TaskProvider())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 4.0.wp, bottom: 2.0.wp, top: 5.0.wp),
                  child: const Icon(Icons.list_alt_rounded,
                      color: Colors.deepPurple, size: 35),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 4.0.wp, bottom: 2.0.wp, right: 4.0.wp, top: 4.0.wp),
                  child: Text(
                    'My List',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
            Obx(() {
              return GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...controller.tasks
                      .map((element) => LongPressDraggable(
                          data: element,
                          onDragStarted: () => controller.changeDeleting(true),
                          onDraggableCanceled: (_, __) =>
                              controller.changeDeleting(false),
                          onDragEnd: (_) => controller.changeDeleting(false),
                          feedback: Opacity(
                            opacity: 0.8,
                            child: TaskCard(task: element),
                          ),
                          child: TaskCard(task: element)))
                      .toList(),
                  AddCard()
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
