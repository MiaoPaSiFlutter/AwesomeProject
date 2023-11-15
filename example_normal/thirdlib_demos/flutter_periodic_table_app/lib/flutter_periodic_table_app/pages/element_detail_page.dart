import 'package:flutter/material.dart';

import '../compontents/compontents_index.dart';
import '../compontents/text_area.dart';
import '../tools/tools_index.dart';

class ElementDetailPage extends StatelessWidget {
  final ElementClass element;
  const ElementDetailPage({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ElementDetail(
        model3D: element.model_3D,
        detailInfo: [
          Image.network(
            element.bohrModelImage,
            width: 100,
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextArea("Name: ${element.name}"),
              TextArea("Symbol: ${element.symbol}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextArea("Block: ${element.block}"),
              TextArea("Period: ${element.period}"),
              TextArea("Group: ${element.group}"),
            ],
          ),
          TextArea(
            "Category: ${element.category.toTitleCase()}",
            isCenter: false,
          ),
          TextArea(
            "Phase: ${element.phase}",
            isCenter: false,
          ),
          TextArea(
            "Electron Configuration: ${element.electronConfiguration}",
            isCenter: false,
          ),
          Text(element.summary),
        ],
      ),
      title: Text(element.name),
    );
  }
}
