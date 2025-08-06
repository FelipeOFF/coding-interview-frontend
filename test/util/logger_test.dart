import 'package:coding_interview_frontend/util/logger.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for LogOutput
class MockLogOutput extends Mock implements LogOutput {
  @override
  Future<void> init() async {
    print('init output');
  }

  @override
  void output(OutputEvent event) {
    print('init output');
    print(event);
  }
}

void main() {
  group('PermissiveFilter', () {
    late PermissiveFilter filter;

    setUp(() {
      filter = PermissiveFilter();
    });

    test('should always return true for any log event', () {
      // Test with different log levels
      final logLevels = [
        Level.trace,
        Level.debug,
        Level.info,
        Level.warning,
        Level.error,
        Level.fatal,
      ];

      for (final level in logLevels) {
        final event = LogEvent(level, 'Test message');

        expect(
          filter.shouldLog(event),
          isTrue,
          reason: 'Should return true for ${level.name} level',
        );
      }
    });

    test('should return true for log event with error', () {
      final event = LogEvent(
        Level.error,
        'Error message',
        error: Exception('Test exception'),
      );

      expect(filter.shouldLog(event), isTrue);
    });

    test('should return true for log event with stack trace', () {
      final event = LogEvent(
        Level.error,
        'Error with stack trace',
        error: Exception('Test exception'),
        stackTrace: StackTrace.current,
      );

      expect(filter.shouldLog(event), isTrue);
    });

    test('should return true for empty message', () {
      final event = LogEvent(Level.info, '');

      expect(filter.shouldLog(event), isTrue);
    });

    test('should return true for null message', () {
      final event = LogEvent(Level.info, null);

      expect(filter.shouldLog(event), isTrue);
    });

    test('should extend LogFilter', () {
      expect(filter, isA<LogFilter>());
    });
  });

  group('Edge Cases', () {
    late PermissiveFilter filter;

    setUp(() {
      filter = PermissiveFilter();
    });

    test('should handle multiple calls consistently', () {
      final event = LogEvent(Level.info, 'Test message');

      // Call multiple times
      for (int i = 0; i < 100; i++) {
        expect(filter.shouldLog(event), isTrue);
      }
    });

    test('should be thread-safe for concurrent access', () async {
      final event = LogEvent(Level.info, 'Test message');

      // Create multiple futures that call shouldLog concurrently
      final futures = List.generate(
        50,
        (index) async => filter.shouldLog(event),
      );

      final results = await Future.wait(futures);

      // All results should be true
      expect(results.every((result) => result == true), isTrue);
    });

    test('should work with different LogEvent configurations', () {
      final testCases = [
        LogEvent(Level.info, 'Normal message'),
        LogEvent(Level.error, 'Error message', error: StateError('Test error')),
        LogEvent(
          Level.warning,
          'Warning with trace',
          stackTrace: StackTrace.current,
        ),
        LogEvent(
          Level.debug,
          '',
          error: ArgumentError('Empty message'),
          stackTrace: StackTrace.current,
        ),
      ];

      for (final event in testCases) {
        expect(
          filter.shouldLog(event),
          isTrue,
          reason: 'Should return true for event with level ${event.level.name}',
        );
      }
    });
  });
}
