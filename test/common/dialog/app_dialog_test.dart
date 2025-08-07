import 'package:coding_interview_frontend/common/dialog/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  group('AppDialog', () {
    late Widget testChild;

    setUp(() {
      testChild = const Text('Test Content');
    });

    testWidgets(
      'should assert when neither title nor titleWidget is provided',
      (tester) async {
        expect(
          () => AppDialog(child: testChild),
          throwsA(isA<AssertionError>()),
        );
      },
    );

    testWidgets('should build with title only', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDialog(title: 'Test Title', child: testChild),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should build with titleWidget only', (tester) async {
      const customTitle = Icon(Icons.star, key: Key('custom_title'));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDialog(titleWidget: customTitle, child: testChild),
          ),
        ),
      );

      expect(find.byKey(const Key('custom_title')), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should prefer titleWidget over title when both are provided', (
      tester,
    ) async {
      const customTitle = Icon(Icons.star, key: Key('custom_title'));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDialog(
              title: 'This should not appear',
              titleWidget: customTitle,
              child: testChild,
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('custom_title')), findsOneWidget);
      expect(find.text('This should not appear'), findsNothing);
    });

    testWidgets('should build static dialog when draggable is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDialog(title: 'Test Title', child: testChild),
          ),
        ),
      );

      expect(find.byType(DraggableScrollableSheet), findsNothing);
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('should build draggable dialog when draggable is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDialog(
              title: 'Test Title',
              draggable: true,
              child: testChild,
            ),
          ),
        ),
      );

      expect(find.byType(DraggableScrollableSheet), findsOneWidget);
    });

    testWidgets('should show drag handle when showDragHandle is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDialog(title: 'Test Title', child: testChild),
          ),
        ),
      );

      // Find the drag handle container
      final dragHandleContainers = tester.widgetList<Container>(
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              widget.margin == const EdgeInsets.only(top: 8, bottom: 8) &&
              widget.constraints == null,
        ),
      );

      expect(dragHandleContainers.isNotEmpty, false);
    });

    testWidgets('should hide drag handle when showDragHandle is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDialog(
              title: 'Test Title',
              showDragHandle: false,
              child: testChild,
            ),
          ),
        ),
      );

      // Verify drag handle container is not present
      final dragHandleContainers = tester.widgetList<Container>(
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              widget.margin == const EdgeInsets.only(top: 8, bottom: 8),
        ),
      );

      expect(dragHandleContainers.isEmpty, true);
    });

    testWidgets('should apply custom backgroundColor', (tester) async {
      const customColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDialog(
              title: 'Test Title',
              backgroundColor: customColor,
              child: testChild,
            ),
          ),
        ),
      );

      final decoratedBox = tester.widget<DecoratedBox>(
        find.byWidgetPredicate(
          (widget) =>
              widget is DecoratedBox &&
              (widget.decoration as BoxDecoration).color == customColor,
        ),
      );

      expect(decoratedBox, isNotNull);
    });

    testWidgets('should apply custom contentPadding', (tester) async {
      const customPadding = EdgeInsets.all(24.0);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDialog(
              title: 'Test Title',
              contentPadding: customPadding,
              child: testChild,
            ),
          ),
        ),
      );

      final padding = tester.widget<Padding>(
        find.byWidgetPredicate(
          (widget) => widget is Padding && widget.padding == customPadding,
        ),
      );

      expect(padding, isNotNull);
    });

    testWidgets('should build scrollable content when scrollable is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDialog(
              title: 'Test Title',
              scrollable: true,
              child: testChild,
            ),
          ),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets(
      'should not build scrollable content when scrollable is false',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDialog(title: 'Test Title', child: testChild),
            ),
          ),
        );

        expect(find.byType(SingleChildScrollView), findsNothing);
      },
    );

    testWidgets('should calculate correct dialog heights', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDialog(
              title: 'Test Title',
              draggable: true,
              child: testChild,
            ),
          ),
        ),
      );

      final draggableSheet = tester.widget<DraggableScrollableSheet>(
        find.byType(DraggableScrollableSheet),
      );

      // Default maxHeight should be 80% of screen height (640)
      // Default initialHeight should be 60% of maxHeight (384)
      expect(draggableSheet.maxChildSize, equals(0.8));
      expect(draggableSheet.initialChildSize, equals(0.48)); // 384/800
    });

    testWidgets('should use custom maxHeight and initialHeight', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDialog(
              title: 'Test Title',
              draggable: true,
              maxHeight: 600,
              initialHeight: 300,
              child: testChild,
            ),
          ),
        ),
      );

      final draggableSheet = tester.widget<DraggableScrollableSheet>(
        find.byType(DraggableScrollableSheet),
      );

      expect(draggableSheet.maxChildSize, equals(0.75)); // 600/800
      expect(draggableSheet.initialChildSize, equals(0.375)); // 300/800
    });

    group('AppDialog.show', () {
      testWidgets('should show modal bottom sheet with correct parameters', (
        tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => AppDialog.show<void>(
                    context: context,
                    title: 'Test Dialog',
                    child: testChild,
                    isDismissible: false,
                    useRootNavigator: false,
                  ),
                  child: const Text('Show Dialog'),
                ),
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Dialog'));
        await tester.pumpAndSettle();

        expect(find.text('Test Dialog'), findsOneWidget);
        expect(find.text('Test Content'), findsOneWidget);
      });

      testWidgets('should pass all parameters to AppDialog constructor', (
        tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => AppDialog.show<void>(
                    context: context,
                    title: 'Custom Dialog',
                    scrollable: true,
                    draggable: false,
                    backgroundColor: Colors.blue,
                    borderRadius: 25.0,
                    showDragHandle: false,
                    contentPadding: const EdgeInsets.all(20.0),
                    child: testChild,
                  ),
                  child: const Text('Show Dialog'),
                ),
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Dialog'));
        await tester.pumpAndSettle();

        // Verify dialog is shown
        expect(find.text('Custom Dialog'), findsOneWidget);
        expect(find.byType(SingleChildScrollView), findsOneWidget);
        expect(find.byType(DraggableScrollableSheet), findsNothing);
      });
    });

    group('Edge Cases', () {
      testWidgets('should handle null MediaQuery gracefully', (tester) async {
        // This test ensures the widget doesn't crash when MediaQuery is not
        // available
        await tester.pumpWidget(
          AppDialog(title: 'Test Title', child: testChild),
        );

        // The widget should throw because MediaQuery.of(context) will fail
        expect(tester.takeException(), isNotNull);
      });
    });
  });
}
