import 'package:json_annotation/json_annotation.dart';
import 'package:product_catalog_project/core/models/category.dart';
import 'package:product_catalog_project/core/models/image.dart';
import 'package:product_catalog_project/core/models/likes_aggregate.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String? author;
  String? cover;
  String? createdAt;
  String? description;
  int? id;
  String? name;
  double? price;
  int? sales;
  String? slug;
  LikesAggregate? likesAggregate;
  Category? category;
  Image? image;

  Product({
    this.author,
    this.cover,
    this.createdAt,
    this.description,
    this.id,
    this.name,
    this.price,
    this.sales,
    this.slug,
    this.likesAggregate,
    this.category,
    this.image,
  });

  factory Product.fromJson(
          Map<String, dynamic> json, Category category, Image image) =>
      _$ProductFromJson(json, category, image);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
