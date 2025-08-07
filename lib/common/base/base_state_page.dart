import 'package:coding_interview_frontend/common/base/base_controller.dart';
import 'package:coding_interview_frontend/common/message/dialog_ext.dart';
import 'package:coding_interview_frontend/common/message/generic_message.dart';
import 'package:coding_interview_frontend/di/app_di.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class BaseStatePage<T extends StatefulWidget, C extends BaseController>
    extends State<T> {
  final C controller = AppDI.it.get();

  late final RxDisposer messageDispose;

  @override
  void initState() {
    super.initState();
    controller.init();
    messageDispose = rxObserver(() async {
      final msg = controller.message;
      if (msg != null && msg is! EmptyMessage) {
        await msg.showMessage<void>(context);
        controller.message = null;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
