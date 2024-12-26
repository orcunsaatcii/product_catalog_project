import 'package:json_annotation/json_annotation.dart';
import 'package:product_catalog_project/core/models/aggregate.dart';

part 'likes_aggregate.g.dart';

@JsonSerializable()
class LikesAggregate {
  Aggregate? aggregate;

  LikesAggregate({this.aggregate});

  factory LikesAggregate.fromJson(Map<String, dynamic> json) =>
      _$LikesAggregateFromJson(json);

  Map<String, dynamic> toJson() => _$LikesAggregateToJson(this);
}
