import 'package:coding_interview_frontend/model/recommendations/req/recommendation_req.dart';
import 'package:coding_interview_frontend/model/recommendations/res/recommendation_res.dart';

abstract class RecommendationRepository {
  const RecommendationRepository();

  Future<RecommendationRes> getRecommendation(RecommendationReq req);
}
