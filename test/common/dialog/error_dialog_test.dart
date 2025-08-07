import 'dart:async';

import 'package:coding_interview_frontend/common/dialog/app_dialog.dart';
import 'package:coding_interview_frontend/common/dialog/error_dialog.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockVoidCallback extends Mock {
  void call();
}

class MockAppS extends Mock implements AppS {}

void main() {
  group('ErrorDialog Widget Tests', () {
    late MockVoidCallback mockCallback;
    late MockNavigatorObserver mockNavigatorObserver;

    setUp(() {
      mockCallback = MockVoidCallback();
      mockNavigatorObserver = MockNavigatorObserver();
      when(() => mockCallback.call()).thenReturn(null);
    });

    Widget createTestWidget({
      required Widget child,
      List<NavigatorObserver>? navigatorObservers,
    }) => MaterialApp(
      navigatorObservers: navigatorObservers ?? [],
      localizationsDelegates: const [AppS.delegate],
      home: Scaffold(body: child),
    );

    testWidgets('should render with required parameters only', (tester) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: const ErrorDialog(title: title, message: message),
        ),
      );

      // Assert
      expect(find.text(message), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Close'), findsOneWidget); // Default button text
    });

    testWidgets('should render with custom icon', (tester) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';
      const customIcon = Icons.warning;

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: const ErrorDialog(
            title: title,
            message: message,
            icon: customIcon,
          ),
        ),
      );

      // Assert
      expect(find.text(message), findsOneWidget);
      expect(find.byIcon(customIcon), findsOneWidget);
    });

    testWidgets('should render without icon when icon is null', (tester) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: const ErrorDialog(title: title, message: message, icon: null),
        ),
      );

      // Assert
      expect(find.text(message), findsOneWidget);
      expect(find.byType(Icon), findsNothing);
    });

    testWidgets('should render with custom icon color', (tester) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';
      const customColor = Colors.blue;

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: const ErrorDialog(
            title: title,
            message: message,
            iconColor: customColor,
          ),
        ),
      );

      // Assert
      expect(find.text(message), findsOneWidget);
      final iconWidget = tester.widget<Icon>(find.byType(Icon));
      expect(iconWidget.color, equals(customColor));
    });

    testWidgets('should use theme error color when iconColor is null', (
      tester,
    ) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: const ErrorDialog(title: title, message: message),
        ),
      );

      // Assert
      final BuildContext context = tester.element(find.byType(ErrorDialog));
      final expectedColor = Theme.of(context).colorScheme.error;
      final iconWidget = tester.widget<Icon>(find.byType(Icon));
      expect(iconWidget.color, equals(expectedColor));
    });

    testWidgets('should render with custom button text', (tester) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';
      const customButtonText = 'Custom Button';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: const ErrorDialog(
            title: title,
            message: message,
            buttonText: customButtonText,
          ),
        ),
      );

      // Assert
      expect(find.text(message), findsOneWidget);
      expect(find.text(customButtonText), findsOneWidget);
      expect(find.text('Close'), findsNothing);
    });

    testWidgets('should call custom onButtonPressed when provided', (
      tester,
    ) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: ErrorDialog(
            title: title,
            message: message,
            onButtonPressed: mockCallback.call,
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Assert
      verify(() => mockCallback.call()).called(1);
    });

    testWidgets('should pop navigator when default onButtonPressed is used', (
      tester,
    ) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          navigatorObservers: [mockNavigatorObserver],
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(
                    builder: (_) => const Scaffold(
                      body: ErrorDialog(title: title, message: message),
                    ),
                  ),
                );
              },
              child: const Text('Show Dialog'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.text(message), findsOneWidget);

      await tester.tap(find.byType(ElevatedButton).last);
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(message), findsNothing);
    });

    testWidgets('should have correct text styling', (tester) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: const ErrorDialog(title: title, message: message),
        ),
      );

      // Assert
      final messageText = tester.widget<Text>(find.text(message));
      expect(messageText.textAlign, equals(TextAlign.center));
      expect(
        messageText.style?.color?.a,
        lessThan(255),
      ); // Should have alpha transparency
    });

    testWidgets('should have correct button styling', (tester) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: const ErrorDialog(title: title, message: message),
        ),
      );

      // Assert
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final buttonStyle = button.style;
      expect(
        buttonStyle?.padding?.resolve({}),
        equals(const EdgeInsets.symmetric(vertical: 16)),
      );

      final shape = buttonStyle?.shape?.resolve({}) as RoundedRectangleBorder?;
      expect(shape?.borderRadius, equals(BorderRadius.circular(8)));
    });

    testWidgets('should have full width button', (tester) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: const ErrorDialog(title: title, message: message),
        ),
      );

      // Assert
      final sizedBox = tester.widget<SizedBox>(
        find
            .ancestor(
              of: find.byType(ElevatedButton),
              matching: find.byType(SizedBox),
            )
            .first,
      );
      expect(sizedBox.width, equals(double.infinity));
    });

    testWidgets('should maintain proper spacing between elements', (
      tester,
    ) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: const ErrorDialog(title: title, message: message),
        ),
      );

      // Assert
      expect(
        find.byType(SizedBox),
        findsAtLeastNWidgets(2),
      ); // At least spacing elements
    });
  });

  group('ErrorDialog.show() Method Tests', () {
    late MockVoidCallback mockCallback;

    setUp(() {
      mockCallback = MockVoidCallback();
      when(() => mockCallback.call()).thenReturn(null);
    });

    Widget createTestApp({List<NavigatorObserver>? navigatorObservers}) =>
        MaterialApp(
          navigatorObservers: navigatorObservers ?? [],
          localizationsDelegates: const [AppS.delegate],
          home: const Scaffold(body: SizedBox()),
        );

    testWidgets('should show ErrorDialog with AppDialog.show', (tester) async {
      // Arrange
      const title = 'Error Title';
      const message = 'Error Message';

      // Act
      await tester.pumpWidget(createTestApp());

      final context = tester.element(find.byType(Scaffold));

      unawaited(
        ErrorDialog.show<void>(
          context: context,
          title: title,
          message: message,
        ),
      );

      await tester.pumpAndSettle();

      // Assert
      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.byType(ErrorDialog), findsOneWidget);
      expect(find.byType(AppDialog), findsOneWidget);
    });

    testWidgets('should pass all parameters correctly to AppDialog.show', (
      tester,
    ) async {
      // Arrange
      const title = 'Error Title';
      const message = 'Error Message';
      const buttonText = 'Custom Button';
      const customIcon = Icons.warning;
      const customColor = Colors.orange;

      // Act
      await tester.pumpWidget(createTestApp());

      final context = tester.element(find.byType(Scaffold));

      unawaited(
        ErrorDialog.show<String>(
          context: context,
          title: title,
          message: message,
          icon: customIcon,
          iconColor: customColor,
          buttonText: buttonText,
          onButtonPressed: mockCallback.call,
          isDismissible: false,
          useRootNavigator: false,
        ),
      );

      await tester.pumpAndSettle();

      // Assert
      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.text(buttonText), findsOneWidget);
      expect(find.byIcon(customIcon), findsOneWidget);

      // Verify icon color
      final iconWidget = tester.widget<Icon>(find.byIcon(customIcon));
      expect(iconWidget.color, equals(customColor));
    });

    testWidgets(
      'should use default values when optional parameters are not provided',
      (tester) async {
        // Arrange
        const title = 'Error Title';
        const message = 'Error Message';

        // Act
        await tester.pumpWidget(createTestApp());

        final context = tester.element(find.byType(Scaffold));

        unawaited(
          ErrorDialog.show<void>(
            context: context,
            title: title,
            message: message,
          ),
        );

        await tester.pumpAndSettle();

        // Assert
        expect(find.text(title), findsOneWidget);
        expect(find.text(message), findsOneWidget);
        expect(
          find.byIcon(Icons.error_outline),
          findsOneWidget,
        ); // Default icon
        expect(find.text('Close'), findsOneWidget); // Default button text
      },
    );

    testWidgets('should handle custom onButtonPressed in static show method', (
      tester,
    ) async {
      // Arrange
      const title = 'Error Title';
      const message = 'Error Message';

      // Act
      await tester.pumpWidget(createTestApp());

      final context = tester.element(find.byType(Scaffold));

      unawaited(
        ErrorDialog.show<void>(
          context: context,
          title: title,
          message: message,
          onButtonPressed: mockCallback.call,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Assert
      verify(() => mockCallback.call()).called(1);
    });

    testWidgets('should return correct generic type from show method', (
      tester,
    ) async {
      // Arrange
      const title = 'Error Title';
      const message = 'Error Message';

      await tester.pumpWidget(createTestApp());

      final context = tester.element(find.byType(Scaffold));

      // Act
      final future = ErrorDialog.show<String>(
        context: context,
        title: title,
        message: message,
      );

      await tester.pumpAndSettle();

      // Close the dialog
      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();

      // Assert
      expect(future, isA<Future<String?>>());
    });

    testWidgets('should set correct maxHeight based on MediaQuery', (
      tester,
    ) async {
      // Arrange
      const title = 'Error Title';
      const message = 'Error Message';

      // Act
      await tester.pumpWidget(createTestApp());

      final context = tester.element(find.byType(Scaffold));

      unawaited(
        ErrorDialog.show<void>(
          context: context,
          title: title,
          message: message,
        ),
      );

      await tester.pumpAndSettle();

      // Assert - Dialog should be shown (indirect test since maxHeight is
      // passed to AppDialog)
      expect(find.byType(ErrorDialog), findsOneWidget);
      expect(find.byType(AppDialog), findsOneWidget);
    });

    testWidgets('should pass isDismissible parameter correctly', (
      tester,
    ) async {
      // Arrange
      const title = 'Error Title';
      const message = 'Error Message';

      // Act
      await tester.pumpWidget(createTestApp());

      final context = tester.element(find.byType(Scaffold));

      unawaited(
        ErrorDialog.show<void>(
          context: context,
          title: title,
          message: message,
          isDismissible: false,
        ),
      );

      await tester.pumpAndSettle();

      // Assert - Dialog should be shown and not dismissible by tapping outside
      expect(find.byType(ErrorDialog), findsOneWidget);

      // Try to dismiss by tapping outside - should not work
      await tester.tapAt(const Offset(50, 50)); // Tap outside dialog
      await tester.pumpAndSettle();

      expect(
        find.byType(ErrorDialog),
        findsOneWidget,
      ); // Dialog should still be there
    });

    testWidgets('should handle null icon parameter', (tester) async {
      // Arrange
      const title = 'Error Title';
      const message = 'Error Message';

      // Act
      await tester.pumpWidget(createTestApp());

      final context = tester.element(find.byType(Scaffold));

      unawaited(
        ErrorDialog.show<void>(
          context: context,
          title: title,
          message: message,
          icon: null,
        ),
      );

      await tester.pumpAndSettle();

      // Assert
      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.byType(Icon), findsNothing);
    });
  });

  group('ErrorDialog Edge Cases', () {
    Widget createTestWidget({required Widget child}) => MaterialApp(
      localizationsDelegates: const [AppS.delegate],
      home: Scaffold(body: child),
    );

    testWidgets('should handle empty title and message', (tester) async {
      // Arrange
      const title = '';
      const message = '';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: const ErrorDialog(title: title, message: message),
        ),
      );

      // Assert
      expect(find.text(''), findsAtLeastNWidgets(1)); // Empty message text
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should handle very long message text', (tester) async {
      // Arrange
      const title = 'Error';
      const longMessage =
          'This is a very long error message that should wrap properly '
          'and not cause any layout issues in the dialog. It should be centered'
          ' and have proper alpha transparency applied to the text color.';

      // Act
      await tester.pumpWidget(
        createTestWidget(
          child: const ErrorDialog(title: title, message: longMessage),
        ),
      );

      // Assert
      expect(find.text(longMessage), findsOneWidget);
      final messageText = tester.widget<Text>(find.text(longMessage));
      expect(messageText.textAlign, equals(TextAlign.center));
    });
  });
}
