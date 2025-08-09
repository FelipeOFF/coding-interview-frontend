import 'package:coding_interview_frontend/common/base/base_state_page.dart';
import 'package:coding_interview_frontend/features/home/controller/home_controller.dart';
import 'package:coding_interview_frontend/features/home/widgets/custom_paint_background.dart';
import 'package:coding_interview_frontend/features/home/widgets/swap_input.dart';
import 'package:coding_interview_frontend/gen/assets.gen.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                          SwapInput(
                            leftTitle: AppS.of(context).have,
                            rightTitle: AppS.of(context).want,
                            leftIcon: Assets.criptoCurrencies.tatumTronUsdt
                                .image(),
                            rightIcon: Assets.fiatCurrencies.ves.image(),
                            leftCoin: 'USDT',
                            rightCoin: 'VES',
                            onSwap: print,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(50),
                            ],
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 48, vertical: 16),
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
