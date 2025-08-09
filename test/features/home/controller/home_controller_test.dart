import 'package:coding_interview_frontend/domain/recommendation/recommendation_usecase.dart';
import 'package:coding_interview_frontend/features/home/controller/home_controller.dart';
import 'package:coding_interview_frontend/model/recommendations/recommendation_currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecommendationUseCase extends Mock implements RecommendationUseCase {}

void main() {
  group('HomeController Tests', () {
    late HomeController controller;
    late MockRecommendationUseCase mockUseCase;

    setUp(() {
      mockUseCase = MockRecommendationUseCase();
      controller = HomeController(useCase: mockUseCase);
    });

    group('Initial State Tests', () {
      test('should initialize with default values', () {
        expect(controller.haveCurrency, RecommendationCurrency.tatumTronUSDC);
        expect(controller.wantCurrency, RecommendationCurrency.ves);
        expect(controller.switched, false);
        expect(controller.amount, 0);
        expect(controller.result, null);
      });
    });

    group('Currency Setter Tests', () {
      test('should update haveCurrency', () {
        controller.haveCurrency = RecommendationCurrency.brl;
        expect(controller.haveCurrency, RecommendationCurrency.brl);
      });

      test('should update wantCurrency', () {
        controller.wantCurrency = RecommendationCurrency.cop;
        expect(controller.wantCurrency, RecommendationCurrency.cop);
      });

      test('should update switched', () {
        controller.switched = true;
        expect(controller.switched, true);
      });

      test('should update amount', () {
        controller.amount = 50.5;
        expect(controller.amount, 50.5);
      });
    });

    group('fetchChange Behavior Tests', () {
      test('should not trigger loading when amount is 0', () async {
        controller.amount = 0;

        await controller.fetchChange();

        expect(controller.isLoading, false);
      });

      test('should not trigger loading when amount is negative', () async {
        controller.amount = -10;

        await controller.fetchChange();

        expect(controller.isLoading, false);
      });
    });

    group('Result Setter Tests', () {
      test('should set result to null', () {
        controller.result = null;

        expect(controller.result, null);
      });
    });

    group('Edge Cases', () {
      test('should handle very large amounts', () {
        controller.amount = double.maxFinite;
        expect(controller.amount, double.maxFinite);
      });

      test('should handle very small positive amounts', () {
        controller.amount = 0.01;
        expect(controller.amount, 0.01);
      });

      test('should handle decimal amounts', () {
        controller.amount = 123.456;
        expect(controller.amount, 123.456);
      });

      test('should handle currency switching multiple times', () {
        controller
          ..haveCurrency = RecommendationCurrency.brl
          ..wantCurrency = RecommendationCurrency.cop
          ..switched = true
          ..haveCurrency = RecommendationCurrency.pen;

        expect(controller.haveCurrency, RecommendationCurrency.pen);
        expect(controller.switched, true);
      });
    });
  });
}
