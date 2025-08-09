import 'package:coding_interview_frontend/common/helper/typedef.dart';
import 'package:coding_interview_frontend/common/message/generic_message.dart';
import 'package:coding_interview_frontend/domain/abstract_use_case.dart';
import 'package:coding_interview_frontend/domain/app_error.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class BaseController {
  RxNotifier<GenericMessage?>? _message;
  RxNotifier<bool?>? _isLoading;

  GenericMessage? get message => _message?.value;

  set message(GenericMessage? message) => _message?.value = message;

  bool get isLoading => _isLoading?.value ?? false;

  set isLoading(bool isLoading) => _isLoading?.value = isLoading;

  void init() {
    _message = RxNotifier(EmptyMessage());
    _isLoading = RxNotifier(null);
  }

  Future<R?> exec<P, R>(
    P value,
    AbstractUseCase<P, R> useCase, {
    CallBackError? mapError,
    bool showLoading = true,
  }) async {
    if (showLoading) {
      isLoading = true;
    }
    final Either<AppError, R> result = await useCase(value);
    if (result.isLeft()) {
      await _resolveError(result, mapError);
    }
    if (showLoading) {
      isLoading = false;
    }
    return result.getRight().toNullable();
  }

  Future<void> _resolveError(
    Either<AppError, dynamic> result,
    CallBackError? mapError,
  ) async {
    final AppError? error = result.getLeft().toNullable();
    final GenericMessage supposeMessage = GenericMessage.def();
    message = mapError?.call(error, supposeMessage) ?? supposeMessage;
  }

  @mustCallSuper
  Future<void> dispose() async {
    _message?.dispose();
    _isLoading?.dispose();
  }
}
