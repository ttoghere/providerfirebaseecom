import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(
          color: isDarkTheme ? Colors.blue[300] : Colors.red[900],
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        headline2: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.w500,
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
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
