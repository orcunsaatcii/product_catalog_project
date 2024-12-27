import 'dart:convert';
import 'dart:io';

import 'package:product_catalog_project/core/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:product_catalog_project/core/app/constants/app_constants.dart';
import 'package:product_catalog_project/core/models/image.dart';
import 'package:product_catalog_project/core/models/product.dart';
import 'package:product_catalog_project/core/utils/cache/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class ProductsService {
  Future<List<Product>> fetchAllProducts() async {
    // const cacheKey = 'all_products_cache';

    // // Cache kontrolü
    // final cachedData = await CacheHelper.getCache(cacheKey);

    // if (cachedData != null) {
    //   print('CACHEDEN ÇEKİLDİ');
    //   final decodedData = json.decode(cachedData) as List<dynamic>;
    //   return decodedData
    //       .map((e) => Product.fromJson(e, Category.fromJson(e['categoryId']),
    //           Image.fromJson(e['imageId'])))
    //       .toList();
    // }

    final url = Uri.parse('$constantUrl/categories');
    final response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final data = json.decode(response.body);
      final List<dynamic> categoryData = data['category'];
      final categories = categoryData
          .map(
            (e) => Category.fromJson(e),
          )
          .toList();

      // Kategoriler için ürünleri paralel olarak çek
      final List<List<Product>> nestedProducts = await Future.wait(
        categories.map(
          (category) => fetchProductsByCategoryId(category, category.id!),
        ),
      );

      // Nested list'i düz bir listeye dönüştür
      final List<Product> products = nestedProducts.expand((e) => e).toList();

      //await CacheHelper.saveCache(cacheKey, json.encode(products));

      return products;
    } else {
      throw Exception('Kategoriler alınamadı');
    }
  }

  Future<List<Product>> fetchProductsByCategoryId(
      Category category, int categoryId) async {
    // final cacheKey = 'products_$categoryId';

    // // Cache kontrolü
    // final cachedData = await CacheHelper.getCache(cacheKey);
    // if (cachedData != null) {
    //   final decodedData = json.decode(cachedData) as List<dynamic>;
    //   return decodedData
    //       .map((e) =>
    //           Product.fromJson(e, category, Image.fromJson(e['imageId'])))
    //       .toList();
    // }

    List<Product> products = [];
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    final url = Uri.parse('$constantUrl/products/$categoryId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == HttpStatus.ok) {
      final data = json.decode(response.body);
      final List<dynamic> productData = data['product'];

      // Kapak resimlerini topluca yükle
      final coverImageFutures = productData
          .map((product) => uploadProductCoverImage(product['cover']))
          .toList();

      final coverImages = await Future.wait(coverImageFutures);

      for (int i = 0; i < productData.length; i++) {
        final product = productData[i];
        final imageUrl = coverImages[i];
        if (imageUrl.isNotEmpty) {
          products.add(
            Product.fromJson(product, category, imageUrl.first),
          );
        }
      }

      //await CacheHelper.saveCache(cacheKey, json.encode(products));

      return products;
    } else {
      throw Exception('Ürünler alınamadı');
    }
  }

  Future<List<Image>> uploadProductCoverImage(String fileName) async {
    // const cacheKeyPrefix = 'cover_image_cache_';
    // final cacheKey = '$cacheKeyPrefix$fileName';

    // // Cache kontrolü
    // final cachedData = await CacheHelper.getCache(cacheKey);
    // if (cachedData != null) {
    //   final decodedData = json.decode(cachedData) as List<dynamic>;
    //   return decodedData.map((e) => Image.fromJson(e)).toList();
    // }

    final url = Uri.parse('$constantUrl/cover_image');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'fileName': fileName}),
    );

    if (response.statusCode == HttpStatus.ok) {
      final data = json.decode(response.body);
      final dynamic imageData = data['action_product_image'];

      if (imageData != null) {
        // await CacheHelper.saveCache(cacheKey, json.encode([imageData]));

        return [Image.fromJson(imageData)];
      } else {
        throw Exception('Kapak resmi bulunamadı');
      }
    } else {
      throw Exception('Kapak resmi yüklenemedi');
    }
  }
}
