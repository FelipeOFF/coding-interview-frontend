import 'package:coding_interview_frontend/gen/assets.gen.dart';
import 'package:coding_interview_frontend/model/recommendations/recommendation_currency.dart';

class CurrencyInfo {
  CurrencyInfo({
    required this.currency,
    required this.description,
    required this.image,
    required this.name,
  });

  final String name;
  final RecommendationCurrency currency;
  final String description;
  final AssetGenImage image;
}
