import 'package:coding_interview_frontend/common/dialog/app_dialog.dart';
import 'package:coding_interview_frontend/features/home/controller/home_controller.dart';
import 'package:coding_interview_frontend/features/home/model/currency_info.dart';
import 'package:coding_interview_frontend/features/home/widgets/swap_input.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:coding_interview_frontend/model/recommendations/recommendation_currency.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SwapInputLoaded extends StatefulWidget {
  const SwapInputLoaded({required this.controller, super.key});

  final HomeController controller;

  @override
  State<SwapInputLoaded> createState() => _SwapInputLoadedState();
}

class _SwapInputLoadedState extends State<SwapInputLoaded> {
  HomeController get controller => widget.controller;

  @override
  Widget build(BuildContext context) => RxBuilder(
    builder: (context) => SwapInput(
      leftTitle: AppS.of(context).have,
      rightTitle: AppS.of(context).want,
      leftIcon: controller
          .getCurrencyInfoBySelected(controller.haveCurrency)
          .image
          .image(),
      rightIcon: controller
          .getCurrencyInfoBySelected(controller.wantCurrency)
          .image
          .image(),
      leftCoin: controller
          .getCurrencyInfoBySelected(controller.haveCurrency)
          .name,
      rightCoin: controller
          .getCurrencyInfoBySelected(controller.wantCurrency)
          .name,
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
        final currentImage = controller.getCurrencyInfoBySelected(item);
        return RadioTile(
          currentImage: currentImage,
          item: item,
          currentGroupValue: currentGroupValue,
          onChanged: (value) {
            Navigator.of(context).pop(value);
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    ),
  );
}

class RadioTile extends StatelessWidget {
  const RadioTile({
    required this.currentImage,
    required this.item,
    required this.currentGroupValue,
    required this.onChanged,
    super.key,
  });

  final CurrencyInfo currentImage;
  final RecommendationCurrency item;
  final RecommendationCurrency currentGroupValue;
  final ValueChanged<RecommendationCurrency?>? onChanged;

  @override
  Widget build(BuildContext context) => RadioListTile(
    title: Text(
      currentImage.name,
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
    onChanged: onChanged,
    groupValue: currentGroupValue,
  );
}
