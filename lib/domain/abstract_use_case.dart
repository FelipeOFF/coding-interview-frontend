import 'package:coding_interview_frontend/domain/app_error.dart';
import 'package:coding_interview_frontend/util/logger.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

abstract class AbstractUseCase<PARAM, RESULT> {
  const AbstractUseCase();

  String? get key => null;

  Future<RESULT> execute(PARAM param);

  Future<Either<AppError, RESULT>> call(
    PARAM params, {
    bool forceRefresh = false,
  }) async {
    try {
      final result = await execute(params);
      return Right(result);
    } on DioException catch (exception, stacktrace) {
      logger.e(
        exception,
        time: DateTime.now(),
        error: exception,
        stackTrace: stacktrace,
      );
      return Left(await exception.asAppError());
    } catch (exception, stacktrace) {
      logger.e(
        exception,
        time: DateTime.now(),
        error: exception,
        stackTrace: stacktrace,
      );
      return Left(UnknownException(exception: exception));
    }
  }
}
