import 'package:flutter/material.dart';
import '../../../helpers/helpers_index.dart';

class IURProfileName extends StatelessWidget {
  const IURProfileName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Mauricio Lopez",
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: IURColors.white,
          ),
    );
  }
}
