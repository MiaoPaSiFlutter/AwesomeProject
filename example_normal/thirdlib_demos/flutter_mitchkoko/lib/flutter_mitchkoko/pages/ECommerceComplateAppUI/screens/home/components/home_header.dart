import 'package:flutter/material.dart';
import '../../../globals/globals_index.dart';
import '../../../helper/helper_index.dart';
import '../../screen_index.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconBtnWithCounter(
            svgSrc: Utils.assets("icons/Cart Icon.svg"),
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            svgSrc: Utils.assets("icons/Bell.svg"),
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
