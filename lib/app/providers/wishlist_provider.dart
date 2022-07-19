import 'package:flutter/material.dart';
import 'package:providerfirebaseecom/app/classes/Wishlist.dart';

class WishlistProvider with ChangeNotifier {
  Map<String, WishlistItem> _WishlistItems = {};
  Map<String, WishlistItem> get getWishlistItems {
    return _WishlistItems;
  }

  void removeOneItem(String productId) {
    _WishlistItems.remove(productId);
    notifyListeners();
  }

  void clearWishlist() {
    _WishlistItems.clear();
    notifyListeners();
  }

  void addProductToWishlist({required String productId}) {
    if (_WishlistItems.containsKey(productId)) {
      removeOneItem(productId);
    } else {
      _WishlistItems.putIfAbsent(
        productId,
        () => WishlistItem(id: DateTime.now().toString(), productId: productId),
      );
    }
    notifyListeners();
  }
}
