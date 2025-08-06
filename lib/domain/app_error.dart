import 'package:coding_interview_frontend/util/logger.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class AppError extends Equatable implements Exception {}

class UnknownException extends AppError {
  UnknownException({this.exception});

  final dynamic exception;

  @override
  List<Object?> get props => [exception];
}

extension AsAppError on DioException {
  Future<AppError> asAppError() async {
    final error = this.error;
    final data = response?.data;

    logger.d('Error data: $data');
    return UnknownException(exception: error);
  }
}
