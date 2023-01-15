import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/cart_controller.dart';
import 'package:test_app/model/product_model.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final CartController cartController;
  final int index;
  const CartItem(
      {required this.product,
      required this.cartController,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        cartController.removeItem(product);
      },
      direction: DismissDirection.endToStart,
      background: Container(color: Colors.red),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.delete,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              height: 5,
            ),
            Text("Remove", style: TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
        color: Colors.red,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Image.network(product.imageUrl),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(product.name),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              cartController.decrementQuantity(product);
                            },
                            icon: const Icon(Icons.remove_circle),
                          ),
                          GetBuilder(
                            init: CartController(),
                            builder: (logic) =>
                                Text("${logic.products[index].quantity}"),
                          ),
                          IconButton(
                            onPressed: () {
                              cartController.incrementQuantity(product);
                            },
                            icon: const Icon(Icons.add_circle),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Text(product.price.toString()),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(color: Colors.black26, thickness: 1),
          ],
        ),
      ),
    );
  }
}
