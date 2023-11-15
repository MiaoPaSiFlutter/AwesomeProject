import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/flutter_to_do_app.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../home/homecontroller.dart';

class DoneList extends StatelessWidget {
  DoneList({Key? key}) : super(key: key);
  final control = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => control.doneTodos.isNotEmpty
        ? ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 2.0.wp, horizontal: 5.0.wp),
                child: Text(
                  'Completed (${control.doneTodos.length})',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              ...control.doneTodos
                  .map((element) => Dismissible(
                        key: ObjectKey(element),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => control.deleteDoneTodo(element),
                        background: Container(
                          color: Colors.red.withOpacity(0.8),
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 3.0.wp, horizontal: 9.0.wp),
                          child: Row(
                            children: [
                              const Flexible(
                                flex: 1,
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 9,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 4.0.wp),
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      child: Text(
                                        element['title'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList()
            ],
          )
        : Container());
  }
}
