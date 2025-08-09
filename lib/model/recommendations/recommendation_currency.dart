import 'package:freezed_annotation/freezed_annotation.dart';

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
  static List<RecommendationCurrency> get fiat => [brl, cop, pen, ves];

  static List<RecommendationCurrency> get crypto => [
    tatumTronUSDT,
    tatumTronUSDC,
  ];

  bool get isFiat => fiat.contains(this);

  bool get isCrypto => crypto.contains(this);
}
