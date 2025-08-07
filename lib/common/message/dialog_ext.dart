import 'package:coding_interview_frontend/common/dialog/error_dialog.dart';
import 'package:coding_interview_frontend/common/message/generic_message.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:flutter/material.dart';

extension GenericMessageExt on GenericMessage {
  Future<dynamic> showMessage<T>(BuildContext context) async {
    final message = this;

    dynamic result;

    if (this is! EmptyMessage) {
      result = ErrorDialog.show<T>(
        context: context,
        title: title ?? AppS.of(context).nothing,
        message: this.message ?? AppS.of(context).nothing,
      );
    }

    if (result != null) {
      await message.onEvent?.call(result);
      return result;
    } else {
      await message.onEvent?.call(result);
    }
  }
}
