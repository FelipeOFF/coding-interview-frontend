import 'package:coding_interview_frontend/configurations/app_config.dart';
import 'package:coding_interview_frontend/configurations/build_type.dart';
import 'package:coding_interview_frontend/configurations/environment.dart';
import 'package:coding_interview_frontend/di/abstract_binding.dart';
import 'package:coding_interview_frontend/model/network/url.dart';
import 'package:coding_interview_frontend/network/urls.dart';
import 'package:get_it/get_it.dart';

class AppConfigBinding extends AbstractBinding {
  @override
  Future<void> binding(GetIt it) async {
    it.registerSingleton<AppConfig>(AppConfig(serverUrl: _serverUrl));
  }

  Url get _serverUrl => switch (_getBuildType) {
    BuildType.local => Urls.mockUrl,
    BuildType.prod => Urls.prodUrl,
  };

  BuildType get _getBuildType {
    const buildType = Environment.buildType;
    return switch (buildType) {
      'local' => BuildType.local,
      'prod' => BuildType.prod,
      _ => BuildType.prod,
    };
  }
}
