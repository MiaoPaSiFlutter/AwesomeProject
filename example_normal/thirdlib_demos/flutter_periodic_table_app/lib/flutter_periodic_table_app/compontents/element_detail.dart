import 'package:flutter/material.dart';
import '../pages/model_3d_page.dart';
import '../tools/tools_index.dart';

import 'default_button.dart';
import 'reusable_area.dart';

class ElementDetail extends StatelessWidget {
  final List<Widget> detailInfo;
  final String model3D;
  const ElementDetail(
      {Key? key, required this.detailInfo, required this.model3D})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            for (var widget in detailInfo)
              ReusableArea(
                color: kBodyBackgroundColor,
                cardChild: widget,
                isCenter: false,
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DefaultButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Model3DPage(
                              modelLink: model3D,
                            )));
              },
              text: '3D Model',
              iconData: Icons.model_training,
            ),
          ],
        ),
      ],
    );
  }
}
