import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/model/product_model.dart';

class FirestoreDB {
  static CollectionReference productReference =
      FirebaseFirestore.instance.collection("products");

  Stream<List<Product>> getAllProducts() {
    return productReference.snapshots().map((QuerySnapshot query) {
      List<Product> products = [];
      for (var doc in query.docs) {
        final product = Product.fromDocument(doc);
        products.add(product);
      }
      return products;
    });
  }
}
