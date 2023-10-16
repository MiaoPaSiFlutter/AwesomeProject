import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 自定义AppBar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {Key? key,
      this.backgroundColor,
      this.title = "",
      this.centerTitle = "",
      this.actionName = "",
      this.backImg = "assets/images/else/ic_back_black.png",
      this.onPressed,
      this.isBack = true})
      : super(key: key);

  final Color? backgroundColor;
  final String title;
  final String centerTitle;
  final String backImg;
  final String actionName;
  final VoidCallback? onPressed;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle.dark;
    if (backgroundColor != null &&
        ThemeData.estimateBrightnessForColor(backgroundColor!) ==
            Brightness.dark) {
      overlayStyle = SystemUiOverlayStyle.light;
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Material(
        color: backgroundColor,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: centerTitle.isEmpty
                        ? Alignment.centerLeft
                        : Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Text(title.isEmpty ? centerTitle : title,
                        style: TextStyle(
                          fontSize: 18,
                          color: overlayStyle == SystemUiOverlayStyle.light
                              ? Colors.black
                              : Colors.white,
                        )),
                  )
                ],
              ),
              isBack
                  ? IconButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.maybePop(context);
                      },
                      padding: const EdgeInsets.all(12.0),
                      icon: Image.asset(
                        backImg,
                        color: overlayStyle == SystemUiOverlayStyle.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    )
                  : Container(),
              Positioned(
                right: 0.0,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    buttonTheme: const ButtonThemeData(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      minWidth: 60.0,
                    ),
                  ),
                  child: actionName.isEmpty
                      ? Container()
                      : TextButton(
                          onPressed: onPressed,
                          child: Text(actionName, key: const Key('actionName')),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}
