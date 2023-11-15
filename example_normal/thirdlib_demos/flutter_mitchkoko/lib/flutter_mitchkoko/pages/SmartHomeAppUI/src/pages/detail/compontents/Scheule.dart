import 'package:flutter/material.dart';

import '../../../controllers/smart_home_data.dart';
import '../../../widgets/Ktext.dart';
import '../../../widgets/hex_color.dart';
import 'ScheuleItem.dart';

class Scheule extends StatefulWidget {
  const Scheule({super.key});

  @override
  State<Scheule> createState() => _ScheuleState();
}

class _ScheuleState extends State<Scheule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#D8E4E8'),
        borderRadius: const BorderRadius.only(topRight: Radius.circular(40)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 2),
            child: Row(
              children: [
                KText(
                  text: 'Scheule ',
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: HexColor('#4C7380'),
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: KText(
                      text: '3',
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Card(
                    child: Icon(
                      Icons.add,
                      size: 32,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: smartModel.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (BuildContext context, int index) {
              final item = smartModel[index];
              return ScheuleItem(item: item);
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
