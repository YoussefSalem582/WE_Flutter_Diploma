import 'package:flutter/material.dart';
import '../admin/product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  double get totalPrice {
    return _cart.fold(0.0, (sum, item) => sum + item.price);
  }
}
