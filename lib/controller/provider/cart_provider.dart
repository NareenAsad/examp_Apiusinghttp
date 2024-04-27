import 'package:examp_api_using_http/models/product.model.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<ProductElement> _products = [];

  List<ProductElement> get products => _products;

  void addToCart(ProductElement product) {
    _products.add(product);
    notifyListeners();
  }
}
