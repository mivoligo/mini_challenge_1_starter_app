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
            ),
            accentColor: Colors.yellow);
      case ThemeType.Dark:
        return ThemeData();
      case ThemeType.Other:
        return ThemeData();
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}
