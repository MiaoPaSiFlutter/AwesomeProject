import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'values/values.dart';

const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

TextTheme _buildTextTheme(BuildContext context) {
  return TextTheme(
    displayLarge: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_36,
      color: AppColors.primaryText,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    displayMedium: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_36,
      color: AppColors.primaryText,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_36,
      color: AppColors.primaryText,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    headlineLarge: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_36,
      color: AppColors.primaryText,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    headlineMedium: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.primaryText,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.primaryText,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_20,
      color: AppColors.primaryText,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.primaryText,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.primaryText,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_20,
      color: AppColors.primaryText,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.primaryText,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.primaryText,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
    ),
  );
}

ThemeData buildLightTheme(BuildContext context) {
  const Color primaryColor = AppColors.primaryColor;
  const Color secondaryColor = AppColors.secondaryColor;
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    // buttonColor: AppColors.secondaryColor,
    indicatorColor: Colors.white,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    // accentColor: secondaryColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    iconTheme: const IconThemeData(color: AppColors.iconColor),
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: Sizes.ELEVATION_4,
      color: Colors.white,
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
      buttonColor: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.SIZE_8),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.secondaryColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.secondaryColor;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.secondaryColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.secondaryColor;
        }
        return null;
      }),
    ),
    colorScheme: colorScheme
        .copyWith(background: Colors.white)
        .copyWith(error: AppColors.errorColor),
  );
  return base.copyWith(
    textTheme: _buildTextTheme(context),
    primaryTextTheme: _buildTextTheme(context),
  );
}

//ThemeData _buildDarkTheme() {
//  const Color primaryColor = Color(0xFF0175c2);
//  const Color secondaryColor = Color(0xFF13B9FD);
//  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
//    primary: primaryColor,
//    secondary: secondaryColor,
//  );
//  final ThemeData base = ThemeData(
//    brightness: Brightness.dark,
//    accentColorBrightness: Brightness.dark,
//    primaryColor: primaryColor,
//    primaryColorDark: const Color(0xFF0050a0),
//    primaryColorLight: secondaryColor,
//    buttonColor: primaryColor,
//    indicatorColor: Colors.white,
//    toggleableActiveColor: const Color(0xFF6997DF),
//    accentColor: secondaryColor,
//    canvasColor: const Color(0xFF202124),
//    scaffoldBackgroundColor: const Color(0xFF202124),
//    backgroundColor: const Color(0xFF202124),
//    errorColor: const Color(0xFFB00020),
//    buttonTheme: ButtonThemeData(
//      colorScheme: colorScheme,
//      textTheme: ButtonTextTheme.primary,
//    ),
//  );
//  return base.copyWith(
//    textTheme: _buildTextTheme(base.textTheme),
//    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
//    accentTextTheme: _buildTextTheme(base.accentTextTheme),
//  );
//}
