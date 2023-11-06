import 'package:flutter/material.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app.dart';

import 'package:provider/provider.dart';

class TagWidget extends StatelessWidget {
  final String tagName;
  final Color tagColor;

  const TagWidget({
    super.key,
    required this.tagName,
    required this.tagColor,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;

    return Consumer<PreferenceSettingsProvider>(
      builder: (context, preferenceSettingsProvider, _) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 8.0,
          ),
          decoration: BoxDecoration(
            color: preferenceSettingsProvider.isDarkTheme
                ? blackColor80
                : whiteColor,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: preferenceSettingsProvider.isDarkTheme
                    ? blackColor80
                    : grayColor,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            tagName,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: tagColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }
}
