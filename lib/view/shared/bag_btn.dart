// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';

class BagButton extends StatelessWidget {
  final VoidCallback funcs;
  final bool isInCart;
  const BagButton({
    Key? key,
    required this.funcs,
    required this.isInCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context: context).color;
    return GestureDetector(
      onTap: () {
        funcs;
      },
      child: Icon(
        isInCart ? IconlyBold.bag2 : IconlyLight.bag2,
        color: isInCart ? Colors.green : color,
        size: 18,
      ),
    );
  }
}
