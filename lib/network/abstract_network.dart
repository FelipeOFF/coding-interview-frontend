import 'package:coding_interview_frontend/configurations/app_config.dart';
import 'package:coding_interview_frontend/configurations/constants.dart';
import 'package:coding_interview_frontend/model/network/url.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

abstract class AbstractNetwork extends DioForNative {
  AbstractNetwork({required this.config}) : super() {
    options = getBaseOptions();
    interceptors.addAll(_getInterceptors().whereType());
  }

  abstract final Url url;
  final AppConfig config;

  BaseOptions getBaseOptions() => BaseOptions(
    baseUrl: "${url.baseHost}${url.port != null ? ":${url.port}" : ""}",
    sendTimeout: sendTimeout,
    connectTimeout: connectTimeout,
    receiveTimeout: receiveTimeout,
  );

  List<Interceptor?> _getInterceptors() => [
    getLogger(),
    ...additionalInterceptors,
  ];

  List<Interceptor?> get additionalInterceptors => [];

  Interceptor getLogger() => PrettyDioLogger(
    requestHeader: true,
    queryParameters: true,
    requestBody: true,
    responseHeader: true,
    showCUrl: true,
    // ignore: avoid_redundant_argument_values
    canShowLog: config.isLoggingEnable,
  );
}
