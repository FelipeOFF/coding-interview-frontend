import 'dart:math';

import 'package:coding_interview_frontend/domain/abstract_use_case.dart';
import 'package:coding_interview_frontend/model/recommendations/req/recommendation_req.dart';
import 'package:coding_interview_frontend/model/recommendations/res/recommendation_model.dart';
import 'package:coding_interview_frontend/repository/recommendation_repository.dart';
import 'package:coding_interview_frontend/util/double_ext.dart';

class RecommendationUseCase
    extends AbstractUseCase<RecommendationReq, RecommendationModel> {
  RecommendationUseCase({required this.repository});

  final RecommendationRepository repository;

  @override
  Future<RecommendationModel> execute(RecommendationReq param) async {
    final result = await repository.getRecommendation(param);
    final fiatToCryptoExchangeRate =
        result.data?.byPrice?.fiatToCryptoExchangeRate;
    if (fiatToCryptoExchangeRate == null) {
      return const RecommendationModel(totalTax: '0.00', totalAmount: '0.00');
    }
    final exchangeRate = double.tryParse(fiatToCryptoExchangeRate) ?? 1.0;

    final convertedAmount = exchangeRate > param.amount
        ? param.amount / exchangeRate
        : param.amount * exchangeRate;

    return RecommendationModel(
      totalTax: exchangeRate.toAppMoneyFraction,
      totalAmount: convertedAmount.toAppMoneyFraction,
      estToFinish: DateTime.now().add(
        Duration(minutes: 5 + Random().nextInt(45)),
      ),
    );
  }
}
