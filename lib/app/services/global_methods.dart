import 'package:flutter/material.dart';

class GlobalMethods {
  static navigateTo(
      {required BuildContext context, required String routeName}) {
    Navigator.of(context).pushNamed(routeName);
  }
}
