import 'package:coding_interview_frontend/common/base/base_state_page.dart';
import 'package:coding_interview_frontend/features/home/controller/home_controller.dart';
import 'package:coding_interview_frontend/features/home/widgets/custom_paint_background.dart';
import 'package:coding_interview_frontend/features/home/widgets/swap_input.dart';
import 'package:coding_interview_frontend/gen/assets.gen.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStatePage<HomePage, HomeController> {
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 32.0,
                        ),
                        child: SwapInput(
                          leftTitle: AppS.of(context).have,
                          rightTitle: AppS.of(context).want,
                          leftIcon: Assets.criptoCurrencies.tatumTronUsdt
                              .image(),
                          rightIcon: Assets.fiatCurrencies.brl.image(),
                          leftCoin: 'TRU',
                          rightCoin: 'BRL',
                          onSwap: print,
                        ),
                      ),
                    ],
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
