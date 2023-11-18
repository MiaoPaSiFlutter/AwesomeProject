import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../../../../compontents/compontents_index.dart';
import '../../../../values/values.dart';

class NavSectionMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavSectionMobile({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.HEIGHT_50 + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
        color: AppColors.black100,
      ),
      child: Row(
        children: [
          const SpaceW20(),
          IconButton(
            icon: const Icon(
              FeatherIcons.menu,
              color: AppColors.white,
              size: Sizes.ICON_SIZE_26,
            ),
            onPressed: () {
              if (scaffoldKey.currentState!.isEndDrawerOpen) {
                scaffoldKey.currentState?.openEndDrawer();
              } else {
                scaffoldKey.currentState?.openDrawer();
              }
            },
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Image.asset(
              ImagePath.LOGO_LIGHT,
              height: Sizes.HEIGHT_52,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
