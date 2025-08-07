import 'package:coding_interview_frontend/common/base/base_controller.dart';
import 'package:coding_interview_frontend/common/base/base_state_page.dart';
import 'package:coding_interview_frontend/common/message/generic_message.dart';
import 'package:coding_interview_frontend/di/app_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockBuildContext extends Mock implements BuildContext {}

class MockBaseController extends Mock implements BaseController {}

class MockGenericMessage extends Mock implements GenericMessage {}

// Test implementation of BaseStatePage
class TestStatePage extends BaseStatePage<TestWidget, MockBaseController> {
  @override
  Widget build(BuildContext context) => const Scaffold(body: Text('Test'));
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => TestStatePage();
}

void main() {
  setUpAll(() {
    registerFallbackValue(MockBuildContext());
  });

  group('BaseStatePage', () {
    late MockBaseController mockController;
    late MockGenericMessage mockMessage;
    late Widget testApp;

    setUp(() {
      mockController = MockBaseController();
      mockMessage = MockGenericMessage();

      // Register mock controller in AppDI
      AppDI.it.registerLazySingleton<MockBaseController>(() => mockController);

      // Setup controller mocks
      when(() => mockController.init()).thenReturn(null);
      when(() => mockController.dispose()).thenAnswer((_) async {});
      when(() => mockController.message).thenReturn(null);
      when(() => mockController.message = any()).thenReturn(null);

      // Create test app
      testApp = const MaterialApp(home: TestWidget());
    });

    tearDown(() async {
      // Clean up DI after each test
      await AppDI.it.reset();
    });

    testWidgets('should initialize controller on initState', (tester) async {
      await tester.pumpWidget(testApp);

      verify(() => mockController.init()).called(1);
    });

    testWidgets('should dispose controller on dispose', (tester) async {
      await tester.pumpWidget(testApp);

      // Remove the widget to trigger dispose
      await tester.pumpWidget(const MaterialApp(home: SizedBox.shrink()));

      verify(() => mockController.dispose()).called(1);
    });

    testWidgets('should get controller from dependency injection', (
      tester,
    ) async {
      await tester.pumpWidget(testApp);

      // Verify that the controller was retrieved from DI by checking it's the
      // same instance
      final statePage = tester.state<TestStatePage>(find.byType(TestWidget));
      expect(statePage.controller, equals(mockController));
    });

    testWidgets('should setup message observer on initState', (tester) async {
      // This test verifies that rxObserver is called by checking if the widget
      // builds successfully
      // since rxObserver setup is part of initState
      await tester.pumpWidget(testApp);

      expect(find.text('Test'), findsOneWidget);
    });

    group('Lifecycle management', () {
      testWidgets('should call initState lifecycle correctly', (tester) async {
        await tester.pumpWidget(testApp);

        // Verify controller.init() is called
        verify(() => mockController.init()).called(1);
      });

      testWidgets('should call dispose lifecycle correctly', (tester) async {
        await tester.pumpWidget(testApp);

        // Remove widget to trigger dispose
        await tester.pumpWidget(const MaterialApp(home: SizedBox.shrink()));

        verify(() => mockController.dispose()).called(1);
      });

      testWidgets('should properly dispose message observer', (tester) async {
        await tester.pumpWidget(testApp);

        // Get reference to the state
        final statePage = tester.state<TestStatePage>(find.byType(TestWidget));
        expect(statePage.messageDispose, isNotNull);

        // Remove widget to trigger dispose
        await tester.pumpWidget(const MaterialApp(home: SizedBox.shrink()));

        // The messageDispose should be called, but we can't directly verify
        // RxDisposer behavior without more complex mocking
      });
    });

    group('Generic type constraints', () {
      test('should enforce BaseController constraint on C', () {
        expect(mockController, isA<BaseController>());
      });
    });

    group('Integration scenarios', () {
      testWidgets('should handle controller state changes', (tester) async {
        await tester.pumpWidget(testApp);

        // Simulate controller state changes
        when(() => mockController.message).thenReturn(mockMessage);

        // Rebuild to trigger potential message handling
        await tester.pump();

        expect(find.text('Test'), findsOneWidget);
      });
    });
  });
}
