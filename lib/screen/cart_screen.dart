import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/cart_controller.dart';
import 'package:test_app/model/product_model.dart';
import 'package:test_app/screen/product_screen.dart';
import 'package:test_app/widget/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: GetBuilder<CartController>(
            init: CartController(),
            builder: (cartProduct) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: cartProduct.products.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          product: cartProduct.products[index],
                          cartController: cartProduct,
                          index: index,
                        );
                      },
                    ),
                    cartProduct.products.length != 0 ? TotalCart() : EmptyCart()
                  ],
                ),
              );
            }));
  }
}

Widget Total(String title, double total) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      ),
      Text(total.toString()),
    ],
  );
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Empty Cart",
          style: TextStyle(fontSize: 14, color: Colors.brown),
        ),
        const Text(
          "Add something in your cart",
          style: TextStyle(fontSize: 18, color: Colors.brown),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              // <-- Radius
            ),
          ),
          onPressed: () => {Get.to(ProductScreen())},
          child: const Text("Buy now", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}

class TotalCart extends StatelessWidget {
  const TotalCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: Colors.black26, thickness: 1),
        const SizedBox(
          height: 20,
        ),
        Total("SubTotal", 0.0),
        const SizedBox(
          height: 10,
        ),
        Total("Discount", 0.0),
        const Divider(color: Colors.black26, thickness: 1),
        const SizedBox(
          height: 10,
        ),
        Total("SubTotal", 0.0),
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
            onPressed: () => {},
            child: const Text("Buy now", style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }
}
