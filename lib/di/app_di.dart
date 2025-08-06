import 'package:coding_interview_frontend/configurations/di/app_config_binding.dart';
import 'package:coding_interview_frontend/di/abstract_binding.dart';
import 'package:coding_interview_frontend/di/repository/repository_binding.dart';
import 'package:get_it/get_it.dart';

class AppDI {
  const AppDI._();

  static final GetIt it = GetIt.instance;

  static final List<AbstractBinding> _listOfBasicInfrastructure = [
    AppConfigBinding(),
    RepositoryBinding(),
  ];

  static final List<AbstractBinding> _getListOfBiding = [
    ..._listOfBasicInfrastructure,
  ];

  static Future<void> setupDI() async {
    for (final element in _getListOfBiding) {
      await element.binding(it);
    }
  }
}
