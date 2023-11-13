import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app.dart';

class ButtonSigninWith extends StatelessWidget {
  final bool positionButtom;

  const ButtonSigninWith({
    Key? key,
    required this.positionButtom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
      builder: (context, preferenceSettingsProvider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ButtonSigninWidget(
                onPress: () => context.showCustomFlashMessage(
                  status: 'info',
                  positionBottom: positionButtom,
                ),
                title: 'FACEBOOK',
                icon: Utils.assets('icons/facebook.png'),
                buttonColor: preferenceSettingsProvider.isDarkTheme
                    ? blackColor80
                    : whiteColor,
                titleColor: preferenceSettingsProvider.isDarkTheme
                    ? whiteColor
                    : blackColor,
                shadowColor: preferenceSettingsProvider.isDarkTheme
                    ? blackColor50
                    : grayColor20,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: ButtonSigninWidget(
                onPress: () => context.showCustomFlashMessage(
                  status: 'info',
                  positionBottom: positionButtom,
                ),
                title: 'GOOGLE',
                icon: Utils.assets('icons/google.png'),
                buttonColor: preferenceSettingsProvider.isDarkTheme
                    ? blackColor80
                    : whiteColor,
                titleColor: preferenceSettingsProvider.isDarkTheme
                    ? whiteColor
                    : blackColor,
                shadowColor: preferenceSettingsProvider.isDarkTheme
                    ? blackColor50
                    : grayColor20,
              ),
            ),
          ],
        );
      },
    );
  }
}
