import 'package:coding_interview_frontend/domain/recommendation/recommendation_usecase.dart';
import 'package:coding_interview_frontend/model/recommendations/req/recommendation_req.dart';
import 'package:coding_interview_frontend/model/recommendations/res/recommendation_model.dart';
import 'package:coding_interview_frontend/model/recommendations/res/recommendation_res.dart';
import 'package:coding_interview_frontend/repository/recommendation_repository.dart';
import 'package:coding_interview_frontend/util/double_ext.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockRecommendationRepository extends Mock
    implements RecommendationRepository {}

// ignore: avoid_implementing_value_types
class MockRecommendationReq extends Mock implements RecommendationReq {}

// ignore: avoid_implementing_value_types
class MockRecommendationRes extends Mock implements RecommendationRes {}

// ignore: avoid_implementing_value_types
class MockRecommendationResData extends Mock implements RecommendationResData {}

// ignore: avoid_implementing_value_types
class MockByPrice extends Mock implements RecommendationResDataByPrice {}

void main() {
  group('RecommendationUseCase', () {
    late RecommendationUseCase useCase;
    late MockRecommendationRepository mockRepository;
    late MockRecommendationReq mockReq;
    late MockRecommendationRes mockRes;
    late MockRecommendationResData mockData;
    late MockByPrice mockByPrice;

    setUp(() {
      mockRepository = MockRecommendationRepository();
      mockReq = MockRecommendationReq();
      mockRes = MockRecommendationRes();
      mockData = MockRecommendationResData();
      mockByPrice = MockByPrice();
      useCase = RecommendationUseCase(repository: mockRepository);

      // Register fallback values
      registerFallbackValue(mockReq);
    });

    group('execute', () {
      test(
        '''
          uses default exchange rate of 1.0 when fiatToCryptoExchangeRate is 
          null
        ''',
        () async {
          // Arrange
          const amount = 100.0;
          const expectedExchangeRate = 1.0;
          const expectedConvertedAmount = 100.0; // 100 * 1.0

          when(() => mockReq.amount).thenReturn(amount);
          when(
            () => mockRepository.getRecommendation(any()),
          ).thenAnswer((_) async => mockRes);
          when(() => mockRes.data).thenReturn(mockData);
          when(() => mockData.byPrice).thenReturn(mockByPrice);
          when(() => mockByPrice.fiatToCryptoExchangeRate).thenReturn(null);

          // Act
          final result = await useCase.execute(mockReq);

          // Assert
          expect(
            result.totalTax,
            expectedExchangeRate.toAppMoneyFraction,
          ); // Should be '1.00'
          expect(
            result.totalAmount,
            expectedConvertedAmount.toAppMoneyFraction,
          ); // Should be '100.00'
        },
      );

      test(
        '''
          uses default exchange rate of 1.0 when fiatToCryptoExchangeRate is 
          null
        ''',
        () async {
          // Arrange
          const amount = 100.0;
          const expectedExchangeRate = 1.0;
          const expectedConvertedAmount = 100.0; // 100 * 1.0

          when(() => mockReq.amount).thenReturn(amount);
          when(
            () => mockRepository.getRecommendation(any()),
          ).thenAnswer((_) async => mockRes);
          when(() => mockRes.data).thenReturn(mockData);
          when(() => mockData.byPrice).thenReturn(mockByPrice);
          when(() => mockByPrice.fiatToCryptoExchangeRate).thenReturn(null);

          // Act
          final result = await useCase.execute(mockReq);

          // Assert
          expect(result.totalTax, expectedExchangeRate.toAppMoneyFraction);
          expect(
            result.totalAmount,
            expectedConvertedAmount.toAppMoneyFraction,
          );
        },
      );

      test('uses default exchange rate of 1.0 when data is null', () async {
        // Arrange
        const amount = 50.0;
        const expectedExchangeRate = 1.0;
        const expectedConvertedAmount = 50.0; // 50 * 1.0

        when(() => mockReq.amount).thenReturn(amount);
        when(
          () => mockRepository.getRecommendation(any()),
        ).thenAnswer((_) async => mockRes);
        when(() => mockRes.data).thenReturn(null);

        // Act
        final result = await useCase.execute(mockReq);

        // Assert
        expect(result.totalTax, expectedExchangeRate.toAppMoneyFraction);
        expect(result.totalAmount, expectedConvertedAmount.toAppMoneyFraction);
      });

      test('uses default exchange rate of 1.0 when byPrice is null', () async {
        // Arrange
        const amount = 75.0;
        const expectedExchangeRate = 1.0;
        const expectedConvertedAmount = 75.0; // 75 * 1.0

        when(() => mockReq.amount).thenReturn(amount);
        when(
          () => mockRepository.getRecommendation(any()),
        ).thenAnswer((_) async => mockRes);
        when(() => mockRes.data).thenReturn(mockData);
        when(() => mockData.byPrice).thenReturn(null);

        // Act
        final result = await useCase.execute(mockReq);

        // Assert
        expect(result.totalTax, expectedExchangeRate.toAppMoneyFraction);
        expect(result.totalAmount, expectedConvertedAmount.toAppMoneyFraction);
      });

      test('handles invalid exchange rate string and uses default', () async {
        // Arrange
        const amount = 200.0;
        const invalidExchangeRate = 'invalid_number';
        const expectedExchangeRate = 1.0;
        const expectedConvertedAmount = 200.0; // 200 * 1.0

        when(() => mockReq.amount).thenReturn(amount);
        when(
          () => mockRepository.getRecommendation(any()),
        ).thenAnswer((_) async => mockRes);
        when(() => mockRes.data).thenReturn(mockData);
        when(() => mockData.byPrice).thenReturn(mockByPrice);
        when(
          () => mockByPrice.fiatToCryptoExchangeRate,
        ).thenReturn(invalidExchangeRate);

        // Act
        final result = await useCase.execute(mockReq);

        // Assert
        expect(result.totalTax, expectedExchangeRate.toAppMoneyFraction);
        expect(result.totalAmount, expectedConvertedAmount.toAppMoneyFraction);
      });

      test('handles empty string exchange rate and uses default', () async {
        // Arrange
        const amount = 150.0;
        const emptyExchangeRate = '';
        const expectedExchangeRate = 1.0;
        const expectedConvertedAmount = 150.0; // 150 * 1.0

        when(() => mockReq.amount).thenReturn(amount);
        when(
          () => mockRepository.getRecommendation(any()),
        ).thenAnswer((_) async => mockRes);
        when(() => mockRes.data).thenReturn(mockData);
        when(() => mockData.byPrice).thenReturn(mockByPrice);
        when(
          () => mockByPrice.fiatToCryptoExchangeRate,
        ).thenReturn(emptyExchangeRate);

        // Act
        final result = await useCase.execute(mockReq);

        // Assert
        expect(result.totalTax, expectedExchangeRate.toAppMoneyFraction);
        expect(result.totalAmount, expectedConvertedAmount.toAppMoneyFraction);
      });

      test(
        'calculates converted amount correctly when exchange rate > amount',
        () async {
          // Arrange
          const amount = 10.0;
          const exchangeRateString = '20.0';
          const expectedExchangeRate = 20.0;
          const expectedConvertedAmount = 0.5; // 10 / 20

          when(() => mockReq.amount).thenReturn(amount);
          when(
            () => mockRepository.getRecommendation(any()),
          ).thenAnswer((_) async => mockRes);
          when(() => mockRes.data).thenReturn(mockData);
          when(() => mockData.byPrice).thenReturn(mockByPrice);
          when(
            () => mockByPrice.fiatToCryptoExchangeRate,
          ).thenReturn(exchangeRateString);

          // Act
          final result = await useCase.execute(mockReq);

          // Assert
          expect(result.totalTax, expectedExchangeRate.toAppMoneyFraction);
          expect(
            result.totalAmount,
            expectedConvertedAmount.toAppMoneyFraction,
          );
        },
      );

      test(
        'calculates converted amount correctly when exchange rate <= amount',
        () async {
          // Arrange
          const amount = 100.0;
          const exchangeRateString = '0.5';
          const expectedExchangeRate = 0.5;
          const expectedConvertedAmount = 50.0; // 100 * 0.5

          when(() => mockReq.amount).thenReturn(amount);
          when(
            () => mockRepository.getRecommendation(any()),
          ).thenAnswer((_) async => mockRes);
          when(() => mockRes.data).thenReturn(mockData);
          when(() => mockData.byPrice).thenReturn(mockByPrice);
          when(
            () => mockByPrice.fiatToCryptoExchangeRate,
          ).thenReturn(exchangeRateString);

          // Act
          final result = await useCase.execute(mockReq);

          // Assert
          expect(result.totalTax, expectedExchangeRate.toAppMoneyFraction);
          expect(
            result.totalAmount,
            expectedConvertedAmount.toAppMoneyFraction,
          );
        },
      );

      test(
        '''
          calculates converted amount correctly when exchange rate equals 
          amount
        ''',
        () async {
          // Arrange
          const amount = 10.0;
          const exchangeRateString = '10.0';
          const expectedExchangeRate = 10.0;
          const expectedConvertedAmount = 100.0; // 10 * 10

          when(() => mockReq.amount).thenReturn(amount);
          when(
            () => mockRepository.getRecommendation(any()),
          ).thenAnswer((_) async => mockRes);
          when(() => mockRes.data).thenReturn(mockData);
          when(() => mockData.byPrice).thenReturn(mockByPrice);
          when(
            () => mockByPrice.fiatToCryptoExchangeRate,
          ).thenReturn(exchangeRateString);

          // Act
          final result = await useCase.execute(mockReq);

          // Assert
          expect(result.totalTax, expectedExchangeRate.toAppMoneyFraction);
          expect(
            result.totalAmount,
            expectedConvertedAmount.toAppMoneyFraction,
          );
        },
      );

      test('generates estToFinish between 5 and 50 minutes from now', () async {
        // Arrange
        const amount = 100.0;
        const exchangeRateString = '1.0';

        when(() => mockReq.amount).thenReturn(amount);
        when(
          () => mockRepository.getRecommendation(any()),
        ).thenAnswer((_) async => mockRes);
        when(() => mockRes.data).thenReturn(mockData);
        when(() => mockData.byPrice).thenReturn(mockByPrice);
        when(
          () => mockByPrice.fiatToCryptoExchangeRate,
        ).thenReturn(exchangeRateString);

        // Act
        final now = DateTime.now();
        final result = await useCase.execute(mockReq);

        // Assert
        final timeDifference = result.estToFinish?.difference(now);
        expect(timeDifference?.inMinutes, greaterThanOrEqualTo(5));
        expect(timeDifference?.inMinutes, lessThanOrEqualTo(50));
      });

      test('handles zero amount', () async {
        // Arrange
        const amount = 0.0;
        const exchangeRateString = '2.0';
        const expectedExchangeRate = 2.0;
        const expectedConvertedAmount = 0.0; // 0 / 2

        when(() => mockReq.amount).thenReturn(amount);
        when(
          () => mockRepository.getRecommendation(any()),
        ).thenAnswer((_) async => mockRes);
        when(() => mockRes.data).thenReturn(mockData);
        when(() => mockData.byPrice).thenReturn(mockByPrice);
        when(
          () => mockByPrice.fiatToCryptoExchangeRate,
        ).thenReturn(exchangeRateString);

        // Act
        final result = await useCase.execute(mockReq);

        // Assert
        expect(result.totalTax, expectedExchangeRate.toAppMoneyFraction);
        expect(result.totalAmount, expectedConvertedAmount.toAppMoneyFraction);
      });

      test('handles negative amount', () async {
        // Arrange
        const amount = -100.0;
        const exchangeRateString = '2.0';
        const expectedExchangeRate = 2.0;
        const expectedConvertedAmount = -50.0; // -100 / 2

        when(() => mockReq.amount).thenReturn(amount);
        when(
          () => mockRepository.getRecommendation(any()),
        ).thenAnswer((_) async => mockRes);
        when(() => mockRes.data).thenReturn(mockData);
        when(() => mockData.byPrice).thenReturn(mockByPrice);
        when(
          () => mockByPrice.fiatToCryptoExchangeRate,
        ).thenReturn(exchangeRateString);

        // Act
        final result = await useCase.execute(mockReq);

        // Assert
        expect(result.totalTax, expectedExchangeRate.toAppMoneyFraction);
        expect(result.totalAmount, expectedConvertedAmount.toAppMoneyFraction);
      });

      test('handles very small exchange rate', () async {
        // Arrange
        const amount = 100.0;
        const exchangeRateString = '0.001';
        const expectedExchangeRate = 0.001;
        const expectedConvertedAmount = 0.1; // 100 * 0.001

        when(() => mockReq.amount).thenReturn(amount);
        when(
          () => mockRepository.getRecommendation(any()),
        ).thenAnswer((_) async => mockRes);
        when(() => mockRes.data).thenReturn(mockData);
        when(() => mockData.byPrice).thenReturn(mockByPrice);
        when(
          () => mockByPrice.fiatToCryptoExchangeRate,
        ).thenReturn(exchangeRateString);

        // Act
        final result = await useCase.execute(mockReq);

        // Assert
        expect(result.totalTax, expectedExchangeRate.toAppMoneyFraction);
        expect(result.totalAmount, expectedConvertedAmount.toAppMoneyFraction);
      });

      test('handles very large exchange rate', () async {
        // Arrange
        const amount = 1.0;
        const exchangeRateString = '10000.0';
        const expectedExchangeRate = 10000.0;
        const expectedConvertedAmount = 0.0001; // 1 / 10000

        when(() => mockReq.amount).thenReturn(amount);
        when(
          () => mockRepository.getRecommendation(any()),
        ).thenAnswer((_) async => mockRes);
        when(() => mockRes.data).thenReturn(mockData);
        when(() => mockData.byPrice).thenReturn(mockByPrice);
        when(
          () => mockByPrice.fiatToCryptoExchangeRate,
        ).thenReturn(exchangeRateString);

        // Act
        final result = await useCase.execute(mockReq);

        // Assert
        expect(result.totalTax, expectedExchangeRate.toAppMoneyFraction);
        expect(result.totalAmount, expectedConvertedAmount.toAppMoneyFraction);
      });

      test('propagates repository exceptions', () async {
        // Arrange
        final exception = Exception('Repository error');
        when(() => mockReq.amount).thenReturn(100.0);
        when(
          () => mockRepository.getRecommendation(any()),
        ).thenThrow(exception);

        // Act & Assert
        expect(() => useCase.execute(mockReq), throwsA(isA<Exception>()));
      });
    });

    group('constructor', () {
      test('requires repository parameter', () {
        // Act & Assert
        expect(
          () => RecommendationUseCase(repository: mockRepository),
          returnsNormally,
        );
      });

      test('stores repository correctly', () {
        // Act
        final useCase = RecommendationUseCase(repository: mockRepository);

        // Assert
        expect(useCase.repository, equals(mockRepository));
      });
    });

    group('edge cases with Random', () {
      test(
        'multiple executions generate different estToFinish times',
        () async {
          // Arrange
          const amount = 100.0;
          const exchangeRateString = '1.0';
          final results = <RecommendationModel>[];

          when(() => mockReq.amount).thenReturn(amount);
          when(
            () => mockRepository.getRecommendation(any()),
          ).thenAnswer((_) async => mockRes);
          when(() => mockRes.data).thenReturn(mockData);
          when(() => mockData.byPrice).thenReturn(mockByPrice);
          when(
            () => mockByPrice.fiatToCryptoExchangeRate,
          ).thenReturn(exchangeRateString);

          // Act
          for (int i = 0; i < 10; i++) {
            final result = await useCase.execute(mockReq);
            results.add(result);
            // Small delay to ensure different DateTime.now() calls
            await Future<void>.delayed(const Duration(milliseconds: 1));
          }

          // Assert - Check that we have some variation in the generated times
          // Due to Random, it's very unlikely all times will be identical
          final uniqueTimes = results.map((r) => r.estToFinish).toSet();
          expect(uniqueTimes.length, greaterThan(1));
        },
      );
    });
  });
}
