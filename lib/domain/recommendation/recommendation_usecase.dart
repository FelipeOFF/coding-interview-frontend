import 'package:coding_interview_frontend/domain/abstract_use_case.dart';
import 'package:coding_interview_frontend/model/recommendations/req/recommendation_req.dart';
import 'package:coding_interview_frontend/model/recommendations/res/recommendation_res.dart';

class RecommendationUseCase
    extends AbstractUseCase<RecommendationReq, RecommendationRes> {
  @override
  Future<RecommendationRes> execute(RecommendationReq param) {
    throw UnimplementedError();
  }
}
