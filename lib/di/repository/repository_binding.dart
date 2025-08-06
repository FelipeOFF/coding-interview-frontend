import 'package:coding_interview_frontend/di/abstract_binding.dart';
import 'package:coding_interview_frontend/repository/recommendation_repository.dart';
import 'package:coding_interview_frontend/repository/recommendation_repository_impl.dart';
import 'package:get_it/get_it.dart';

class RepositoryBinding extends AbstractBinding {
  @override
  Future<void> binding(GetIt it) async {
    it.registerSingleton<RecommendationRepository>(
      RecommendationRepositoryImpl(client: it.get()),
    );
  }
}
