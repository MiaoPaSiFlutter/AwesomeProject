import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_foodhub_app/flutter_foodhub_app.dart';

import 'widgets/button_signin_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage(Utils.assets('images/background_welcome.png')),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Utils.assets('images/welcome_gradient.png')),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          Container(
            padding: const EdgeInsets.all(28.0),
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                Image.asset(
                  Utils.assets('images/welcome_text.png'),
                  height: 100,
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Your favourite foods delivered \nfast at your door.',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: HexColor('#30384F'),
                    fontSize: 18,
                    height: 1.5,
                  ),
                ),
                const Spacer(flex: 3),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: Text(
                          'sign in with',
                          style: theme.textTheme.titleSmall!
                              .apply(color: whiteColor),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                const ButtonSigninWith(positionButtom: false),
                const SizedBox(height: 20.0),
                Expanded(
                  child: ButtonWidget(
                    onPress: () => Navigator.pushNamed(
                      context,
                      Routes.registerScreen,
                    ),
                    title: 'Start with email',
                    buttonColor: whiteColor.withOpacity(0.3),
                    titleColor: whiteColor,
                    borderColor: whiteColor,
                    paddingHorizontal: 16.0,
                    paddingVertical: 16.0,
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: context.theme.textTheme.titleSmall!.copyWith(
                        color: whiteColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.loginScreen,
                      ),
                      child: Text(
                        'Sign In',
                        style: context.theme.textTheme.titleSmall!.copyWith(
                          color: whiteColor,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: whiteColor,
                          decorationThickness: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
