// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WishlistItem with ChangeNotifier {
  final String id;
  final String productId;
  WishlistItem({
    required this.id,
    required this.productId,
  });
}
