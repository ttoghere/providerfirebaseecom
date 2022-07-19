// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  PriceWidget({
    Key? key,
    required this.price,
    required this.textPrice,
    required this.isOnSale,
    required this.salePrice,
  }) : super(key: key);
  final double salePrice, price;
  final String textPrice;
  final bool isOnSale;
  @override
  Widget build(BuildContext context) {
    double userPrice = isOnSale ? salePrice : price;
    return FittedBox(
      child: Row(
        children: [
          Text(
            "${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}\$",
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.green[600], fontSize: 14),
          ),
          SizedBox(
            width: 5,
          ),
          Visibility(
            visible: isOnSale ? true : false,
            child: Text(
              "${(price * int.parse(textPrice)).toStringAsFixed(2)}\$",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 12, decoration: TextDecoration.lineThrough),
            ),
          ),
        ],
      ),
    );
  }
}
