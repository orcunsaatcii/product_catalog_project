// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(
        Map<String, dynamic> json, Category category, Image image) =>
    Product(
      author: json['author'] as String?,
      cover: json['cover'] as String?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      sales: (json['sales'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      likesAggregate: json['likesAggregate'] == null
          ? null
          : LikesAggregate.fromJson(
              json['likesAggregate'] as Map<String, dynamic>),
      category: (category as Category?),
      image: (image as Image?),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'author': instance.author,
      'cover': instance.cover,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'sales': instance.sales,
      'slug': instance.slug,
      'likesAggregate': instance.likesAggregate,
      'categoryId': instance.category,
      'imageId': instance.image,
    };
