import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_screen_controller.dart';
import '../../../helpers/helpers_index.dart';

class IURProfileTabs extends GetView<ProfileScreenController> {
  IURProfileTabs({
    super.key,
  });
  @override
  final ProfileScreenController controller = Get.put(ProfileScreenController());
  @override
  Widget build(BuildContext context) {
    return Align(
      child: TabBar(
        enableFeedback: false,
        isScrollable: false,
        splashFactory: NoSplash.splashFactory,
        automaticIndicatorColorAdjustment: true,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelStyle: TextStyle(color: IURColors.black.withOpacity(.8)),
        controller: controller.tabController,
        indicatorColor: IURColors.pink,
        tabs: controller.tabsTexts
            .map((e) => Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      e,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
