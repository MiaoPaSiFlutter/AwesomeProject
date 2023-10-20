import 'package:flutter/material.dart';
import '../model/skateboards.dart';
import '../provider/indexNotifier.dart';
import 'package:provider/provider.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key? key}) : super(key: key);

  _indicator(bool isActive) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.black : Colors.transparent,
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider.of<IndexNotifier>(context).index;

    List<Widget> _buildIndicator() {
      List<Widget> indicators = [];
      for (var i = 0; i < Skateboards.hotelList.length; i++) {
        indicators
            .add(i == currentIndex ? _indicator(true) : _indicator(false));
      }
      return indicators;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Row(
        children: _buildIndicator(),
      ),
    );
  }
}
