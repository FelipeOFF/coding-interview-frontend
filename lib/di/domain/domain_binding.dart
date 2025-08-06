import 'package:coding_interview_frontend/di/abstract_binding.dart';
import 'package:coding_interview_frontend/domain/recommendation/recommendation_usecase.dart';
import 'package:get_it/get_it.dart';

class DomainBinding extends AbstractBinding {
  @override
  Future<void> binding(GetIt it) async {
    it.registerSingleton<RecommendationUseCase>(
      RecommendationUseCase(repository: it.get()),
    );
  }
}
