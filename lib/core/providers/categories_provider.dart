import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_catalog_project/core/models/category.dart';

class CategoryNotifier extends StateNotifier<List<Category>?> {
  CategoryNotifier() : super(null);

  void uploadCategories(List<Category> categories) {
    state = categories;
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, List<Category>?>(
  (ref) => CategoryNotifier(),
);
