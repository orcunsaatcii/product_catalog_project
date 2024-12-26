import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_catalog_project/core/models/product.dart';

class ProductNotifier extends StateNotifier<List<Product>?> {
  ProductNotifier() : super(null);

  void uploadProducts(List<Product> products) {
    state = products;
  }
}

final productProvider = StateNotifierProvider<ProductNotifier, List<Product>?>(
  (ref) => ProductNotifier(),
);
