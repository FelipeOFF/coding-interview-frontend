import 'package:coding_interview_frontend/common/dialog/error_dialog.dart';
import 'package:coding_interview_frontend/common/message/dialog_ext.dart';
import 'package:coding_interview_frontend/common/message/generic_message.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppS extends Mock implements AppS {}

class MockOnEventFunction extends Mock {
  // ignore: avoid_annotating_with_dynamic
  Future<void> call(dynamic value);
}

void main() {
  group('GenericMessageExt.showMessage<void>', () {
    late MockAppS mockAppS;
    late MockOnEventFunction mockOnEvent;

    setUp(() {
      mockAppS = MockAppS();
      mockOnEvent = MockOnEventFunction();

      // Set up default mocks
      when(() => mockAppS.nothing).thenReturn('Nothing');
      when(() => mockOnEvent.call(any<dynamic>())).thenAnswer((_) async {});
    });

    Widget createTestWidget({required Widget child}) => MaterialApp(
      localizationsDelegates: const [AppS.delegate],
      home: Scaffold(body: child),
    );

    testWidgets('should show ErrorDialog when message is not EmptyMessage', (
      tester,
    ) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';
      final genericMessage = GenericMessage(
        title: title,
        message: message,
        onEvent: mockOnEvent.call,
      );

      await tester.pumpWidget(
        createTestWidget(
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                await genericMessage.showMessage<void>(context);
              },
              child: const Text('Show Message'),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Show Message'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.byType(ErrorDialog), findsOneWidget);
    });

    testWidgets('should not show ErrorDialog when message is EmptyMessage', (
      tester,
    ) async {
      // Arrange
      final emptyMessage = EmptyMessage()..onEvent = mockOnEvent.call;

      await tester.pumpWidget(
        createTestWidget(
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                await emptyMessage.showMessage<void>(context);
              },
              child: const Text('Show Message'),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Show Message'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(ErrorDialog), findsNothing);
      verify(() => mockOnEvent.call(null)).called(1);
    });

    testWidgets('should use fallback text when title is null', (tester) async {
      // Arrange
      const message = 'Test Message';
      final genericMessage = GenericMessage(
        message: message,
        onEvent: mockOnEvent.call,
      );

      await tester.pumpWidget(
        createTestWidget(
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                await genericMessage.showMessage<void>(context);
              },
              child: const Text('Show Message'),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Show Message'));
      await tester.pumpAndSettle();

      // Assert - Should show localized "Nothing" text as title
      expect(find.byType(ErrorDialog), findsOneWidget);
      expect(find.text(message), findsOneWidget);
    });

    testWidgets('should use fallback text when message is null', (
      tester,
    ) async {
      // Arrange
      const title = 'Test Title';
      final genericMessage = GenericMessage(
        title: title,
        onEvent: mockOnEvent.call,
      );

      await tester.pumpWidget(
        createTestWidget(
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                await genericMessage.showMessage<void>(context);
              },
              child: const Text('Show Message'),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Show Message'));
      await tester.pumpAndSettle();

      // Assert - Should show localized "Nothing" text as message
      expect(find.byType(ErrorDialog), findsOneWidget);
      expect(find.text(title), findsOneWidget);
    });

    testWidgets(
      'should call onEvent with result when dialog returns non-null result',
      (tester) async {
        // Arrange
        final genericMessage = GenericMessage(
          title: 'Teste',
          message: 'Message',
          onEvent: mockOnEvent.call,
        );

        await tester.pumpWidget(
          createTestWidget(
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  await genericMessage.showMessage<dynamic>(context);
                },
                child: const Text('Show Message'),
              ),
            ),
          ),
        );

        // Act
        await tester.tap(find.text('Show Message'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Close'));
        await tester.pumpAndSettle();

        // Assert
        verify(() => mockOnEvent.call(any<dynamic>())).called(1);
      },
    );

    testWidgets('should not call onEvent when onEvent is null', (tester) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';
      final genericMessage = GenericMessage(title: title, message: message);

      await tester.pumpWidget(
        createTestWidget(
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                await genericMessage.showMessage<void>(context);
              },
              child: const Text('Show Message'),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Show Message'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();

      // Assert - No exception should be thrown when onEvent is null
      expect(find.byType(ErrorDialog), findsNothing);
    });

    testWidgets('should handle generic type parameter correctly', (
      tester,
    ) async {
      // Arrange
      const title = 'Test Title';
      const message = 'Test Message';
      final genericMessage = GenericMessage(
        title: title,
        message: message,
        onEvent: mockOnEvent.call,
      );

      await tester.pumpWidget(
        createTestWidget(
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                // Test with specific type parameter
                await genericMessage.showMessage<String>(context);
              },
              child: const Text('Show Message'),
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Show Message'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(ErrorDialog), findsOneWidget);
      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
    });

    test('should handle EmptyMessage type check correctly', () {
      // Arrange
      final genericMessage = GenericMessage(title: 'Title', message: 'Message');

      // Act & Assert
      expect(genericMessage is! EmptyMessage, isTrue);
    });
  });
}
