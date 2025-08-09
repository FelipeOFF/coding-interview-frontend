import 'package:coding_interview_frontend/common/base/base_state_page.dart';
import 'package:coding_interview_frontend/features/home/controller/home_controller.dart';
import 'package:coding_interview_frontend/features/home/widgets/custom_paint_background.dart';
import 'package:coding_interview_frontend/features/home/widgets/exec_button.dart';
import 'package:coding_interview_frontend/features/home/widgets/key_value_entry_widget.dart';
import 'package:coding_interview_frontend/features/home/widgets/swap_input_loaded.dart';
import 'package:coding_interview_frontend/features/home/widgets/text_field_amount.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:flutter/material.dart';

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
                          TextFieldAmount(
                            controller: controller,
                            prefixTitle: AppS.of(context).usdt,
                            errorText: AppS.of(context).pleaseEnterAmount,
                          ),
                          const SizedBox(height: 8),
                          KeyValueEntryWidget(
                            title: AppS.of(context).estimateTax,
                            value: AppS.of(
                              context,
                            ).approximatelyEqual('25.00', 'VES'),
                          ),
                          const SizedBox(height: 4),
                          KeyValueEntryWidget(
                            title: AppS.of(context).youWillReceive,
                            value: AppS.of(
                              context,
                            ).approximatelyEqual('125.00', 'VES'),
                          ),
                          const SizedBox(height: 4),
                          KeyValueEntryWidget(
                            title: AppS.of(context).estimateTime,
                            value: AppS.of(
                              context,
                            ).approximatelyEqual('10', 'Min'),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ExecButton(
                              onPressed: () {
                                final validation = _formKey.currentState
                                    ?.validate();

                                if (validation ?? false) {
                                  print('Validated');
                                }
                              },
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
