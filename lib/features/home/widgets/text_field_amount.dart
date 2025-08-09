import 'package:coding_interview_frontend/common/helper/money_value_formatter.dart';
import 'package:coding_interview_frontend/features/home/controller/home_controller.dart';
import 'package:coding_interview_frontend/util/double_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rx_notifier/rx_notifier.dart';

class TextFieldAmount extends StatelessWidget {
  const TextFieldAmount({
    required this.controller,
    required this.errorText,
    super.key,
  });

  final HomeController controller;
  final String errorText;

  @override
  Widget build(BuildContext context) => RxBuilder(
    builder: (context) => TextFormField(
      initialValue: controller.amount.toAppMoneyFraction,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(50),
        MoneyValueFormatter(),
      ],
      keyboardType: TextInputType.number,
      onChanged: (value) => controller.amount = double.tryParse(value) ?? 0,
      validator: (value) {
        if (value == null || value.isEmpty || double.tryParse(value) == 0) {
          return errorText;
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
                padding: const EdgeInsets.only(left: 12.0),
                child: RxBuilder(
                  builder: (context) => Text(
                      controller
                          .getCurrencyInfoByHave
                          .name,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
