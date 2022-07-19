import 'package:flutter/material.dart';
import 'package:providerfirebaseecom/app/classes/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};
  Map<String, Cart> get getCartItems {
    return _cartItems;
  }

  void addProductsToCart({
    required String productId,
    required int quantity,
  }) {
    _cartItems.putIfAbsent(
        productId,
        () => Cart(
              id: DateTime.now().toString(),
              quantity: quantity,
              productId: productId,
            ));
    notifyListeners();
  }

  void reduceQuantityByOne(String productId) {
    _cartItems.update(
      productId,
      (value) => Cart(
        id: value.id,
        productId: productId,
        quantity: value.quantity - 1,
      ),
    );

    notifyListeners();
  }

  void increaseQuantityByOne(String productId) {
    _cartItems.update(
      productId,
      (value) => Cart(
        id: value.id,
        productId: productId,
        quantity: value.quantity + 1,
      ),
    );
    notifyListeners();
  }

  void removeOneItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
