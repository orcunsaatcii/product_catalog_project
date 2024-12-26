import 'package:injectable/injectable.dart';
import 'package:product_catalog_project/core/models/product.dart';
import 'package:product_catalog_project/core/services/products_service.dart';

@injectable
class ProductsRepository {
  final ProductsService _productsService;

  ProductsRepository(this._productsService);

  Future<List<Product>> fetchAllProducts() async {
    final List<Product> response = await _productsService.fetchAllProducts();

    return response;
  }
}
