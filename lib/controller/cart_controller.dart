import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/model/product_model.dart';

class CartController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<Product> _cartItem = [];
  int _itemCount = 0;
  double totalPrice = 0.0;

  void addProduct(Product product) {
    if (_cartItem.contains(product)) {
      product.quantity++;
    } else {
      _cartItem.add(product);
      product.quantity++;
    }
    _itemCount++;
    totalPrice += product.price;
    update();
  }

  void incrementQuantity(Product product) {
    product.quantity++;
    update();
  }

  void decrementQuantity(Product product) {
    if (product.quantity > 0) {
      product.quantity--;
    }
    update();
  }

  void removeItem(Product product) {
    _cartItem.remove(product);
    product.quantity = 0;
    _itemCount = _itemCount - product.quantity;
    if (_cartItem.isEmpty) {
      _itemCount = 0;
    }
    update();
  }

  int get count => _itemCount;

  List<Product> get products => _cartItem;
}
