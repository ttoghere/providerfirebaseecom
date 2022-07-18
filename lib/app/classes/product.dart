// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final String productCategoryName;
  final double price;
  final double salePrice;
  final bool isOnSale;
  final bool isPiece;
  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.salePrice,
    required this.isOnSale,
    required this.isPiece,
    required this.productCategoryName,
  });
}
