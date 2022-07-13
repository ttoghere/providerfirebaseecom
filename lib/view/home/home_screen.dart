import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/providers/dark_theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: Text("Theme"),
          secondary: themeState.getDarkTheme
              ? Icon(Icons.dark_mode_outlined)
              : Icon(Icons.light_mode_outlined),
          onChanged: (value) {
            themeState.setDarkTheme = value;
          },
          value: themeState.getDarkTheme,
        ),
      ),
    );
  }
}
