import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../models/tu_chong_model.dart';

class ExampleTuTagsWidget extends CommonLessV {
  final TuChongItem tuChongItem;
  @override
  bool get isNeedScaffol => false;

  ExampleTuTagsWidget({
    super.key,
    required this.tuChongItem,
  });

  @override
  configBoxDecoreation() {
    return null;
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Container();
    body = Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        ...List.generate(
          tuChongItem.tagColors?.length ?? 0,
          (index) {
            Widget body = Container(
              decoration: BoxDecoration(
                color: tuChongItem.tagColors?[index],
                borderRadius: BorderRadius.circular(
                  4.r,
                ),
                boxShadow: [
                  configShadow(),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.w),
              child: Text(
                tuChongItem.tags?[index] ?? "",
                style: HzyTextStyle.fontMedium(
                  size: 12.sp,
                  color: Colors.white,
                ),
              ),
            );
            return body;
          },
        ),
      ],
    );
    return body;
  }
}
