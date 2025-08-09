// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecommendationModel _$RecommendationModelFromJson(Map<String, dynamic> json) =>
    _RecommendationModel(
      totalTax: json['totalTax'] as String,
      totalAmount: json['totalAmount'] as String,
      estToFinish: json['estToFinish'] == null
          ? null
          : DateTime.parse(json['estToFinish'] as String),
    );

Map<String, dynamic> _$RecommendationModelToJson(
  _RecommendationModel instance,
) => <String, dynamic>{
  'totalTax': instance.totalTax,
  'totalAmount': instance.totalAmount,
  'estToFinish': instance.estToFinish?.toIso8601String(),
};
