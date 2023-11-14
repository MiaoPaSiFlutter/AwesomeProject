import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../../compontents/compontents_index.dart';
import '../../../helper/helper_index.dart';
import '../../../providers/providers_index.dart';
import '../../../utils/utils_index.dart';
import '../datas/data.dart';
import 'FadeThroughTransitionSwitcher.dart';
import 'waterfall_notched_rectangle.dart';

class AnimatedBottomAppBar extends StatelessWidget {
  const AnimatedBottomAppBar({
    super.key,
    required this.bottomAppBarController,
    required this.bottomAppBarCurve,
    required this.bottomDrawerVisible,
    required this.drawerController,
    required this.dropArrowCurve,
    required this.toggleBottomDrawerVisibility,
  });

  final AnimationController bottomAppBarController;
  final Animation<double> bottomAppBarCurve;
  final bool bottomDrawerVisible;
  final AnimationController drawerController;
  final Animation<double> dropArrowCurve;
  final VoidCallback toggleBottomDrawerVisibility;

  @override
  Widget build(BuildContext context) {
    var fadeOut = Tween<double>(begin: 1, end: -1).animate(
      drawerController.drive(CurveTween(curve: standardEasing)),
    );

    return Selector<EmailStore, bool>(
      selector: (context, emailStore) => emailStore.onMailView,
      builder: (context, onMailView, child) {
        bottomAppBarController.forward();

        return SizeTransition(
          sizeFactor: bottomAppBarCurve,
          axisAlignment: -1,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 2),
            child: BottomAppBar(
              shape: const WaterfallNotchedRectangle(),
              notchMargin: 6,
              child: Container(
                color: Colors.transparent,
                height: kToolbarHeight,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      onTap: toggleBottomDrawerVisibility,
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          RotationTransition(
                            turns: Tween(
                              begin: 0.0,
                              end: 1.0,
                            ).animate(dropArrowCurve),
                            child: const Icon(
                              Icons.arrow_drop_up,
                              color: ReplyColors.white50,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const _ReplyLogo(),
                          const SizedBox(width: 10),
                          //TODO：通过消失的邮箱标题之间的过渡添加淡入淡出（运动）
                          FadeThroughTransitionSwitcher(
                            fillColor: Colors.transparent,
                            child: onMailView
                                ? const SizedBox(width: 48)
                                : FadeTransition(
                                    opacity: fadeOut,
                                    child: Selector<EmailStore, String>(
                                      selector: (context, emailStore) =>
                                          emailStore.currentlySelectedInbox,
                                      builder: (
                                        context,
                                        currentlySelectedInbox,
                                        child,
                                      ) {
                                        return Text(
                                          currentlySelectedInbox,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                color: ReplyColors.white50,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: BottomAppBarActionItems(
                          drawerController: drawerController,
                          drawerVisible: bottomDrawerVisible,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BottomAppBarActionItems extends StatelessWidget {
  const BottomAppBarActionItems({
    super.key,
    required this.drawerController,
    required this.drawerVisible,
  });

  final AnimationController drawerController;
  final bool drawerVisible;

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailStore>(
      builder: (context, model, child) {
        final onMailView = model.onMailView;
        var radius = const Radius.circular(12);
        final modalBorder = BorderRadius.only(
          topRight: radius,
          topLeft: radius,
        );
        Color? starIconColor;

        if (onMailView) {
          var currentEmailStarred = false;

          if (model.emails[model.currentlySelectedInbox]!.isNotEmpty) {
            currentEmailStarred = model.isEmailStarred(
              model.emails[model.currentlySelectedInbox]!
                  .elementAt(model.currentlySelectedEmailId),
            );
          }

          starIconColor = currentEmailStarred
              ? Theme.of(context).colorScheme.secondary
              : ReplyColors.white50;
        }

        //TODO：通过底部应用栏操作（运动）之间的过渡添加淡入淡出
        return FadeThroughTransitionSwitcher(
          fillColor: Colors.transparent,
          child: drawerVisible
              ? Align(
                  key: UniqueKey(),
                  alignment: AlignmentDirectional.bottomEnd,
                  child: IconButton(
                    icon: const Icon(Icons.settings),
                    color: ReplyColors.white50,
                    onPressed: () async {
                      drawerController.reverse();
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: modalBorder,
                        ),
                        builder: (context) => const SettingsBottomSheet(),
                      );
                    },
                  ),
                )
              : onMailView
                  ? Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: ImageIcon(
                            Image.asset(Utils.assets('images/twotone_star.png'))
                                .image,
                            color: starIconColor,
                          ),
                          onPressed: () {
                            model.starEmail(
                              model.currentlySelectedInbox,
                              model.currentlySelectedEmailId,
                            );
                            if (model.currentlySelectedInbox == 'Starred') {
                              mobileMailNavKey.currentState!.pop();
                              model.currentlySelectedEmailId = -1;
                            }
                          },
                          color: ReplyColors.white50,
                        ),
                        IconButton(
                          icon: ImageIcon(
                            Image.asset(
                                    Utils.assets('images/twotone_delete.png'))
                                .image,
                          ),
                          onPressed: () {
                            model.deleteEmail(
                              model.currentlySelectedInbox,
                              model.currentlySelectedEmailId,
                            );

                            mobileMailNavKey.currentState!.pop();
                            model.currentlySelectedEmailId = -1;
                          },
                          color: ReplyColors.white50,
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                          color: ReplyColors.white50,
                        ),
                      ],
                    )
                  : Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: IconButton(
                        icon: const Icon(Icons.search),
                        color: ReplyColors.white50,
                        onPressed: () {
                          Provider.of<RouterProvider>(
                            context,
                            listen: false,
                          ).routePath = const ReplySearchPath();
                        },
                      ),
                    ),
        );
      },
    );
  }
}

class _ReplyLogo extends StatelessWidget {
  const _ReplyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      Image.asset(Utils.assets('images/twotone_delete.png')).image,
      size: 32,
      color: ReplyColors.white50,
    );
  }
}
