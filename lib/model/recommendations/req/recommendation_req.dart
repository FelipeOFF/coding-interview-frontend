import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation_req.freezed.dart';
part 'recommendation_req.g.dart';

enum RecommendationCurrency {
  // FIAT currencies
  @JsonValue('BRL')
  brl('BRL'),
  @JsonValue('COP')
  cop('COP'),
  @JsonValue('PEN')
  pen('PEN'),
  @JsonValue('VES')
  ves('VES'),

  // Crypto currencies
  @JsonValue('TATUM-TRON-USDT')
  tatumTronUSDT('TATUM-TRON-USDT'),
  @JsonValue('TATUM-TRON-USDC')
  tatumTronUSDC('TATUM-TRON-USDC');

  const RecommendationCurrency(this.value);

  final String value;

  // Helper methods para identificar o tipo
  List<RecommendationCurrency> get fiat => [brl, cop, pen, ves];
  List<RecommendationCurrency> get crypto => [tatumTronUSDT, tatumTronUSDC];

  bool get isFiat => fiat.contains(this);
  bool get isCrypto => crypto.contains(this);
}

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
