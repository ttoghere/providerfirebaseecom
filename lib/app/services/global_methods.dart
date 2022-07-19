import 'package:flutter/material.dart';

class GlobalMethods {
  static navigateTo(
      {required BuildContext context, required String routeName}) {
    Navigator.of(context).pushNamed(routeName);
  }

  static Future<void> warningDialog({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Function fct,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Text(subtitle),
        actions: [
          TextButton(
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            },
            child: Text(
              "No",
              style: TextStyle(color: Colors.red[900]),
            ),
          ),
          TextButton(
            onPressed: () {
              fct();
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            },
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.green[900]),
            ),
          ),
        ],
      ),
    );
  }
}
