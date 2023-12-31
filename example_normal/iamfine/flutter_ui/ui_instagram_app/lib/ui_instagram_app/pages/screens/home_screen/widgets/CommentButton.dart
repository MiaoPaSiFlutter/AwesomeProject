import 'package:flutter/material.dart';

import '../../../helpers/helpers_index.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 25,
      right: 20,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: IURColors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: SvgIconsHelper.fromSvg(
          svgPath: Utils.assets("icons/comment.svg"),
          semanticLabel: "comment icon",
          color: IURColors.black,
        ),
      ),
    );
  }
}
