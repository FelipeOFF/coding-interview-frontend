import 'package:coding_interview_frontend/common/helper/date_time_ext.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppS extends Mock implements AppS {}

void main() {
  group('DateTimeExt formatDateToLess tests', () {
    late MockAppS mockAppS;

    setUp(() {
      mockAppS = MockAppS();
    });

    group('Success scenarios', () {
      test('should return justNow when difference is zero or negative', () {
        // Arrange
        final currentDate = DateTime.now();
        when(() => mockAppS.justNow).thenReturn('Just now');

        // Act
        final result = currentDate.formatDateToLess(mockAppS);

        // Assert
        expect(result, equals('Just now'));
        verify(() => mockAppS.justNow).called(1);
      });

      test('should return justNow when date is in the past', () {
        // Arrange
        final pastDate = DateTime.now().subtract(const Duration(minutes: 5));
        when(() => mockAppS.justNow).thenReturn('Just now');

        // Act
        final result = pastDate.formatDateToLess(mockAppS);

        // Assert
        expect(result, equals('Just now'));
        verify(() => mockAppS.justNow).called(1);
      });

      test('should prioritize hours over minutes when both are present', () {
        // Arrange
        final futureDate = DateTime.now().add(
          const Duration(hours: 3, minutes: 30),
        );
        when(() => mockAppS.hour(3)).thenReturn('3 hours');

        // Act
        final result = futureDate.formatDateToLess(mockAppS);

        // Assert
        expect(result, equals('3 hours'));
        verify(() => mockAppS.hour(3)).called(1);
        verifyNever(() => mockAppS.min(any()));
      });

      test('should prioritize minutes over seconds when both are present', () {
        // Arrange
        final futureDate = DateTime.now().add(
          const Duration(minutes: 2, seconds: 30),
        );
        when(() => mockAppS.min(2)).thenReturn('2 minutes');

        // Act
        final result = futureDate.formatDateToLess(mockAppS);

        // Assert
        expect(result, equals('2 minutes'));
        verify(() => mockAppS.min(2)).called(1);
        verifyNever(() => mockAppS.sec(any()));
      });
    });

    group('Boundary testing', () {
      test('should handle 23 hours 59 minutes as hours', () {
        // Arrange
        final futureDate = DateTime.now().add(
          const Duration(hours: 23, minutes: 59),
        );
        when(() => mockAppS.hour(23)).thenReturn('23 hours');

        // Act
        final result = futureDate.formatDateToLess(mockAppS);

        // Assert
        expect(result, equals('23 hours'));
        verify(() => mockAppS.hour(23)).called(1);
      });
    });

    group('Edge cases and error scenarios', () {
      test('should handle negative time differences (past dates)', () {
        // Arrange
        final pastDate = DateTime.now().subtract(const Duration(hours: 5));
        when(() => mockAppS.justNow).thenReturn('Just now');

        // Act
        final result = pastDate.formatDateToLess(mockAppS);

        // Assert
        expect(result, equals('Just now'));
        verify(() => mockAppS.justNow).called(1);
      });

      test('should handle leap seconds and milliseconds', () {
        // Arrange
        final futureDate = DateTime.now().add(
          const Duration(milliseconds: 999),
        );
        when(() => mockAppS.justNow).thenReturn('Just now');

        // Act
        final result = futureDate.formatDateToLess(mockAppS);

        // Assert
        expect(result, equals('Just now'));
        verify(() => mockAppS.justNow).called(1);
      });
    });

    group('Mock behavior testing', () {});

    group('Stress testing', () {
      test('should handle rapid successive calls', () {
        // Arrange
        final baseTime = DateTime.now();
        final dates = List.generate(
          100,
          (i) => baseTime.add(Duration(seconds: i)),
        );
        when(() => mockAppS.sec(any())).thenReturn('seconds');
        when(() => mockAppS.min(any())).thenReturn('minutes');
        when(() => mockAppS.justNow).thenReturn('Just now');

        // Act & Assert
        for (final date in dates) {
          expect(() => date.formatDateToLess(mockAppS), returnsNormally);
        }
      });
    });
  });
}
