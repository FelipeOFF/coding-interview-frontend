import 'package:coding_interview_frontend/common/message/generic_message.dart';
import 'package:coding_interview_frontend/domain/app_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ignore: avoid_implementing_value_types
class MockAppError extends Mock implements AppError {}

void main() {
  group('GenericMessage', () {
    late MockAppError mockAppError;

    setUp(() {
      mockAppError = MockAppError();
    });

    group('Constructor', () {
      test('should create instance with all parameters', () {
        // Arrange
        const title = 'Test Title';
        const message = 'Test Message';

        // ignore: avoid_annotating_with_dynamic
        Future<void> onEvent(dynamic value) async {}

        // Act
        final genericMessage = GenericMessage(
          title: title,
          message: message,
          error: mockAppError,
          onEvent: onEvent,
        );

        // Assert
        expect(genericMessage.title, equals(title));
        expect(genericMessage.message, equals(message));
        expect(genericMessage.error, equals(mockAppError));
        expect(genericMessage.onEvent, equals(onEvent));
      });

      test('should create instance with only title', () {
        // Arrange
        const title = 'Test Title';

        // Act
        final genericMessage = GenericMessage(title: title);

        // Assert
        expect(genericMessage.title, equals(title));
        expect(genericMessage.message, isNull);
        expect(genericMessage.error, isNull);
        expect(genericMessage.onEvent, isNull);
      });

      test('should create instance with only message', () {
        // Arrange
        const message = 'Test Message';

        // Act
        final genericMessage = GenericMessage(message: message);

        // Assert
        expect(genericMessage.title, isNull);
        expect(genericMessage.message, equals(message));
        expect(genericMessage.error, isNull);
        expect(genericMessage.onEvent, isNull);
      });

      test('should create instance with only error', () {
        // Act
        final genericMessage = GenericMessage(error: mockAppError);

        // Assert
        expect(genericMessage.title, isNull);
        expect(genericMessage.message, isNull);
        expect(genericMessage.error, equals(mockAppError));
        expect(genericMessage.onEvent, isNull);
      });

      test('should create instance with only onEvent', () {
        // Arrange

        // ignore: avoid_annotating_with_dynamic
        Future<void> onEvent(dynamic value) async {}

        // Act
        final genericMessage = GenericMessage(onEvent: onEvent);

        // Assert
        expect(genericMessage.title, isNull);
        expect(genericMessage.message, isNull);
        expect(genericMessage.error, isNull);
        expect(genericMessage.onEvent, equals(onEvent));
      });

      test('should create instance with no parameters (all null)', () {
        // Act
        final genericMessage = GenericMessage();

        // Assert
        expect(genericMessage.title, isNull);
        expect(genericMessage.message, isNull);
        expect(genericMessage.error, isNull);
        expect(genericMessage.onEvent, isNull);
      });
    });

    group('onEvent Function', () {
      test('should execute onEvent callback when provided', () async {
        // Arrange
        bool callbackExecuted = false;
        dynamic receivedValue;

        // ignore: avoid_annotating_with_dynamic
        Future<void> onEvent(dynamic value) async {
          callbackExecuted = true;
          receivedValue = value;
        }

        final genericMessage = GenericMessage(onEvent: onEvent);
        const testValue = 'test value';

        // Act
        await genericMessage.onEvent!(testValue);

        // Assert
        expect(callbackExecuted, isTrue);
        expect(receivedValue, equals(testValue));
      });

      test('should handle onEvent with different data types', () async {
        // Arrange
        final receivedValues = <dynamic>[];

        // ignore: avoid_annotating_with_dynamic
        Future<void> onEvent(dynamic value) async {
          receivedValues.add(value);
        }

        final genericMessage = GenericMessage(onEvent: onEvent);

        // Act & Assert
        await genericMessage.onEvent!('string');
        expect(receivedValues.last, equals('string'));

        await genericMessage.onEvent!(42);
        expect(receivedValues.last, equals(42));

        await genericMessage.onEvent!({'key': 'value'});
        expect(receivedValues.last, equals({'key': 'value'}));

        await genericMessage.onEvent!(null);
        expect(receivedValues.last, isNull);
      });

      test('should handle onEvent that throws exception', () async {
        // Arrange

        // ignore: avoid_annotating_with_dynamic
        Future<void> onEvent(dynamic value) async {
          throw Exception('Test exception');
        }

        final genericMessage = GenericMessage(onEvent: onEvent);

        // Act & Assert
        expect(
          () async => genericMessage.onEvent!('test'),
          throwsA(isA<Exception>()),
        );
      });
    });
  });

  group('EmptyMessage', () {
    test('should create instance that extends GenericMessage', () {
      // Act
      final emptyMessage = EmptyMessage();

      // Assert
      expect(emptyMessage, isA<GenericMessage>());
    });

    test('should have all properties as null', () {
      // Act
      final emptyMessage = EmptyMessage();

      // Assert
      expect(emptyMessage.title, isNull);
      expect(emptyMessage.message, isNull);
      expect(emptyMessage.error, isNull);
      expect(emptyMessage.onEvent, isNull);
    });

    test('should be different instances when created multiple times', () {
      // Act
      final emptyMessage1 = EmptyMessage();
      final emptyMessage2 = EmptyMessage();

      // Assert
      expect(emptyMessage1, isNot(same(emptyMessage2)));
    });
  });

  group('Edge Cases and Integration', () {
    test('should handle empty strings for title and message', () {
      // Act
      final genericMessage = GenericMessage(title: '', message: '');

      // Assert
      expect(genericMessage.title, equals(''));
      expect(genericMessage.message, equals(''));
    });

    test('should handle very long strings', () {
      // Arrange
      final longString = 'a' * 10000;

      // Act
      final genericMessage = GenericMessage(
        title: longString,
        message: longString,
      );

      // Assert
      expect(genericMessage.title, equals(longString));
      expect(genericMessage.message, equals(longString));
    });

    test('should handle special characters in title and message', () {
      // Arrange
      const specialTitle = r'🔥 Special Title with émojis & symbols! @#$%^&*()';
      const specialMessage = 'Message with\nnewlines\tand\ttabs';

      // Act
      final genericMessage = GenericMessage(
        title: specialTitle,
        message: specialMessage,
      );

      // Assert
      expect(genericMessage.title, equals(specialTitle));
      expect(genericMessage.message, equals(specialMessage));
    });
  });
}
