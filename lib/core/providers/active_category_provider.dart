import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActiveCategoryNotifier extends StateNotifier<String> {
  ActiveCategoryNotifier() : super('All');

  void selectCategory(String category) {
    state = category;
  }
}

final activeCategoryProvider =
    StateNotifierProvider<ActiveCategoryNotifier, String>(
  (ref) => ActiveCategoryNotifier(),
);
