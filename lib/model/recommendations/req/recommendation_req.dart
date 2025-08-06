import 'package:coding_interview_frontend/model/recommendations/recommendation_currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation_req.freezed.dart';
part 'recommendation_req.g.dart';

@freezed
abstract class RecommendationReq with _$RecommendationReq {
  const factory RecommendationReq({
    required int type,
    required RecommendationCurrency cryptoCurrencyId,
    required RecommendationCurrency fiatCurrencyId,
    required double amount,
    required RecommendationCurrency amountCurrencyId,
  }) = _RecommendationReq;

  factory RecommendationReq.fromJson(Map<String, dynamic> json) =>
      _$RecommendationReqFromJson(json);
}
