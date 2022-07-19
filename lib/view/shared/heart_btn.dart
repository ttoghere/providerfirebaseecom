// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import 'package:providerfirebaseecom/app/providers/wishlist_provider.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';

class HeartButton extends StatelessWidget {
  final String productId;
  final bool? isInWishlist;
  const HeartButton({
    Key? key,
    required this.productId,
    this.isInWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    Color color = Utils(context: context).color;
    return GestureDetector(
      onTap: () {
        wishlistProvider.addProductToWishlist(productId: productId);
      },
      child: Icon(
        isInWishlist != null && isInWishlist == true
            ? IconlyBold.heart
            : IconlyLight.heart,
        size: 18,
        color:
            isInWishlist != null && isInWishlist == true ? Colors.red : color,
      ),
    );
  }
}
