import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation_model.freezed.dart';
part 'recommendation_model.g.dart';

@freezed
abstract class RecommendationModel with _$RecommendationModel {
  const factory RecommendationModel({
    required String totalTax,
    required String totalAmount,
    required DateTime estToFinish,
  }) = _RecommendationModel;

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendationModelFromJson(json);
}