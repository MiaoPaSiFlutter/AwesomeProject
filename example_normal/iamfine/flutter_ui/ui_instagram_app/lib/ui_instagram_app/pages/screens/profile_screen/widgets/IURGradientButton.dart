import 'package:flutter/material.dart';

import '../../../helpers/helpers_index.dart';

class IURGradientFollowButton extends StatelessWidget {
  const IURGradientFollowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          colors: IURColors.instagramGradientColor.colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          "Follow",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: IURColors.white,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
