// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecommendationRes _$RecommendationResFromJson(Map<String, dynamic> json) =>
    _RecommendationRes(
      data: json['data'] == null
          ? null
          : RecommendationResData.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$RecommendationResToJson(_RecommendationRes instance) =>
    <String, dynamic>{'data': instance.data};

_RecommendationResData _$RecommendationResDataFromJson(
  Map<String, dynamic> json,
) => _RecommendationResData(
  byPrice: json['byPrice'] == null
      ? null
      : RecommendationResDataByPrice.fromJson(
          json['byPrice'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$RecommendationResDataToJson(
  _RecommendationResData instance,
) => <String, dynamic>{'byPrice': instance.byPrice};

_RecommendationResDataByPrice _$RecommendationResDataByPriceFromJson(
  Map<String, dynamic> json,
) => _RecommendationResDataByPrice(
  fiatToCryptoExchangeRate: json['fiatToCryptoExchangeRate'] as String?,
);

Map<String, dynamic> _$RecommendationResDataByPriceToJson(
  _RecommendationResDataByPrice instance,
) => <String, dynamic>{
  'fiatToCryptoExchangeRate': instance.fiatToCryptoExchangeRate,
};
