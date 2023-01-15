import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/cart_controller.dart';
import 'package:test_app/screen/cart_screen.dart';
import 'package:badges/badges.dart';
import 'package:test_app/screen/product_catalogue.dart';

import '../controller/product_controller.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final cartController = Get.put(CartController());
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: SizedBox(
          width: 40.0,
          height: 40.0,
          child: Image.asset('assets/images/logo.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GetBuilder(
              init: CartController(),
              builder: (logic) => _shoppingCartBadge(logic),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                productController.searchProduct(value);
              },
              decoration: InputDecoration(
                hintText: "Search",
                suffixIcon: const Icon(Icons.search, color: Colors.grey),
                contentPadding: const EdgeInsets.all(15.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ProductCatalogue(),
          ],
        ),
      ),
    );
  }
}

Widget _shoppingCartBadge(CartController controller) {
  return Badge(
    position: BadgePosition.topEnd(top: 0, end: 3),
    animationDuration: Duration(milliseconds: 300),
    animationType: BadgeAnimationType.slide,
    badgeContent: Text(
      controller.count.toString(),
      style: const TextStyle(color: Colors.white),
    ),
    child: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
          color: Colors.pink,
        ),
        onPressed: () {
          Get.to(CartScreen());
        }),
  );
}
