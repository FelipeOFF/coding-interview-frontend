import 'dart:math';

import 'package:coding_interview_frontend/domain/abstract_use_case.dart';
import 'package:coding_interview_frontend/model/recommendations/req/recommendation_req.dart';
import 'package:coding_interview_frontend/model/recommendations/res/recommendation_model.dart';
import 'package:coding_interview_frontend/repository/recommendation_repository.dart';
import 'package:coding_interview_frontend/util/double_ext.dart';

class RecommendationUseCase
    extends AbstractUseCase<RecommendationReq, RecommendationModel?> {
  RecommendationUseCase({required this.repository});

  final RecommendationRepository repository;

  @override
  Future<RecommendationModel?> execute(RecommendationReq param) async {
    final result = await repository.getRecommendation(param);
    // 104
    final fiatToCryptoExchangeRate =
        result.data?.byPrice?.fiatToCryptoExchangeRate;
    if (fiatToCryptoExchangeRate == null) {
      return null;
    }
    final type = param.type;
    final exchangeRate = double.tryParse(fiatToCryptoExchangeRate) ?? 1.0;
    final amount = param.amount;

    final totalTax = type == 0
        ? amount * exchangeRate * 0.01
        : exchangeRate / amount * 0.01;
    final totalWithTax = type == 0
        ? amount * exchangeRate
        : amount / exchangeRate;

    return RecommendationModel(
      totalTax: totalTax.toAppMoneyFraction,
      totalAmount: totalWithTax.toAppMoneyFraction,
      estToFinish: DateTime.now().add(
        Duration(seconds: Random().nextInt(3600) + 60),
      ),
    );
  }
}
