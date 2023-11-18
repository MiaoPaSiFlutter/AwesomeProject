import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

import 'models.dart';
import 'utils.dart';

class LargeDataPage extends StatefulWidget {
  const LargeDataPage({super.key});

  @override
  _LargeDataPageState createState() => _LargeDataPageState();
}

class _LargeDataPageState extends State<LargeDataPage> {
  List<CityModel> cityList = [];
  int numberOfItems = 10000;
  double susItemHeight = 40;

  @override
  void initState() {
    super.initState();
    int i = 0;
    cityList = List.generate(numberOfItems, (index) {
      if (index > (i + 1) * 385) {
        i = i + 1;
      }
      String tag = kIndexBarData[i];
      CityModel model = CityModel(name: '$tag $index', tagIndex: tag);
      return model;
    });
    SuspensionUtil.setShowSuspensionStatus(cityList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('10000 data'),
      ),
      body: AzListView(
        data: cityList,
        itemCount: cityList.length,
        itemBuilder: (BuildContext context, int index) {
          CityModel model = cityList[index];
          return Utils.getListItem(context, model);
        },
        physics: const BouncingScrollPhysics(),
        susItemHeight: susItemHeight,
        susItemBuilder: (BuildContext context, int index) {
          CityModel model = cityList[index];
          return Utils.getSusItem(context, model.getSuspensionTag());
        },
      ),
    );
  }
}
