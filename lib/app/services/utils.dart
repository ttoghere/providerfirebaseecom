// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/providers/dark_theme_provider.dart';

class Utils {
  BuildContext context;
  Utils({
    required this.context,
  });

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get color => getTheme ? Colors.white : Colors.black;
}
