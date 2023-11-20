import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../../providers/providers_index.dart';
import '../../../utils/utils_index.dart';

class BottomDrawerDestinations extends StatelessWidget {
  const BottomDrawerDestinations({
    super.key,
    required this.destinations,
    required this.drawerController,
    required this.dropArrowController,
    required this.onItemTapped,
  });

  final List<Destination> destinations;
  final AnimationController drawerController;
  final AnimationController dropArrowController;
  final ValueChanged<String> onItemTapped;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        for (var destination in destinations)
          InkWell(
            onTap: () {
              onItemTapped(destination.name);
              drawerController.reverse();
              dropArrowController.forward();
            },
            child: Selector<EmailStore, String>(
              selector: (context, emailStore) =>
                  emailStore.currentlySelectedInbox,
              builder: (context, currentlySelectedInbox, child) {
                return ListTile(
                  leading: ImageIcon(
                    AssetImage(
                      destination.icon,
                    ),
                    color: destination.name == currentlySelectedInbox
                        ? theme.colorScheme.secondary
                        : ReplyColors.white50.withOpacity(0.64),
                  ),
                  title: Text(
                    destination.name,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: destination.name == currentlySelectedInbox
                          ? theme.colorScheme.secondary
                          : ReplyColors.white50.withOpacity(0.64),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class Destination {
  const Destination({
    required this.name,
    required this.icon,
    required this.index,
  });

  final String name;
  final String icon;
  final int index;
}
