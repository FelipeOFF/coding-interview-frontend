import 'package:coding_interview_frontend/util/double_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DoubleUtil', () {
    group('toAppMoneyFractionNumberFormat', () {
      test('should return NumberFormat with correct locale', () {
        final format = DoubleUtil.toAppMoneyFractionNumberFormat;
        expect(format.locale, equals('en_US'));
      });

      test('should have exactly 2 minimum fraction digits', () {
        final format = DoubleUtil.toAppMoneyFractionNumberFormat;
        expect(format.minimumFractionDigits, equals(2));
      });

      test('should have exactly 2 maximum fraction digits', () {
        final format = DoubleUtil.toAppMoneyFractionNumberFormat;
        expect(format.maximumFractionDigits, equals(2));
      });

      test('should return same instance on multiple calls', () {
        final format1 = DoubleUtil.toAppMoneyFractionNumberFormat;
        final format2 = DoubleUtil.toAppMoneyFractionNumberFormat;
        // Note: This tests the getter behavior, not necessarily object identity
        expect(format1.locale, equals(format2.locale));
        expect(
          format1.minimumFractionDigits,
          equals(format2.minimumFractionDigits),
        );
        expect(
          format1.maximumFractionDigits,
          equals(format2.maximumFractionDigits),
        );
      });
    });
  });

  group('DoubleExt', () {
    group('toAppMoneyFraction', () {
      test('should format whole numbers with two decimal places', () {
        expect(0.0.toAppMoneyFraction, equals('0.00'));
        expect(1.0.toAppMoneyFraction, equals('1.00'));
        expect(10.0.toAppMoneyFraction, equals('10.00'));
        expect(100.0.toAppMoneyFraction, equals('100.00'));
        expect(1000.0.toAppMoneyFraction, equals('1,000.00'));
      });

      test('should format numbers with one decimal place', () {
        expect(1.5.toAppMoneyFraction, equals('1.50'));
        expect(10.9.toAppMoneyFraction, equals('10.90'));
        expect(999.1.toAppMoneyFraction, equals('999.10'));
      });

      test('should format numbers with two decimal places', () {
        expect(1.23.toAppMoneyFraction, equals('1.23'));
        expect(10.99.toAppMoneyFraction, equals('10.99'));
        expect(999.01.toAppMoneyFraction, equals('999.01'));
      });

      test('should round numbers with more than two decimal places', () {
        expect(1.234.toAppMoneyFraction, equals('1.23'));
        expect(1.235.toAppMoneyFraction, equals('1.24')); // Banker's rounding
        expect(1.999.toAppMoneyFraction, equals('2.00'));
        expect(10.006.toAppMoneyFraction, equals('10.01'));
      });

      test('should handle negative numbers', () {
        expect((-1.0).toAppMoneyFraction, equals('-1.00'));
        expect((-1.23).toAppMoneyFraction, equals('-1.23'));
        expect((-1000.99).toAppMoneyFraction, equals('-1,000.99'));
        expect((-0.01).toAppMoneyFraction, equals('-0.01'));
      });

      test('should handle very small positive numbers', () {
        expect(0.01.toAppMoneyFraction, equals('0.01'));
        expect(0.001.toAppMoneyFraction, equals('0.00'));
        expect(0.005.toAppMoneyFraction, equals('0.01'));
      });

      test('should handle very small negative numbers', () {
        expect((-0.01).toAppMoneyFraction, equals('-0.01'));
        expect((-0.001).toAppMoneyFraction, equals('-0.00'));
        expect((-0.005).toAppMoneyFraction, equals('-0.01'));
      });

      test('should add thousand separators for large numbers', () {
        expect(1000.0.toAppMoneyFraction, equals('1,000.00'));
        expect(12345.67.toAppMoneyFraction, equals('12,345.67'));
        expect(1234567.89.toAppMoneyFraction, equals('1,234,567.89'));
        expect((-1234567.89).toAppMoneyFraction, equals('-1,234,567.89'));
      });

      test('should handle edge case numbers', () {
        expect(double.nan.toAppMoneyFraction, equals('NaN'));
        expect(double.infinity.toAppMoneyFraction, equals('∞'));
        expect(double.negativeInfinity.toAppMoneyFraction, equals('-∞'));
      });

      test('should handle very large numbers', () {
        expect(
          999999999999.99.toAppMoneyFraction,
          equals('999,999,999,999.99'),
        );
        expect(1e12.toAppMoneyFraction, equals('1,000,000,000,000.00'));
      });

      test('should handle precision edge cases', () {
        // Test numbers that might have floating-point precision issues
        expect(0.1.toAppMoneyFraction, equals('0.10'));
        expect(0.2.toAppMoneyFraction, equals('0.20'));
        expect((0.1 + 0.2).toAppMoneyFraction, equals('0.30'));
      });

      test('should handle typical money amounts', () {
        expect(19.99.toAppMoneyFraction, equals('19.99'));
        expect(99.95.toAppMoneyFraction, equals('99.95'));
        expect(1599.00.toAppMoneyFraction, equals('1,599.00'));
        expect(0.99.toAppMoneyFraction, equals('0.99'));
      });
    });
  });
}
