// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../helper/helper_index.dart';
import '../util/donut_tile.dart';

class DonutTab extends StatelessWidget {
  DonutTab({super.key});

  // list of donuts
  List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, Utils.assets("images/icecream_donut.png")],
    [
      "Strawberry",
      "45",
      Colors.red,
      Utils.assets("images/strawberry_donut.png")
    ],
    ["Grape Ape", "84", Colors.purple, Utils.assets("images/grape_donut.png")],
    ["Choco", "95", Colors.brown, Utils.assets("images/chocolate_donut.png")],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.6,
      ),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3],
        );
      },
    );
  }
}
