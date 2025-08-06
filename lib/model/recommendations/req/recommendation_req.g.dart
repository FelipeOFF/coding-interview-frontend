// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecommendationReq _$RecommendationReqFromJson(Map<String, dynamic> json) =>
    _RecommendationReq(
      type: (json['type'] as num).toInt(),
      cryptoCurrencyId: $enumDecode(
        _$RecommendationCurrencyEnumMap,
        json['cryptoCurrencyId'],
      ),
      fiatCurrencyId: $enumDecode(
        _$RecommendationCurrencyEnumMap,
        json['fiatCurrencyId'],
      ),
      amount: (json['amount'] as num).toDouble(),
      amountCurrencyId: $enumDecode(
        _$RecommendationCurrencyEnumMap,
        json['amountCurrencyId'],
      ),
    );

Map<String, dynamic> _$RecommendationReqToJson(
  _RecommendationReq instance,
) => <String, dynamic>{
  'type': instance.type,
  'cryptoCurrencyId':
      _$RecommendationCurrencyEnumMap[instance.cryptoCurrencyId]!,
  'fiatCurrencyId': _$RecommendationCurrencyEnumMap[instance.fiatCurrencyId]!,
  'amount': instance.amount,
  'amountCurrencyId':
      _$RecommendationCurrencyEnumMap[instance.amountCurrencyId]!,
};

const _$RecommendationCurrencyEnumMap = {
  RecommendationCurrency.brl: 'BRL',
  RecommendationCurrency.cop: 'COP',
  RecommendationCurrency.pen: 'PEN',
  RecommendationCurrency.ves: 'VES',
  RecommendationCurrency.tatumTronUSDT: 'TATUM-TRON-USDT',
  RecommendationCurrency.tatumTronUSDC: 'TATUM-TRON-USDC',
};
