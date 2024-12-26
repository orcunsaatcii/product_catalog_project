import 'package:get_it/get_it.dart';
import 'package:product_catalog_project/core/repositories/auth_repository.dart';
import 'package:product_catalog_project/core/repositories/products_repository.dart';
import 'package:product_catalog_project/core/services/auth_service.dart';
import 'package:product_catalog_project/core/services/products_service.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepository(AuthService()));

  getIt.registerLazySingleton<ProductsRepository>(
      () => ProductsRepository(ProductsService()));
}
