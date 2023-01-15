import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  late final String name;
  late final String imageUrl;
  late final num price;
  int quantity = 0;

  Product(
      {required this.name,
      required this.imageUrl,
      required this.price,
      this.quantity = 0});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    price = json['price'];
  }

  Product.fromDocument(DocumentSnapshot doc) {
    name = doc['name'];
    imageUrl = doc['imageUrl'];
    price = doc['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['price'] = price;
    return data;
  }
}
