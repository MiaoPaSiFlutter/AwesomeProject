import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../tab/burger_tab.dart';
import '../tab/donut_tab.dart';
import '../tab/pancake_tab.dart';
import '../tab/pizza_tab.dart';
import '../tab/smoothie_tab.dart';
import '../util/my_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // my tabs
  List<Widget> myTabs = [
    // donut tab
    MyTab(
      iconPath: NormalModuleUtils.configPackagesImage(
          packagename: "flutter_mitchkoko",
          name: "assets/DonutAppUI/images/donut.png"),
    ),

    // burger tab
    MyTab(
      iconPath: NormalModuleUtils.configPackagesImage(
          packagename: "flutter_mitchkoko",
          name: "assets/DonutAppUI/images/burger.png"),
    ),

    // smoothie tab
    MyTab(
      iconPath: NormalModuleUtils.configPackagesImage(
          packagename: "flutter_mitchkoko",
          name: "assets/DonutAppUI/images/smoothie.png"),
    ),

    // pancake tab
    MyTab(
      iconPath: NormalModuleUtils.configPackagesImage(
          packagename: "flutter_mitchkoko",
          name: "assets/DonutAppUI/images/pancakes.png"),
    ),

    // pizza tab
    MyTab(
      iconPath: NormalModuleUtils.configPackagesImage(
          packagename: "flutter_mitchkoko",
          name: "assets/DonutAppUI/images/pizza.png"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey[800],
                size: 36,
              ),
              onPressed: () {
                // open drawer
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey[800],
                  size: 36,
                ),
                onPressed: () {
                  // account button tapped
                },
              ),
            )
          ],
        ),
        body: Column(
          children: [
            // i want to eat
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
              child: Row(
                children: [
                  Text(
                    'I want to eat',
                    style: TextStyle(fontSize: 24, color: Colors.grey[600]),
                  ),
                  const Text(
                    ' EAT',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // tab bar
            TabBar(tabs: myTabs),

            // tab bar view
            Expanded(
              child: TabBarView(
                children: [
                  // donut page
                  DonutTab(),

                  // burger page
                  BurgerTab(),

                  // smoothie page
                  SmoothieTab(),

                  // pancake page
                  PancakeTab(),

                  // pizza page
                  PizzaTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}