import 'package:flutter/material.dart';
import 'package:product_catalog_project/features/all_products/view/all_products_view.dart';

mixin AllProductsViewState on State<AllProductsView> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
