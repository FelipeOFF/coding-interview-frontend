import 'package:coding_interview_frontend/di/abstract_binding.dart';
import 'package:coding_interview_frontend/features/home/controller/home_controller.dart';
import 'package:get_it/get_it.dart';

class HomeBinding extends AbstractBinding {
  @override
  Future<void> binding(GetIt it) async {
    it.registerSingleton<HomeController>(HomeController());
  }
}