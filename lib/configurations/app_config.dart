import 'package:coding_interview_frontend/model/network/url.dart';

class AppConfig {
  AppConfig({required this.serverUrl, this.isLoggingEnable = true});

  final Url serverUrl;
  final bool isLoggingEnable;
}
