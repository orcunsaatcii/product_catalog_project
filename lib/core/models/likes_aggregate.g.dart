// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_aggregate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikesAggregate _$LikesAggregateFromJson(Map<String, dynamic> json) =>
    LikesAggregate(
      aggregate: json['aggregate'] == null
          ? null
          : Aggregate.fromJson(json['aggregate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LikesAggregateToJson(LikesAggregate instance) =>
    <String, dynamic>{
      'aggregate': instance.aggregate,
    };
