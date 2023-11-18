import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import "package:animations/animations.dart";

import '../../../providers/providers_index.dart';
import '../../compose/compose_page.dart';
import 'FadeThroughTransitionSwitcher.dart';

class ReplyFab extends StatefulWidget {
  const ReplyFab({super.key});

  @override
  _ReplyFabState createState() => _ReplyFabState();
}

class _ReplyFabState extends State<ReplyFab>
    with SingleTickerProviderStateMixin {
  //TODO：通过撰写和回复 FAB（运动）之间的过渡添加淡入淡出
  static final fabKey = UniqueKey();
  static const double _mobileFabDimension = 56;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const circleFabBorder = CircleBorder();

    return Selector<EmailStore, bool>(
      selector: (context, emailStore) => emailStore.onMailView,
      builder: (context, onMailView, child) {
        //TODO：通过撰写和回复 FAB（运动）之间的过渡添加淡入淡出
        final fabSwitcher = FadeThroughTransitionSwitcher(
          fillColor: Colors.transparent,
          child: onMailView
              ? Icon(
                  Icons.reply_all,
                  key: fabKey,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.create,
                  color: Colors.black,
                ),
        );
        final tooltip = onMailView ? 'Reply' : 'Compose';

        //TODO：从 FAB 添加容器转换以撰写电子邮件页面（运动）
        return OpenContainer(
          openBuilder: (context, closedContainer) {
            return const ComposePage();
          },
          openColor: theme.cardColor,
          onClosed: (success) {
            Provider.of<EmailStore>(
              context,
              listen: false,
            ).onCompose = false;
          },
          closedShape: circleFabBorder,
          closedColor: theme.colorScheme.secondary,
          closedElevation: 6,
          closedBuilder: (context, openContainer) {
            return Tooltip(
              message: tooltip,
              child: InkWell(
                customBorder: circleFabBorder,
                onTap: () {
                  Provider.of<EmailStore>(
                    context,
                    listen: false,
                  ).onCompose = true;
                  openContainer();
                },
                child: SizedBox(
                  height: _mobileFabDimension,
                  width: _mobileFabDimension,
                  child: Center(
                    child: fabSwitcher,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
