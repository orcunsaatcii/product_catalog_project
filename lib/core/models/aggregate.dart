import 'package:json_annotation/json_annotation.dart';

part 'aggregate.g.dart';

@JsonSerializable()
class Aggregate {
  int? count;

  Aggregate({this.count});

  factory Aggregate.fromJson(Map<String, dynamic> json) =>
      _$AggregateFromJson(json);

  Map<String, dynamic> toJson() => _$AggregateToJson(this);
}
