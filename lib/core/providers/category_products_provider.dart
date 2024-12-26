import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_catalog_project/core/models/product.dart';

class CategoryProductsNotifier extends StateNotifier<List<Product>?> {
  CategoryProductsNotifier() : super(null);

  List<Product>? _categoryProducts;

  void uploadProducts(List<Product> products) {
    _categoryProducts = products;
    state = products;
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      state = _categoryProducts;
    } else {
      state = _categoryProducts!
          .where((product) =>
              product.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

final categoryProductsProvider =
    StateNotifierProvider<CategoryProductsNotifier, List<Product>?>(
  (ref) => CategoryProductsNotifier(),
);
