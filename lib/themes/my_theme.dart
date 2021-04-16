import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }

  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
          textTheme: TextTheme(
            headline3: TextStyle(color: Color(0xfffed8b5)),
            subtitle1: TextStyle(color: Color(0xfffed8b5)),
            bodyText1: TextStyle(color: Color(0xfffed8b5)),
          ),
          scaffoldBackgroundColor: Color(0xff5b7fa9),
          appBarTheme: AppBarTheme(
            color: Color(0xffa2a5d5),
            elevation: 0.0,
            textTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: Colors.yellow,
              ),
            ),
          ),
          accentColor: Colors.yellow,
        );
      case ThemeType.Dark:
        return ThemeData(
          textTheme: TextTheme(
            headline3: TextStyle(color: Color(0xff080208), letterSpacing: 2.0),
            subtitle1: TextStyle(color: Color(0xff080208)),
            bodyText1: TextStyle(color: Color(0xff080208)),
          ),
          scaffoldBackgroundColor: Color(0xff281d36),
          appBarTheme: AppBarTheme(
            color: Color(0xff443781),
            centerTitle: true,
            elevation: 0.0,
            textTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 20,
                color: Color(0xff191633),
              ),
            ),
          ),
          accentColor: Colors.grey.shade400,
        );
      case ThemeType.Other:
        return ThemeData(
          textTheme: TextTheme(
            headline3: TextStyle(color: Color(0xff3b6c6d)),
            subtitle1: TextStyle(color: Color(0xff3b6c6d)),
            bodyText1: TextStyle(color: Color(0xff3b6c6d)),
          ),
          scaffoldBackgroundColor: Color(0xff091918),
          appBarTheme: AppBarTheme(
            color: Color(0xff2f7784),
            centerTitle: true,
            elevation: 0.0,
            textTheme: TextTheme(
              headline6: TextStyle(
                decoration: TextDecoration.combine([
                  TextDecoration.overline,
                  TextDecoration.underline,
                ]),
                decorationStyle: TextDecorationStyle.wavy,
                fontSize: 24,
                color: Color(0xff091918),
              ),
            ),
          ),
          accentColor: Colors.grey.shade400,
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}
