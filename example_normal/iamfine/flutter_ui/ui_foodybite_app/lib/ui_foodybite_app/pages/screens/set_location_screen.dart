import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../routes/router.gr.dart';
import '../values/values.dart';
import '../widgets/dark_overlay.dart';
import '../widgets/potbelly_button.dart';
import '../widgets/spaces.dart';

class SetLocationScreen extends StatelessWidget {
  const SetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: Decorations.regularDecoration,
        child: Stack(
          children: [
            Positioned(
              child: Image.asset(
                ImagePath.salad,
                fit: BoxFit.cover,
                height: heightOfScreen,
                width: widthOfScreen,
              ),
            ),
            DarkOverLay(
              gradient: Gradients.fullScreenOverGradient,
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SpaceH40(),
                    Align(
                      alignment: Alignment.topRight,
                      child: _buildSkipButton(context),
                    ),
                    SpaceH200(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          StringConst.HELLO_MESSAGE,
                          textAlign: TextAlign.left,
                          style: Styles.customTitleTextStyle(
                            fontSize: Sizes.TEXT_SIZE_32,
                          ),
                        ),
                        SpaceH16(),
                        RichText(
                          text: TextSpan(
                            style: Styles.customTitleTextStyle(
                              fontSize: Sizes.TEXT_SIZE_32,
                            ),
                            children: [
                              const TextSpan(
                                  text: StringConst.WELCOME_MESSAGE + " "),
                              TextSpan(
                                text: StringConst.FOODY_BITE,
                                style: Styles.customTitleTextStyle(
                                  fontSize: Sizes.TEXT_SIZE_32,
                                  color: AppColors.kFoodyBiteYellow,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      child: Text(
                        StringConst.TURN_GPS_DESCRIPTION,
                        textAlign: TextAlign.left,
                        style: Styles.customMediumTextStyle(
                          fontSize: Sizes.TEXT_SIZE_22,
                        ),
                      ),
                    ),
                    const Spacer(),
                    PotbellyButton(
                      StringConst.TURN_GPS,
                      buttonWidth: widthOfScreen,
                      onTap: () =>
                          AutoRouter.of(context).replaceAll([RootScreen()]),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton(BuildContext context) {
    return InkWell(
      onTap: () => AutoRouter.of(context).replaceAll([RootScreen()]),
      child: Container(
        width: 80,
        height: 40,
        decoration: Decorations.customDecoration(
          color: AppColors.fillColor,
        ),
        child: Center(
          child: Text(
            StringConst.SKIP,
            textAlign: TextAlign.center,
            style: Styles.customNormalTextStyle(),
          ),
        ),
      ),
    );
  }
}
