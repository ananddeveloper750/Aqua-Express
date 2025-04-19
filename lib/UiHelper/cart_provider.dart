import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  /// 🛒 Add item to Cart
  void addToCart(Map<String, dynamic> product) {
    int index = _cartItems.indexWhere((item) => item['id'] == product['id']);

    if (index != -1) {
      _cartItems[index]['quantity'] += 1;
    } else {
      product['quantity'] = 1;
      _cartItems.add(product);
    }

    notifyListeners();
  }


  /// ➖ Decrease Quantity
  void decreaseQuantity(int index) {
    if (_cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity'] -= 1;
    } else {
      _cartItems.removeAt(index); // अगर क्वांटिटी 1 है, तो remove कर दें
    }
    notifyListeners();
  }

  /// ➕ Increase Quantity
  void increaseQuantity(int index) {
    _cartItems[index]['quantity'] += 1;
    notifyListeners();
  }

  /// 🗑️ Remove item from Cart
  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}
