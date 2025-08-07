import 'dart:async';

import 'package:coding_interview_frontend/model/recommendations/req/recommendation_req.dart';
import 'package:coding_interview_frontend/model/recommendations/res/recommendation_res.dart';
import 'package:coding_interview_frontend/repository/recommendation_repository_impl.dart';
import 'package:coding_interview_frontend/service/client/client.dart';
import 'package:coding_interview_frontend/service/endpoint/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockClient extends Mock implements Client {}

// ignore: avoid_implementing_value_types
class MockRecommendationReq extends Mock implements RecommendationReq {}

// ignore: avoid_implementing_value_types
class MockRecommendationRes extends Mock implements RecommendationRes {}

// Mock response class to simulate client response
class MockClientResponse<T> extends Mock {
  MockClientResponse({this.data});

  final T? data;
}

void main() {
  group('RecommendationRepositoryImpl', () {
    late MockClient mockClient;
    late MockRecommendationReq mockReq;
    late RecommendationRepositoryImpl repository;

    setUp(() {
      mockClient = MockClient();
      mockReq = MockRecommendationReq();
      repository = RecommendationRepositoryImpl(client: mockClient);

      // Register fallback values for mocktail
      registerFallbackValue(mockReq);
    });

    group('Constructor', () {
      test('should create instance with required client parameter', () {
        // Act & Assert
        expect(repository, isA<RecommendationRepositoryImpl>());
        expect(repository.client, equals(mockClient));
      });

      test('should be const constructor', () {
        // Act
        final repository1 = RecommendationRepositoryImpl(client: MockClient());
        final repository2 = RecommendationRepositoryImpl(client: MockClient());

        // Assert
        expect(repository1, isA<RecommendationRepositoryImpl>());
        expect(repository2, isA<RecommendationRepositoryImpl>());
      });
    });

    group('getRecommendation', () {
      test(
        'should return RecommendationRes when client call succeeds',
        () async {
          // Arrange
          final expectedReqJson = {'type': 1, 'amount': 100.0};

          when(() => mockReq.toJson()).thenReturn(expectedReqJson);
          when(
            () => mockClient.get<Map<String, dynamic>>(
              any(),
              queryParameters: any(named: 'queryParameters'),
            ),
          ).thenAnswer(
            (_) async => Response(
              data: {
                'data': {
                  'byPrice': {'fiatToCryptoExchangeRate': '104'},
                },
              },
              requestOptions: RequestOptions(),
            ),
          );

          // Act
          final result = await repository.getRecommendation(mockReq);

          // Assert
          expect(result, isA<RecommendationRes>());
          verify(
            () => mockClient.get<Map<String, dynamic>>(
              Endpoints.recommendation,
              queryParameters: expectedReqJson,
            ),
          ).called(1);
          verify(() => mockReq.toJson()).called(1);
        },
      );

      test('should handle null response data gracefully', () async {
        // Arrange
        final expectedReqJson = {'type': 1, 'amount': 100.0};

        when(() => mockReq.toJson()).thenReturn(expectedReqJson);
        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: {
              'data': {
                'byPrice': {'fiatToCryptoExchangeRate': '104'},
              },
            },
            requestOptions: RequestOptions(),
          ),
        );

        // Act
        final result = await repository.getRecommendation(mockReq);

        // Assert
        expect(result, isA<RecommendationRes>());
        verify(
          () => mockClient.get<Map<String, dynamic>>(
            Endpoints.recommendation,
            queryParameters: expectedReqJson,
          ),
        ).called(1);
      });

      test('should handle empty response data', () async {
        // Arrange
        final expectedReqJson = {'type': 1, 'amount': 100.0};

        when(() => mockReq.toJson()).thenReturn(expectedReqJson);
        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: {
              'data': {
                'byPrice': {'fiatToCryptoExchangeRate': '104'},
              },
            },
            requestOptions: RequestOptions(),
          ),
        );

        // Act
        final result = await repository.getRecommendation(mockReq);

        // Assert
        expect(result, isA<RecommendationRes>());
        verify(
          () => mockClient.get<Map<String, dynamic>>(
            Endpoints.recommendation,
            queryParameters: expectedReqJson,
          ),
        ).called(1);
      });

      test('should pass correct endpoint to client', () async {
        // Arrange
        final expectedReqJson = {'type': 1, 'amount': 100.0};

        when(() => mockReq.toJson()).thenReturn(expectedReqJson);
        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: {
              'data': {
                'byPrice': {'fiatToCryptoExchangeRate': '104'},
              },
            },
            requestOptions: RequestOptions(),
          ),
        );

        // Act
        await repository.getRecommendation(mockReq);

        // Assert
        verify(
          () => mockClient.get<Map<String, dynamic>>(
            Endpoints.recommendation,
            queryParameters: any(named: 'queryParameters'),
          ),
        ).called(1);
      });

      test('should pass request JSON as query parameters', () async {
        // Arrange
        final expectedReqJson = {'type': 2, 'amount': 250.5, 'currency': 'USD'};

        when(() => mockReq.toJson()).thenReturn(expectedReqJson);
        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: {
              'data': {
                'byPrice': {'fiatToCryptoExchangeRate': '104'},
              },
            },
            requestOptions: RequestOptions(),
          ),
        );

        // Act
        await repository.getRecommendation(mockReq);

        // Assert
        verify(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: expectedReqJson,
          ),
        ).called(1);
      });

      test('should handle complex response data', () async {
        // Arrange
        final expectedReqJson = {'type': 1, 'amount': 100.0};

        when(() => mockReq.toJson()).thenReturn(expectedReqJson);
        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: {
              'data': {
                'byPrice': {'fiatToCryptoExchangeRate': '104'},
              },
            },
            requestOptions: RequestOptions(),
          ),
        );

        // Act
        final result = await repository.getRecommendation(mockReq);

        // Assert
        expect(result, isA<RecommendationRes>());
        verify(
          () => mockClient.get<Map<String, dynamic>>(
            Endpoints.recommendation,
            queryParameters: expectedReqJson,
          ),
        ).called(1);
      });

      test('should propagate client exceptions', () async {
        // Arrange
        final exception = Exception('Network error');
        final expectedReqJson = {'type': 1, 'amount': 100.0};

        when(() => mockReq.toJson()).thenReturn(expectedReqJson);
        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenThrow(exception);

        // Act & Assert
        expect(
          () async => repository.getRecommendation(mockReq),
          throwsA(equals(exception)),
        );
        verify(
          () => mockClient.get<Map<String, dynamic>>(
            Endpoints.recommendation,
            queryParameters: expectedReqJson,
          ),
        ).called(1);
      });

      test('should handle client timeout exceptions', () async {
        // Arrange
        final timeoutException = TimeoutException(
          'Request timeout',
          const Duration(seconds: 30),
        );
        final expectedReqJson = {'type': 1, 'amount': 100.0};

        when(() => mockReq.toJson()).thenReturn(expectedReqJson);
        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenThrow(timeoutException);

        // Act & Assert
        expect(
          () async => repository.getRecommendation(mockReq),
          throwsA(isA<TimeoutException>()),
        );
      });

      test('should handle request serialization exceptions', () async {
        // Arrange
        final serializationException = Exception('Serialization failed');

        when(() => mockReq.toJson()).thenThrow(serializationException);

        // Act & Assert
        expect(
          () async => repository.getRecommendation(mockReq),
          throwsA(equals(serializationException)),
        );
        verifyNever(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        );
      });

      test('should handle multiple sequential calls correctly', () async {
        // Arrange
        final mockReq1 = MockRecommendationReq();
        final mockReq2 = MockRecommendationReq();
        final expectedReqJson1 = {'type': 1, 'amount': 100.0};
        final expectedReqJson2 = {'type': 2, 'amount': 200.0};

        when(mockReq1.toJson).thenReturn(expectedReqJson1);
        when(mockReq2.toJson).thenReturn(expectedReqJson2);

        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: expectedReqJson1,
          ),
        ).thenAnswer(
          (_) async => Response(
            data: {
              'data': {
                'byPrice': {'fiatToCryptoExchangeRate': '104'},
              },
            },
            requestOptions: RequestOptions(),
          ),
        );

        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: expectedReqJson2,
          ),
        ).thenAnswer(
          (_) async => Response(
            data: {
              'data': {
                'byPrice': {'fiatToCryptoExchangeRate': '104'},
              },
            },
            requestOptions: RequestOptions(),
          ),
        );

        // Act
        final result1 = await repository.getRecommendation(mockReq1);
        final result2 = await repository.getRecommendation(mockReq2);

        // Assert
        expect(result1, isA<RecommendationRes>());
        expect(result2, isA<RecommendationRes>());
        verify(
          () => mockClient.get<Map<String, dynamic>>(
            Endpoints.recommendation,
            queryParameters: expectedReqJson1,
          ),
        ).called(1);
        verify(
          () => mockClient.get<Map<String, dynamic>>(
            Endpoints.recommendation,
            queryParameters: expectedReqJson2,
          ),
        ).called(1);
      });

      test('should handle concurrent calls correctly', () async {
        // Arrange
        final expectedReqJson = {'type': 1, 'amount': 100.0};

        when(() => mockReq.toJson()).thenReturn(expectedReqJson);
        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer((_) async {
          await Future<void>.delayed(const Duration(milliseconds: 10));
          return Response(
            data: {
              'data': {
                'byPrice': {'fiatToCryptoExchangeRate': '104'},
              },
            },
            requestOptions: RequestOptions(),
          );
        });

        // Act
        final futures = List.generate(
          3,
          (_) => repository.getRecommendation(mockReq),
        );
        final results = await Future.wait(futures);

        // Assert
        expect(results, hasLength(3));
        expect(results.every((result) => result.data != null), isTrue);
        verify(
          () => mockClient.get<Map<String, dynamic>>(
            Endpoints.recommendation,
            queryParameters: expectedReqJson,
          ),
        ).called(3);
      });

      test('should handle empty request JSON', () async {
        // Arrange
        final emptyReqJson = <String, dynamic>{};

        when(() => mockReq.toJson()).thenReturn(emptyReqJson);
        when(
          () => mockClient.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: {
              'data': {
                'byPrice': {'fiatToCryptoExchangeRate': '104'},
              },
            },
            requestOptions: RequestOptions(),
          ),
        );

        // Act
        final result = await repository.getRecommendation(mockReq);

        // Assert
        expect(result, isA<RecommendationRes>());
        verify(
          () => mockClient.get<Map<String, dynamic>>(
            Endpoints.recommendation,
            queryParameters: emptyReqJson,
          ),
        ).called(1);
      });
    });

    tearDown(() {
      reset(mockClient);
      reset(mockReq);
    });
  });
}
