import 'package:coding_interview_frontend/configurations/di/app_config_binding.dart';
import 'package:coding_interview_frontend/di/abstract_binding.dart';
import 'package:coding_interview_frontend/di/domain/domain_binding.dart';
import 'package:coding_interview_frontend/di/repository/repository_binding.dart';
import 'package:coding_interview_frontend/di/service/service_binding.dart';
import 'package:coding_interview_frontend/features/home/di/home_binding.dart';
import 'package:get_it/get_it.dart';

class AppDI {
  const AppDI._();

  static final GetIt it = GetIt.instance;

  static final List<AbstractBinding> _listOfBasicInfrastructure = [
    AppConfigBinding(),
    ServiceBinding(),
    RepositoryBinding(),
    DomainBinding(),
  ];

  static final List<AbstractBinding> _getListOfBiding = [
    ..._listOfBasicInfrastructure,

    HomeBinding(),
  ];

  static Future<void> setupDI() async {
    for (final element in _getListOfBiding) {
      await element.binding(it);
    }
  }
}
