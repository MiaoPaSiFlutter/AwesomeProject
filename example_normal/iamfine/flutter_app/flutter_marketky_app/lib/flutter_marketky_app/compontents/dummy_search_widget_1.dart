import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../tools/tools_index.dart';

class DummySearchWidget1 extends StatelessWidget {
  final Function()? onTap;

  const DummySearchWidget1({super.key, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              child: SvgPicture.asset(
                Utils.assets('icons/Search.svg'),
                color: Colors.black,
                width: 18,
                height: 18,
              ),
            ),
            const Text(
              'Find a product...',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
