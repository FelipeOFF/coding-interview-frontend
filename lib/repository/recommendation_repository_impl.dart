import 'package:coding_interview_frontend/model/recommendations/req/recommendation_req.dart';
import 'package:coding_interview_frontend/model/recommendations/res/recommendation_res.dart';
import 'package:coding_interview_frontend/repository/recommendation_repository.dart';
import 'package:coding_interview_frontend/service/client/client.dart';
import 'package:coding_interview_frontend/service/endpoint/endpoints.dart';

class RecommendationRepositoryImpl extends RecommendationRepository {
  const RecommendationRepositoryImpl({required this.client});

  final Client client;

  @override
  Future<RecommendationRes> getRecommendation(RecommendationReq req) async {
    final result = await client.get<Map<String, dynamic>>(
      Endpoints.recommendation,
      queryParameters: req.toJson(),
    );

    final jsonResult = result.data;
    final recommendationRes = RecommendationRes.fromJson(jsonResult ?? {});

    return recommendationRes;
  }
}
