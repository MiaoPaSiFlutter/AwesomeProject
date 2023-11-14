import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'header_section_mobile.dart';
import 'header_section_web.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: const RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth <= const RefinedBreakpoints().tabletSmall) {
          return const HeaderSectionMobile();
        } else {
          return const HeaderSectionWeb();
        }
      },
    );
  }
}
