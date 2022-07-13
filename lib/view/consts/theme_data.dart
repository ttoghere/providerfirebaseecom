import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
      primaryColor: Colors.red[900],
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme ? Colors.black : Colors.white,
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor: isDarkTheme ? Colors.black : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light(),
          ),
    );
  }
}
