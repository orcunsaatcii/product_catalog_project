import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_catalog_project/core/di/injectable.dart';
import 'package:product_catalog_project/core/models/category.dart';
import 'package:product_catalog_project/core/providers/categories_provider.dart';
import 'package:product_catalog_project/core/providers/products_provider.dart';
import 'package:product_catalog_project/core/repositories/products_repository.dart';
import 'package:product_catalog_project/features/home/view/home_view.dart';

mixin HomeViewState on ConsumerState<HomeView> {
  final ProductsRepository _productsRepository = getIt<ProductsRepository>();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  Future<void> fetchProducts() async {
    final data = await _productsRepository.fetchAllProducts();
    final List<Category> categories =
        data.map((e) => e.category!).toSet().toList();
    ref.read(categoryProvider.notifier).uploadCategories(categories);
    ref.read(productProvider.notifier).uploadProducts(data);
  }
}
