import '../tools/utils.dart';

class AppImages {
  static String imagePath = Utils.assets("images");
  static String imageThemePath = Utils.assets("theme_wallpaper");

  static String robot = "$imagePath/robot.png";

  //logo
  static String aiLogoWhite = Utils.assets("logo/logo_white.png");
  static String aiLogoBlack = Utils.assets("logo/logo_black.png");

  //tab bar
  static String cooking = "$imagePath/cooking.png";
  static String scienceQuestion = "$imagePath/question.png";
  static String developer = "$imagePath/web-development.png";
  static String math = "$imagePath/calculator.png";
  static String interview = "$imagePath/interview.png";
  static String resume = "$imagePath/profile.png";
  static String email = "$imagePath/write-mail.png";
  static String essay = "$imagePath/writing.png";

  //theme
  static String blueTheme = "$imageThemePath/blue_theme.jpg";
  static String pinkTheme = "$imageThemePath/pink-theme.jpg";
  static String whiteTheme = "$imageThemePath/white_theme.jpg";
  static String greenTheme = "$imageThemePath/green_theme.jpg";
  static String purpleTheme = "$imageThemePath/purple_theme.jpg";
}
