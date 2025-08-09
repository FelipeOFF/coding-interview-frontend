import 'package:coding_interview_frontend/common/base/base_controller.dart';
import 'package:coding_interview_frontend/common/message/generic_message.dart';
import 'package:coding_interview_frontend/domain/abstract_use_case.dart';
import 'package:coding_interview_frontend/domain/app_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rx_notifier/rx_notifier.dart';

// Mock classes
class MockAbstractUseCase<P, R> extends Mock implements AbstractUseCase<P, R> {}

// ignore: avoid_implementing_value_types
class MockAppError extends Mock implements AppError {}

class MockGenericMessage extends Mock implements GenericMessage {}

// Concrete implementation for testing
class TestController extends BaseController {}

void main() {
  group('BaseController', () {
    late TestController controller;
    late MockAbstractUseCase<String, String> mockUseCase;
    late MockAppError mockAppError;
    late MockGenericMessage mockGenericMessage;

    setUp(() {
      controller = TestController();
      mockUseCase = MockAbstractUseCase<String, String>();
      mockAppError = MockAppError();
      mockGenericMessage = MockGenericMessage();

      // Register fallback values
      registerFallbackValue('test');
      registerFallbackValue(mockAppError);
      registerFallbackValue(mockGenericMessage);
    });

    tearDown(() async {
      await controller.dispose();
    });

    group('Initialization', () {
      test(
        'should initialize with null message and isLoading values before init',
        () {
          expect(controller.message, isNull);
          expect(controller.isLoading, isFalse);
        },
      );

      test('should initialize message and isLoading after calling init', () {
        controller.init();

        expect(controller.message, isA<EmptyMessage>());
        expect(controller.isLoading, isFalse);
      });
    });

    group('Message and Loading state management', () {
      setUp(() {
        controller.init();
      });

      test('should set and get loading state correctly', () {
        controller.isLoading = true;
        expect(controller.isLoading, isTrue);

        controller.isLoading = false;
        expect(controller.isLoading, isFalse);

        expect(controller.isLoading, isFalse);
      });

      test('should handle null message assignment', () {
        controller.message = null;
        expect(controller.message, isNull);
      });
    });

    group('execSingle method', () {
      setUp(() {
        controller.init();
      });

      test('should execute use case successfully and return result', () async {
        // Arrange
        const input = 'test input';
        const expectedOutput = 'test output';
        when(
          () => mockUseCase.call(input),
        ).thenAnswer((_) async => const Right(expectedOutput));

        // Act
        final result = await controller.exec(
          input,
          mockUseCase,
          showLoading: false,
        );

        // Assert
        expect(result, equals(expectedOutput));
        verify(() => mockUseCase.call(input)).called(1);
      });

      test('should set loading state when showLoading is true', () async {
        // Arrange
        const input = 'test input';
        const expectedOutput = 'test output';
        when(
          () => mockUseCase.call(input),
        ).thenAnswer((_) async => const Right(expectedOutput));

        // Track loading states
        final loadingStates = <bool?>[];
        controller.init();
        final disposer = rxObserver(() {
          loadingStates.add(controller.isLoading);
        });

        // Act
        await controller.exec(input, mockUseCase);

        // Assert
        expect(loadingStates, contains(true));
        expect(loadingStates.last, isFalse);

        disposer();
      });

      test('should not set loading state when showLoading is false', () async {
        // Arrange
        const input = 'test input';
        const expectedOutput = 'test output';
        when(
          () => mockUseCase.call(input),
        ).thenAnswer((_) async => const Right(expectedOutput));

        final initialLoading = controller.isLoading;

        // Act
        await controller.exec(input, mockUseCase, showLoading: false);

        // Assert
        expect(controller.isLoading, equals(initialLoading));
      });
    });

    group('Disposal', () {
      test('should handle disposal when notifiers are null', () async {
        // Act & Assert - Should not throw any exception
        await expectLater(controller.dispose(), completes);
      });
    });

    group('Edge cases', () {
      test('should handle setting loading before initialization', () {
        // Act & Assert - Should not throw, but loading will be null
        controller.isLoading = true;
        expect(controller.isLoading, isFalse);
      });

      test('should handle multiple execSingle calls concurrently', () async {
        // Arrange
        controller.init();
        when(
          () => mockUseCase.call('input1'),
        ).thenAnswer((_) async => const Right('output1'));
        when(
          () => mockUseCase.call('input2'),
        ).thenAnswer((_) async => const Right('output2'));

        // Act
        final futures = [
          controller.exec('input1', mockUseCase, showLoading: false),
          controller.exec('input2', mockUseCase, showLoading: false),
        ];

        final results = await Future.wait(futures);

        // Assert
        expect(results[0], equals('output1'));
        expect(results[1], equals('output2'));
      });
    });
  });
}
