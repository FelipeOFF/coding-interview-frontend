import 'dart:async';

import 'package:coding_interview_frontend/model/recommendations/recommendation_currency.dart';
import 'package:coding_interview_frontend/model/recommendations/req/recommendation_req.dart';
import 'package:coding_interview_frontend/model/recommendations/res/recommendation_res.dart';
import 'package:coding_interview_frontend/repository/recommendation_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockRecommendationRepository extends Mock
    implements RecommendationRepository {}

// ignore: avoid_implementing_value_types
class MockRecommendationReq extends Mock implements RecommendationReq {}

// ignore: avoid_implementing_value_types
class MockRecommendationRes extends Mock implements RecommendationRes {}

// Concrete implementation for testing the abstract class structure
class TestRecommendationRepository extends RecommendationRepository {
  const TestRecommendationRepository();

  @override
  Future<RecommendationRes> getRecommendation(RecommendationReq req) async =>
      MockRecommendationRes();
}

void main() {
  group('RecommendationRepository', () {
    late MockRecommendationRepository mockRepository;
    late MockRecommendationReq mockReq;
    late MockRecommendationRes mockRes;

    setUp(() {
      mockRepository = MockRecommendationRepository();
      mockReq = MockRecommendationReq();
      mockRes = MockRecommendationRes();

      // Register fallback values for mocktail
      registerFallbackValue(mockReq);
    });

    group('Abstract class structure', () {
      test('should be instantiable through concrete implementation', () {
        const repository = TestRecommendationRepository();
        expect(repository, isA<RecommendationRepository>());
      });

      test('should have const constructor', () {
        const repository = TestRecommendationRepository();
        expect(repository, isNotNull);
      });
    });

    group('getRecommendation method', () {
      test(
        'should return RecommendationRes when called with valid request',
        () async {
          // Arrange
          when(
            () => mockRepository.getRecommendation(any()),
          ).thenAnswer((_) async => mockRes);

          // Act
          final result = await mockRepository.getRecommendation(mockReq);

          // Assert
          expect(result, equals(mockRes));
          verify(() => mockRepository.getRecommendation(mockReq)).called(1);
        },
      );

      test('should handle multiple sequential calls', () async {
        // Arrange
        final mockRes1 = MockRecommendationRes();
        final mockRes2 = MockRecommendationRes();
        final mockReq1 = MockRecommendationReq();
        final mockReq2 = MockRecommendationReq();

        when(
          () => mockRepository.getRecommendation(mockReq1),
        ).thenAnswer((_) async => mockRes1);
        when(
          () => mockRepository.getRecommendation(mockReq2),
        ).thenAnswer((_) async => mockRes2);

        // Act
        final result1 = await mockRepository.getRecommendation(mockReq1);
        final result2 = await mockRepository.getRecommendation(mockReq2);

        // Assert
        expect(result1, equals(mockRes1));
        expect(result2, equals(mockRes2));
        verify(() => mockRepository.getRecommendation(mockReq1)).called(1);
        verify(() => mockRepository.getRecommendation(mockReq2)).called(1);
      });

      test('should handle concurrent calls', () async {
        // Arrange
        when(
          () => mockRepository.getRecommendation(any()),
        ).thenAnswer((_) async => mockRes);

        // Act
        final futures = List.generate(
          3,
          (_) => mockRepository.getRecommendation(mockReq),
        );
        final results = await Future.wait(futures);

        // Assert
        expect(results, hasLength(3));
        expect(results.every((result) => result == mockRes), isTrue);
        verify(() => mockRepository.getRecommendation(mockReq)).called(3);
      });

      test('should propagate exceptions thrown during execution', () async {
        // Arrange
        final exception = Exception('Network error');
        when(
          () => mockRepository.getRecommendation(any()),
        ).thenThrow(exception);

        // Act & Assert
        expect(
          () async => mockRepository.getRecommendation(mockReq),
          throwsA(equals(exception)),
        );
        verify(() => mockRepository.getRecommendation(mockReq)).called(1);
      });

      test('should handle timeout scenarios', () async {
        // Arrange
        when(() => mockRepository.getRecommendation(any())).thenAnswer((
          _,
        ) async {
          await Future<void>.delayed(const Duration(milliseconds: 100));
          return mockRes;
        });

        // Act
        final result = await mockRepository
            .getRecommendation(mockReq)
            .timeout(const Duration(milliseconds: 200));

        // Assert
        expect(result, equals(mockRes));
        verify(() => mockRepository.getRecommendation(mockReq)).called(1);
      });

      test('should throw TimeoutException when operation times out', () async {
        // Arrange
        when(() => mockRepository.getRecommendation(any())).thenAnswer((
          _,
        ) async {
          await Future<void>.delayed(const Duration(milliseconds: 200));
          return mockRes;
        });

        // Act & Assert
        expect(
          () async => mockRepository
              .getRecommendation(mockReq)
              .timeout(const Duration(milliseconds: 50)),
          throwsA(isA<TimeoutException>()),
        );
      });

      test('should be called with correct request parameters', () async {
        // Arrange
        final specificReq = MockRecommendationReq();
        when(() => specificReq.type).thenReturn(1);
        when(() => specificReq.amount).thenReturn(100.0);
        when(
          () => specificReq.cryptoCurrencyId,
        ).thenReturn(RecommendationCurrency.tatumTronUSDC);
        when(
          () => specificReq.fiatCurrencyId,
        ).thenReturn(RecommendationCurrency.brl);
        when(
          () => specificReq.amountCurrencyId,
        ).thenReturn(RecommendationCurrency.tatumTronUSDC);

        when(
          () => mockRepository.getRecommendation(specificReq),
        ).thenAnswer((_) async => mockRes);

        // Act
        await mockRepository.getRecommendation(specificReq);

        // Assert
        verify(() => mockRepository.getRecommendation(specificReq)).called(1);
      });

      test('should handle different request types', () async {
        // Arrange
        final req1 = MockRecommendationReq();
        final req2 = MockRecommendationReq();
        final res1 = MockRecommendationRes();
        final res2 = MockRecommendationRes();

        when(() => req1.type).thenReturn(1);
        when(() => req2.type).thenReturn(2);

        when(
          () => mockRepository.getRecommendation(req1),
        ).thenAnswer((_) async => res1);
        when(
          () => mockRepository.getRecommendation(req2),
        ).thenAnswer((_) async => res2);

        // Act
        final result1 = await mockRepository.getRecommendation(req1);
        final result2 = await mockRepository.getRecommendation(req2);

        // Assert
        expect(result1, equals(res1));
        expect(result2, equals(res2));
        verify(() => mockRepository.getRecommendation(req1)).called(1);
        verify(() => mockRepository.getRecommendation(req2)).called(1);
      });

      test('should handle edge case with zero amount', () async {
        // Arrange
        final zeroAmountReq = MockRecommendationReq();
        when(() => zeroAmountReq.amount).thenReturn(0.0);
        when(
          () => mockRepository.getRecommendation(zeroAmountReq),
        ).thenAnswer((_) async => mockRes);

        // Act
        final result = await mockRepository.getRecommendation(zeroAmountReq);

        // Assert
        expect(result, equals(mockRes));
        verify(() => mockRepository.getRecommendation(zeroAmountReq)).called(1);
      });

      test('should handle edge case with negative amount', () async {
        // Arrange
        final negativeAmountReq = MockRecommendationReq();
        when(() => negativeAmountReq.amount).thenReturn(-100.0);
        when(
          () => mockRepository.getRecommendation(negativeAmountReq),
        ).thenThrow(ArgumentError('Amount cannot be negative'));

        // Act & Assert
        expect(
          () async => mockRepository.getRecommendation(negativeAmountReq),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('should handle very large amounts', () async {
        // Arrange
        final largeAmountReq = MockRecommendationReq();
        when(() => largeAmountReq.amount).thenReturn(double.maxFinite);
        when(
          () => mockRepository.getRecommendation(largeAmountReq),
        ).thenAnswer((_) async => mockRes);

        // Act
        final result = await mockRepository.getRecommendation(largeAmountReq);

        // Assert
        expect(result, equals(mockRes));
        verify(
          () => mockRepository.getRecommendation(largeAmountReq),
        ).called(1);
      });
    });

    group('Method signature validation', () {
      test('should accept RecommendationReq parameter', () {
        expect(
          const TestRecommendationRepository().getRecommendation(mockReq),
          isA<Future<RecommendationRes>>(),
        );
      });

      test('should return Future<RecommendationRes>', () {
        final future = const TestRecommendationRepository().getRecommendation(
          mockReq,
        );
        expect(future, isA<Future<RecommendationRes>>());
      });
    });

    tearDown(() {
      reset(mockRepository);
      reset(mockReq);
      reset(mockRes);
      // reset(RecommendationCurrency.brl);
    });
  });
}
