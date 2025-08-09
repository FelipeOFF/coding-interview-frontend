import 'package:coding_interview_frontend/common/base/base_controller.dart';
import 'package:coding_interview_frontend/model/recommendations/recommendation_currency.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeController extends BaseController {
  final RxNotifier<RecommendationCurrency> _haveCurrency = RxNotifier(
    RecommendationCurrency.tatumTronUSDC,
  );

  final RxNotifier<RecommendationCurrency> _wantCurrency = RxNotifier(
    RecommendationCurrency.ves,
  );

  final RxNotifier<bool> _switched = RxNotifier(false);

  final RxNotifier<double> _amount = RxNotifier(0);

  RecommendationCurrency get haveCurrency => _haveCurrency.value;
  RecommendationCurrency get wantCurrency => _wantCurrency.value;
  set haveCurrency(RecommendationCurrency currency) =>
      _haveCurrency.value = currency;
  set wantCurrency(RecommendationCurrency currency) =>
      _wantCurrency.value = currency;
  bool get switched => _switched.value;
  set switched(bool value) => _switched.value = value;
  double get amount => _amount.value;
  set amount(double value) => _amount.value = value;
}
