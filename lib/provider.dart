// cart_provider.dart
import 'package:flutter/foundation.dart';
import 'package:marketplace/cart.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItemToCart(CartItem item) {
    // Check if the item is already in the cart
    final existingItemIndex = cartItems.indexWhere((cartItem) =>
        cartItem.name == item.name && cartItem.image == item.image);

    if (existingItemIndex >= 0) {
      // If the item is already in the cart, increment the quantity
      cartItems[existingItemIndex].amount++;
    } else {
      // If the item is not in the cart, add it as a new item
      cartItems.add(item);
    }

    // Notify listeners that the cart has been updated
    notifyListeners();
  }

  void removeItemFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void updateCart() {
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }
}
