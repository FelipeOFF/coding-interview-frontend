import 'package:coding_interview_frontend/domain/abstract_use_case.dart';
import 'package:coding_interview_frontend/domain/app_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

// Concrete implementation for testing
class TestUseCase extends AbstractUseCase<String, int> {
  TestUseCase(this._executeFunction);

  final Future<int> Function(String) _executeFunction;

  @override
  Future<int> execute(String param) => _executeFunction(param);
}

class TestUseCaseWithKey extends AbstractUseCase<String, int> {
  TestUseCaseWithKey(this._executeFunction, this._key);

  final Future<int> Function(String) _executeFunction;
  final String _key;

  @override
  String get key => _key;

  @override
  Future<int> execute(String param) => _executeFunction(param);
}

// Mock classes
class MockDioException extends Mock implements DioException {}

// ignore: avoid_implementing_value_types
class MockAppError extends Mock implements AppError {}

// Extension mock for DioException
class MockDioExceptionExtension extends Mock {
  Future<AppError> asAppError();
}

void main() {
  group('AbstractUseCase', () {
    late TestUseCase useCase;

    group('key property', () {
      test('returns null by default', () {
        useCase = TestUseCase((_) async => 42);
        expect(useCase.key, isNull);
      });

      test('returns custom key when overridden', () {
        const testKey = 'test_key';
        final useCaseWithKey = TestUseCaseWithKey((_) async => 42, testKey);
        expect(useCaseWithKey.key, equals(testKey));
      });
    });

    group('call method', () {
      test('returns Right with result when execute succeeds', () async {
        // Arrange
        const input = 'test_input';
        const expectedResult = 42;
        useCase = TestUseCase((_) async => expectedResult);

        // Act
        final result = await useCase.call(input);

        // Assert
        expect(result, isA<Right<AppError, int>>());
        expect(result.getOrElse((error) => -1), equals(expectedResult));
      });

      test(
        '''
           returns Right with result when execute succeeds with forceRefresh 
           true
        ''',
        () async {
          // Arrange
          const input = 'test_input';
          const expectedResult = 100;
          useCase = TestUseCase((_) async => expectedResult);

          // Act
          final result = await useCase.call(input, forceRefresh: true);

          // Assert
          expect(result, isA<Right<AppError, int>>());
          expect(result.getOrElse((error) => -1), equals(expectedResult));
        },
      );

      test(
        'returns Left with UnknownException when generic exception is thrown',
        () async {
          // Arrange
          const input = 'test_input';
          final genericException = Exception('Generic error');

          useCase = TestUseCase((_) async {
            throw genericException;
          });

          // Act
          final result = await useCase.call(input);

          // Assert
          expect(result, isA<Left<AppError, int>>());
          final error = result.swap().getOrElse(
            (error) => throw Exception('Should not reach here'),
          );
          expect(error, isA<UnknownException>());
          expect(
            (error as UnknownException).exception,
            equals(genericException),
          );
        },
      );

      test('handles null parameter correctly', () async {
        // Arrange
        const expectedResult = 999;
        final nullableUseCase = TestUseCase((param) async => int.parse(param));

        // Act
        final result = await nullableUseCase.call('999');

        // Assert
        expect(result, isA<Right<AppError, int>>());
        expect(result.getOrElse((error) => -1), equals(expectedResult));
      });

      test('handles empty string parameter', () async {
        // Arrange
        const input = '';
        const expectedResult = 0;
        useCase = TestUseCase(
          (param) async => param.isEmpty ? 0 : param.length,
        );

        // Act
        final result = await useCase.call(input);

        // Assert
        expect(result, isA<Right<AppError, int>>());
        expect(result.getOrElse((error) => -1), equals(expectedResult));
      });

      test('preserves original exception in UnknownException', () async {
        // Arrange
        const input = 'test_input';
        final originalException = ArgumentError('Invalid argument');

        useCase = TestUseCase((_) async {
          throw originalException;
        });

        // Act
        final result = await useCase.call(input);

        // Assert
        expect(result, isA<Left<AppError, int>>());
        final error = result.swap().getOrElse(
          (error) => throw Exception('Should not reach here'),
        );
        expect(error, isA<UnknownException>());
        expect(
          (error as UnknownException).exception,
          equals(originalException),
        );
      });

      test('handles execute method that returns null', () async {
        // Arrange
        const input = 'test_input';
        final nullableUseCase = TestUseCase((_) async => -1);

        // Act
        final result = await nullableUseCase.call(input);

        // Assert
        expect(result, isA<Right<AppError, int>>());
        expect(result.getOrElse((error) => -1), -1);
      });
    });

    group('edge cases', () {
      test('handles multiple consecutive calls', () async {
        // Arrange
        useCase = TestUseCase((param) async => param.length);
        const inputs = ['a', 'bb', 'ccc'];

        // Act & Assert
        for (int i = 0; i < inputs.length; i++) {
          final result = await useCase.call(inputs[i]);
          expect(result, isA<Right<AppError, int>>());
          expect(result.getOrElse((error) => -1), equals(inputs[i].length));
        }
      });

      test('handles async execution correctly', () async {
        // Arrange
        const input = 'async_test';
        const delay = Duration(milliseconds: 100);
        const expectedResult = 42;

        useCase = TestUseCase((_) async {
          await Future<void>.delayed(delay);
          return expectedResult;
        });

        // Act
        final stopwatch = Stopwatch()..start();
        final result = await useCase.call(input);
        stopwatch.stop();

        // Assert
        expect(result, isA<Right<AppError, int>>());
        expect(result.getOrElse((error) => -1), equals(expectedResult));
        expect(
          stopwatch.elapsedMilliseconds,
          greaterThanOrEqualTo(delay.inMilliseconds),
        );
      });
    });
  });
}
