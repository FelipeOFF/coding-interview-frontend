import 'package:coding_interview_frontend/domain/app_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockResponse extends Mock implements Response<dynamic> {}

class MockDioException extends Mock implements DioException {}

void main() {
  group('AppError', () {
    group('UnknownException', () {
      test('should create UnknownException with null exception', () {
        // Arrange & Act
        final exception = UnknownException();

        // Assert
        expect(exception.exception, isNull);
        expect(exception.props, equals([null]));
      });

      test('should create UnknownException with provided exception', () {
        // Arrange
        const testException = 'Test error message';

        // Act
        final exception = UnknownException(exception: testException);

        // Assert
        expect(exception.exception, equals(testException));
        expect(exception.props, equals([testException]));
      });

      test('should implement Exception', () {
        // Arrange & Act
        final exception = UnknownException();

        // Assert
        expect(exception, isA<Exception>());
      });

      test('should extend AppError', () {
        // Arrange & Act
        final exception = UnknownException();

        // Assert
        expect(exception, isA<AppError>());
      });

      test('should have correct equality based on props', () {
        // Arrange
        const testException = 'Test error';
        final exception1 = UnknownException(exception: testException);
        final exception2 = UnknownException(exception: testException);
        final exception3 = UnknownException(exception: 'Different error');
        final exception4 = UnknownException();

        // Assert
        expect(exception1, equals(exception2));
        expect(exception1, isNot(equals(exception3)));
        expect(exception1, isNot(equals(exception4)));
      });

      test('should have correct hashCode based on props', () {
        // Arrange
        const testException = 'Test error';
        final exception1 = UnknownException(exception: testException);
        final exception2 = UnknownException(exception: testException);

        // Assert
        expect(exception1.hashCode, equals(exception2.hashCode));
      });
    });

    group('AsAppError extension', () {
      late DioException dioException;
      late MockResponse mockResponse;

      setUp(() {
        mockResponse = MockResponse();
        dioException = DioException(
          requestOptions: RequestOptions(path: '/test'),
          error: 'Test error message',
          response: mockResponse,
        );
      });

      test('should convert DioException to UnknownException', () async {
        // Arrange
        when(() => mockResponse.data).thenReturn({'message': 'Error occurred'});

        // Act
        final result = await dioException.asAppError();

        // Assert
        expect(result, isA<UnknownException>());
        expect(
          (result as UnknownException).exception,
          equals('Test error message'),
        );
      });

      test('should handle DioException with null error', () async {
        // Arrange
        final dioExceptionWithNullError = DioException(
          requestOptions: RequestOptions(path: '/test'),
          response: mockResponse,
        );
        when(() => mockResponse.data).thenReturn({'message': 'Error occurred'});

        // Act
        final result = await dioExceptionWithNullError.asAppError();

        // Assert
        expect(result, isA<UnknownException>());
        expect((result as UnknownException).exception, isNull);
      });

      test('should handle DioException with null response', () async {
        // Arrange
        final dioExceptionWithNullResponse = DioException(
          requestOptions: RequestOptions(path: '/test'),
          error: 'Test error',
        );

        // Act
        final result = await dioExceptionWithNullResponse.asAppError();

        // Assert
        expect(result, isA<UnknownException>());
        expect((result as UnknownException).exception, equals('Test error'));
      });

      test('should handle DioException with null response data', () async {
        // Arrange
        when(() => mockResponse.data).thenReturn(null);

        // Act
        final result = await dioException.asAppError();

        // Assert
        expect(result, isA<UnknownException>());
        expect(
          (result as UnknownException).exception,
          equals('Test error message'),
        );
      });

      test(
        'should handle DioException with different types of error objects',
        () async {
          // Arrange
          final complexError = {
            'code': 500,
            'message': 'Internal server error',
          };
          final dioExceptionWithComplexError = DioException(
            requestOptions: RequestOptions(path: '/test'),
            error: complexError,
            response: mockResponse,
          );
          when(
            () => mockResponse.data,
          ).thenReturn({'message': 'Error occurred'});

          // Act
          final result = await dioExceptionWithComplexError.asAppError();

          // Assert
          expect(result, isA<UnknownException>());
          expect((result as UnknownException).exception, equals(complexError));
        },
      );

      test(
        'should handle DioException with different response data types',
        () async {
          // Arrange
          const stringData = 'String error response';
          when(() => mockResponse.data).thenReturn(stringData);

          // Act
          final result = await dioException.asAppError();

          // Assert
          expect(result, isA<UnknownException>());
          expect(
            (result as UnknownException).exception,
            equals('Test error message'),
          );
        },
      );

      test('should handle DioException with list response data', () async {
        // Arrange
        final listData = ['error1', 'error2'];
        when(() => mockResponse.data).thenReturn(listData);

        // Act
        final result = await dioException.asAppError();

        // Assert
        expect(result, isA<UnknownException>());
        expect(
          (result as UnknownException).exception,
          equals('Test error message'),
        );
      });
    });
  });
}
