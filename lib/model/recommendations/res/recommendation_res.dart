import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation_res.freezed.dart';
part 'recommendation_res.g.dart';

@freezed
abstract class RecommendationRes with _$RecommendationRes {
  const factory RecommendationRes({RecommendationResData? data}) =
      _RecommendationRes;

  factory RecommendationRes.fromJson(Map<String, dynamic> json) =>
      _$RecommendationResFromJson(json);
}

@freezed
abstract class RecommendationResData with _$RecommendationResData {
  const factory RecommendationResData({
    RecommendationResDataByPrice? byPrice,
  }) = _RecommendationResData;

  factory RecommendationResData.fromJson(Map<String, dynamic> json) =>
      _$RecommendationResDataFromJson(json);
}

@freezed
abstract class RecommendationResDataByPrice
    with _$RecommendationResDataByPrice {
  const factory RecommendationResDataByPrice({
    String? fiatToCryptoExchangeRate,
  }) = _RecommendationResDataByPrice;

  factory RecommendationResDataByPrice.fromJson(Map<String, dynamic> json) =>
      _$RecommendationResDataByPriceFromJson(json);
}
