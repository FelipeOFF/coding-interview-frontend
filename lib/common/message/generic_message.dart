import 'package:coding_interview_frontend/domain/app_error.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';

class GenericMessage {
  GenericMessage({this.title, this.message, this.error, this.onEvent});

  factory GenericMessage.def() => GenericMessage(
    title: AppS.current.ops,
    message: AppS.current.somethingWrongHappenedPleaseTryAgainLater,
  );

  final String? title;
  final String? message;
  final AppError? error;
  // ignore: avoid_annotating_with_dynamic
  Future<void> Function(dynamic value)? onEvent;
}

class EmptyMessage extends GenericMessage {
  EmptyMessage() : super();
}
