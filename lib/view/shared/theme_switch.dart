import 'package:flutter/material.dart';

import '../../app/providers/dark_theme_provider.dart';
class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    Key? key,
    required this.themeState,
  }) : super(key: key);

  final DarkThemeProvider themeState;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text("Theme"),
      secondary: themeState.getDarkTheme
          ? Icon(Icons.dark_mode_outlined)
          : Icon(Icons.light_mode_outlined),
      onChanged: (value) {
        themeState.setDarkTheme = value;
      },
      value: themeState.getDarkTheme,
    );
  }
}
