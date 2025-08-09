import 'package:coding_interview_frontend/common/base/base_controller.dart';
import 'package:coding_interview_frontend/features/home/model/currency_info.dart';
import 'package:coding_interview_frontend/gen/assets.gen.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';
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

  List<CurrencyInfo> get _currencyImages => [
    CurrencyInfo(
      name: RecommendationCurrency.brl.value,
      currency: RecommendationCurrency.brl,
      image: Assets.fiatCurrencies.brl,
      description: AppS.current.realBrasileiroR,
    ),
    CurrencyInfo(
      name: RecommendationCurrency.cop.value,
      currency: RecommendationCurrency.cop,
      image: Assets.fiatCurrencies.cop,
      description: AppS.current.pesoColombianoCol,
    ),
    CurrencyInfo(
      name: RecommendationCurrency.pen.value,
      currency: RecommendationCurrency.pen,
      image: Assets.fiatCurrencies.pen,
      description: AppS.current.solPeruanoS,
    ),
    CurrencyInfo(
      name: RecommendationCurrency.ves.value,
      currency: RecommendationCurrency.ves,
      image: Assets.fiatCurrencies.ves,
      description: AppS.current.bolvaresBs,
    ),
    CurrencyInfo(
      name: AppS.current.usdt,
      currency: RecommendationCurrency.tatumTronUSDT,
      image: Assets.criptoCurrencies.tatumTronUsdt,
      description: AppS.current.tetherUsdt,
    ),
    CurrencyInfo(
      name: AppS.current.usdc,
      currency: RecommendationCurrency.tatumTronUSDC,
      image: Assets.criptoCurrencies.tatumTronUsdt,
      description: AppS.current.usdCoinUsdc,
    ),
  ];

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

  CurrencyInfo getCurrencyInfoBySelected(RecommendationCurrency currency) =>
      _currencyImages.firstWhere((element) => element.currency == currency);

  CurrencyInfo getCurrencyInfoByHave() =>
      getCurrencyInfoBySelected(switched ? wantCurrency : haveCurrency);

  CurrencyInfo getCurrencyInfoByWant() =>
      getCurrencyInfoBySelected(switched ? haveCurrency : wantCurrency);
}
