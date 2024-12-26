import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_catalog_project/core/models/product.dart';

class ProductNotifier extends StateNotifier<List<Product>?> {
  ProductNotifier() : super(null);

  List<Product>? _allProducts;

  void uploadProducts(List<Product> products) {
    _allProducts = products;
    state = products;
  }

  void searchProduct(String search) {
    if (search.isEmpty) {
      state = _allProducts;
    } else {
      state = _allProducts!
          .where(
            (element) =>
                element.name!.toLowerCase().contains(search.toLowerCase()),
          )
          .toList();
    }
  }
}

final productProvider = StateNotifierProvider<ProductNotifier, List<Product>?>(
  (ref) => ProductNotifier(),
);
