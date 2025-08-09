import 'package:coding_interview_frontend/common/base/base_state_page.dart';
import 'package:coding_interview_frontend/common/dialog/app_dialog.dart';
import 'package:coding_interview_frontend/common/helper/money_value_formatter.dart';
import 'package:coding_interview_frontend/features/home/controller/home_controller.dart';
import 'package:coding_interview_frontend/features/home/model/currency_info.dart';
import 'package:coding_interview_frontend/features/home/widgets/custom_paint_background.dart';
import 'package:coding_interview_frontend/features/home/widgets/swap_input.dart';
import 'package:coding_interview_frontend/gen/assets.gen.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:coding_interview_frontend/model/recommendations/recommendation_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStatePage<HomePage, HomeController> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        const Positioned.fill(child: CustomPaintBackground()),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 32.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SwapInputLoaded(controller: controller),
                          const SizedBox(height: 8),
                          TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(50),
                              MoneyValueFormatter(),
                            ],
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  double.tryParse(value) == 0) {
                                return AppS.of(context).pleaseEnterAmount;
                              }
                              return null;
                            },
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                            cursorColor: Colors.black87,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              prefixIcon: LayoutBuilder(
                                builder: (context, size) => SizedBox(
                                  width: size.minWidth,
                                  height: size.minHeight,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 12.0,
                                      ),
                                      child: Text(
                                        'USDT',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge
                                            ?.copyWith(
                                              fontSize: 12,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                AppS.of(context).estimateTax,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Spacer(),
                              Text(
                                AppS.of(
                                  context,
                                ).approximatelyEqual('25.00', 'VES'),
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                AppS.of(context).youWillReceive,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Spacer(),
                              Text(
                                AppS.of(
                                  context,
                                ).approximatelyEqual('125.00', 'VES'),
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                AppS.of(context).estimateTime,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Spacer(),
                              Text(
                                AppS.of(
                                  context,
                                ).approximatelyEqual('10', 'Min'),
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                final validation = _formKey.currentState
                                    ?.validate();

                                if (validation ?? false) {
                                  print('Validated');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 48,
                                  vertical: 12,
                                ),
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              child: Text(AppS.of(context).change),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class SwapInputLoaded extends StatefulWidget {
  const SwapInputLoaded({required this.controller, super.key});

  final HomeController controller;

  @override
  State<SwapInputLoaded> createState() => _SwapInputLoadedState();
}

class _SwapInputLoadedState extends State<SwapInputLoaded> {
  HomeController get controller => widget.controller;

  List<CurrencyInfo> get _currencyImages => [
    CurrencyInfo(
      name: RecommendationCurrency.brl.value,
      currency: RecommendationCurrency.brl,
      image: Assets.fiatCurrencies.brl,
      description: AppS.of(context).realBrasileiroR,
    ),
    CurrencyInfo(
      name: RecommendationCurrency.cop.value,
      currency: RecommendationCurrency.cop,
      image: Assets.fiatCurrencies.cop,
      description: AppS.of(context).pesoColombianoCol,
    ),
    CurrencyInfo(
      name: RecommendationCurrency.pen.value,
      currency: RecommendationCurrency.pen,
      image: Assets.fiatCurrencies.pen,
      description: AppS.of(context).solPeruanoS,
    ),
    CurrencyInfo(
      name: RecommendationCurrency.ves.value,
      currency: RecommendationCurrency.ves,
      image: Assets.fiatCurrencies.ves,
      description: AppS.of(context).bolvaresBs,
    ),
    CurrencyInfo(
      name: AppS.of(context).usdt,
      currency: RecommendationCurrency.tatumTronUSDT,
      image: Assets.criptoCurrencies.tatumTronUsdt,
      description: AppS.of(context).tetherUsdt,
    ),
    CurrencyInfo(
      name: AppS.of(context).usdc,
      currency: RecommendationCurrency.tatumTronUSDC,
      image: Assets.criptoCurrencies.tatumTronUsdt,
      description: AppS.of(context).usdCoinUsdc,
    ),
  ];

  CurrencyInfo _getCurrencyInfoBySelected(RecommendationCurrency currency) =>
      _currencyImages.firstWhere((element) => element.currency == currency);

  @override
  Widget build(BuildContext context) => RxBuilder(
    builder: (context) => SwapInput(
      leftTitle: AppS.of(context).have,
      rightTitle: AppS.of(context).want,
      leftIcon: _getCurrencyInfoBySelected(
        controller.haveCurrency,
      ).image.image(),
      rightIcon: _getCurrencyInfoBySelected(
        controller.wantCurrency,
      ).image.image(),
      leftCoin: _getCurrencyInfoBySelected(controller.haveCurrency).name,
      rightCoin: _getCurrencyInfoBySelected(controller.wantCurrency).name,
      onSwap: (swap) {
        controller.switched = swap;
      },
      onLeft: _showCriptoDialog,
      onRight: _showFiatDialog,
    ),
  );

  Future<void> _showCriptoDialog() async {
    controller.haveCurrency =
        (await _showGenericDialog(
          title: AppS.of(context).cripto,
          listOfContent: RecommendationCurrency.crypto,
          currentGroupValue: controller.haveCurrency,
        )) ??
        controller.haveCurrency;
  }

  Future<void> _showFiatDialog() async {
    controller.wantCurrency =
        (await _showGenericDialog(
          title: AppS.of(context).fiat,
          listOfContent: RecommendationCurrency.fiat,
          currentGroupValue: controller.wantCurrency,
        )) ??
        controller.wantCurrency;
  }

  Future<RecommendationCurrency?> _showGenericDialog({
    required String title,
    required List<RecommendationCurrency> listOfContent,
    required RecommendationCurrency currentGroupValue,
  }) async => AppDialog.show<RecommendationCurrency>(
    context: context,
    title: title,
    backgroundColor: Colors.white,
    scrollable: true,
    child: ListView.separated(
      itemCount: listOfContent.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = listOfContent[index];
        final currentImage = _getCurrencyInfoBySelected(item);
        return RadioListTile(
          title: Text(
            currentImage.name ?? item.value,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            currentImage.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          secondary: SizedBox.square(
            dimension: 32,
            child: currentImage.image.image(),
          ),
          controlAffinity: ListTileControlAffinity.trailing,
          value: item,
          onChanged: (value) {
            Navigator.of(context).pop(value);
          },
          groupValue: currentGroupValue,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    ),
  );
}
