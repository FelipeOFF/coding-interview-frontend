import 'package:coding_interview_frontend/common/message/generic_message.dart';
import 'package:coding_interview_frontend/domain/app_error.dart';

typedef CallBackError =
    GenericMessage? Function(AppError? error, GenericMessage supportMessage);
