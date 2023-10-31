import 'package:flutter/material.dart';
import 'package:flutter_mitchkoko/flutter_mitchkoko.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'controller.dart';

class MitchkokoHomeView extends GetView<MitchkokoHomeController> {
  const MitchkokoHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MitchkokoHomeController());
    return GetBuilder<MitchkokoHomeController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Mitchkoko"),
            ),
            body: SafeArea(
              child: ListView.builder(
                itemCount: controller.uiModels.length,
                itemBuilder: (context, index) {
                  return createItem(controller.uiModels[index]);
                },
              ),
            ));
      },
    );
  }
}

Widget createItem(InterestingUIModel uiModel) {
  return InkWell(
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Text(uiModel.title),
    ),
    onTap: () {
      //OrientationBuilder
      Navigator.of(Get.context!).push(MaterialPageRoute(builder: (_) {
        return uiModel.app;
      }));
    },
  );
}
