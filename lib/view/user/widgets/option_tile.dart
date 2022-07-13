// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final IconData icon;
  const OptionTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      onTap: onTap,
      leading: Icon(icon),
      trailing: Icon(IconlyBold.arrowRight2),
    );
  }
}
