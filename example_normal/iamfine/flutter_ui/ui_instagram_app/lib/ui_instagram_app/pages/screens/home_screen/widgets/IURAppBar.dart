import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../helpers/helpers_index.dart';

class IURAppBar extends StatelessWidget {
  const IURAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(
            appBarItems.length,
            (i) => Stack(
              clipBehavior: Clip.none,
              children: [
                Semantics(
                  label: appBarItems[i]["semanticLabel"],
                  child: SvgIconsHelper.fromSvg(
                    svgPath: appBarItems[i]["svgPath"]!,
                    semanticLabel: appBarItems[i]["semanticLabel"]!,
                  ),
                ),
                if (appBarItems[i]["svgPath"] ==
                    Utils.assets("icons/message.svg")) ...[
                  Positioned(
                    top: -5,
                    right: -5,
                    child: Semantics(
                      label: "Messages count badge",
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: IURColors.pink,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: AutoSizeText(
                            "2",
                            maxLines: 1,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<Map<String, String>> appBarItems = [
  {
    "semanticLabel": "plus button",
    "svgPath": Utils.assets("icons/plus.svg"),
  },
  {
    "semanticLabel": "instagram logo",
    "svgPath": Utils.assets("images/Instagram_logo.svg"),
  },
  {
    "semanticLabel": "message icon",
    "svgPath": Utils.assets("icons/message.svg"),
  },
];
