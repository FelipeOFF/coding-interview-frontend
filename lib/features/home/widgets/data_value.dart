import 'package:coding_interview_frontend/common/helper/date_time_ext.dart';
import 'package:coding_interview_frontend/features/home/controller/home_controller.dart';
import 'package:coding_interview_frontend/features/home/widgets/key_value_entry_widget.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DataValue extends StatelessWidget {
  const DataValue({required this.controller, super.key});

  final HomeController controller;

  @override
  Widget build(BuildContext context) => RxBuilder(
    builder: (context) => Skeletonizer(
      enabled: controller.isLoading,
      child: Column(
        children: [
          KeyValueEntryWidget(
            title: AppS.of(context).estimateTax,
            value: controller.result?.totalTax != null
                ? AppS.of(context).approximatelyEqual(
                    controller.result!.totalTax,
                    controller.getCurrencyInfoByWant.name,
                  )
                : AppS.of(context).nothing,
          ),
          const SizedBox(height: 4),
          KeyValueEntryWidget(
            title: AppS.of(context).youWillReceive,
            value: controller.result?.totalAmount != null
                ? AppS.of(context).approximatelyEqual(
                    controller.result!.totalAmount,
                    controller.getCurrencyInfoByWant.name,
                  )
                : AppS.of(context).nothing,
          ),
          const SizedBox(height: 4),
          KeyValueEntryWidget(
            title: AppS.of(context).estimateTime,
            value: controller.result?.estToFinish != null
                ? AppS.of(context).approximatelyEqualUniqValue(
                    controller.result!.estToFinish!.formatDateToLess(
                      AppS.of(context),
                    ),
                  )
                : AppS.of(context).nothing,
          ),
        ],
      ),
    ),
  );
}
