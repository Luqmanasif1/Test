import 'package:get/get.dart';
import 'package:test_app/db/firebase_db.dart';
import 'package:test_app/model/product_model.dart';

class ProductController extends GetxController {
  final allProducts = <Product>[].obs;
  final filteredProduct = <Product>[].obs;
  @override
  void onInit() {
    allProducts.bindStream(FirestoreDB().getAllProducts());
    filteredProduct.value = allProducts;
    super.onInit();
  }

  void searchProduct(String pname) {
    if (pname.isEmpty) {
      filteredProduct.value = allProducts;
    } else {
      List<Product> results = allProducts
          .where((element) =>
              element.name.toLowerCase().contains(pname.toLowerCase()))
          .toList();
      filteredProduct.value = results;
    }
  }
}
