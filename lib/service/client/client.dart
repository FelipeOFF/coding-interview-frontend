import 'package:coding_interview_frontend/configurations/app_config.dart';
import 'package:coding_interview_frontend/di/app_di.dart';
import 'package:coding_interview_frontend/model/network/url.dart';
import 'package:coding_interview_frontend/network/abstract_network.dart';

class Client extends AbstractNetwork {
  @override
  AppConfig get config => AppDI.it<AppConfig>();

  @override
  Url get url => config.serverUrl;
}
