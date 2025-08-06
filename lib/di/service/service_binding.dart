import 'package:coding_interview_frontend/di/abstract_binding.dart';
import 'package:coding_interview_frontend/service/client/client.dart';
import 'package:get_it/get_it.dart';

class ServiceBinding extends AbstractBinding {
  @override
  Future<void> binding(GetIt it) async {
    it.registerSingleton<Client>(Client());
  }
}
