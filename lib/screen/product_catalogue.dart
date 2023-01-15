import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/product_controller.dart';
import 'package:test_app/model/product_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../controller/cart_controller.dart';

class ProductCatalogue extends StatelessWidget {
  ProductCatalogue({super.key});

  final cartController = Get.put(CartController());
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: AlignedGridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          itemCount: productController.filteredProduct.length,
          itemBuilder: (context, index) {
            Product product = productController.filteredProduct[index];
            return Card(
              child: Column(
                children: <Widget>[
                  Image.network(product.imageUrl),
                  Text(product.name),
                  TextButton(
                    onPressed: () {
                      cartController.addProduct(product);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      backgroundColor: Colors.brown[200],
                    ),
                    child: const Text("Add to Cart"),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
