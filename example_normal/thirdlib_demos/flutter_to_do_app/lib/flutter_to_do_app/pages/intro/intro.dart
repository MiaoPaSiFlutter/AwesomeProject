import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/flutter_to_do_app.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'introcontroller.dart';

class Intro extends GetView<IntroController> {
  Intro({Key? key}) : super(key: key);

  @override
  get controller => Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F2F1),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                controller: controller.pagecontroller,
                onPageChanged: controller.currentIndex,
                itemCount: controller.contents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                              controller.contents[index].imageName ?? ""),
                          width: 340,
                          height: 340,
                        ),
                        SizedBox(
                          height: 10.0.hp,
                        ),
                        Text(
                          controller.contents[index].title ?? "",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(
                          height: 1.0.hp,
                        ),
                        Text(
                          controller.contents[index].description ?? "",
                          style: Theme.of(context).textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              )),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(controller.contents.length, (index) {
                    return Obx(() {
                      return Container(
                        height: 15,
                        width: controller.currentIndex.value == index ? 55 : 30,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 7,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: controller.currentIndex.value == index
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                        ),
                      );
                    });
                  }),
                ),
              ),
              SizedBox(
                height: 10.0.hp,
              ),
              Obx(() {
                return Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  width: 60.0.wp,
                  height: 10.0.hp,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.actionbutton();
                      },
                      child: Text(
                        controller.currentIndex.value ==
                                controller.contents.length - 1
                            ? "Continue"
                            : "Next",
                        style: Theme.of(context).textTheme.displaySmall,
                      )),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
