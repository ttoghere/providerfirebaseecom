import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class BagButton extends StatelessWidget {
  const BagButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        IconlyBold.bag2,
        size: 18,
      ),
    );
  }
}
