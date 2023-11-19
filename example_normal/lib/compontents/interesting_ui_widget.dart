import 'package:flutter/material.dart';

import '../models/interesting_ui_model.dart';

class InterestingUIWidget extends StatelessWidget {
  const InterestingUIWidget({super.key, required this.model});
  final InterestingUIModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: Text(model.title),
      ),
      onTap: () {
        //OrientationBuilder
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return model.app;
        }));
      },
    );
  }
}
