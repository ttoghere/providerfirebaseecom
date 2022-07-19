// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final String id;
  final int quantity;
  final String productId;
  Cart({
    required this.id,
    required this.quantity,
    required this.productId,
  });
}
