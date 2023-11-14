// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import '../../../utils/utils_index.dart';

class BottomDrawerFolderSection extends StatelessWidget {
  const BottomDrawerFolderSection({super.key, required this.folders});

  final Map<String, String> folders;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        for (var folder in folders.keys)
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: ImageIcon(
                AssetImage(
                  folders[folder]!,
                ),
                color: ReplyColors.white50.withOpacity(0.64),
              ),
              title: Text(
                folder,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: ReplyColors.white50.withOpacity(0.64),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
