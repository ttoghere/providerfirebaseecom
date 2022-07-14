import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HeartButton extends StatelessWidget {
  const HeartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        IconlyBold.heart,
        size: 18,
      ),
    );
  }
}
