import 'package:coding_interview_frontend/configurations/app_config.dart';
import 'package:coding_interview_frontend/di/app_di.dart';
import 'package:coding_interview_frontend/model/network/url.dart';
import 'package:coding_interview_frontend/network/abstract_network.dart';
import 'package:coding_interview_frontend/service/client/client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockAppConfig extends Mock implements AppConfig {}

class MockUrl extends Mock implements Url {}

void main() {
  group('Client', () {
    late MockAppConfig mockAppConfig;
    late MockUrl mockUrl;

    setUp(() {
      // Initialize mocks
      mockAppConfig = MockAppConfig();
      mockUrl = MockUrl();

      // Setup required mock behaviors for AbstractNetwork initialization
      when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
      when(() => mockUrl.port).thenReturn(null);
      when(() => mockAppConfig.serverUrl).thenReturn(mockUrl);
      when(() => mockAppConfig.isLoggingEnable).thenReturn(true);

      // Register mocked AppConfig in DI before creating Client
      AppDI.it.registerLazySingleton<AppConfig>(() => mockAppConfig);
    });

    tearDown(() async {
      // Clean up DI after each test
      await AppDI.it.reset();
    });

    group('config getter', () {
      test('should return AppConfig instance from AppDI', () {
        // Arrange & Act
        final client = Client();
        final result = client.config;

        // Assert
        expect(result, equals(mockAppConfig));
        expect(result, isA<AppConfig>());
      });

      test('should return same instance on multiple calls', () {
        // Arrange
        final client = Client();

        // Act
        final result1 = client.config;
        final result2 = client.config;

        // Assert
        expect(result1, equals(result2));
        expect(identical(result1, result2), isTrue);
      });
    });

    group('url getter', () {
      test('should return serverUrl from config', () {
        // Arrange
        final client = Client();

        // Act
        final result = client.url;

        // Assert
        expect(result, equals(mockUrl));
        verify(() => mockAppConfig.serverUrl).called(greaterThan(0));
      });

      test('should call config.serverUrl each time url is accessed', () {
        // Arrange
        final client = Client();

        // Reset interaction count after initialization
        clearInteractions(mockAppConfig);

        // Act
        final result1 = client.url;
        final result2 = client.url;

        // Assert
        expect(result1, equals(mockUrl));
        expect(result2, equals(mockUrl));
        verify(() => mockAppConfig.serverUrl).called(2);
      });

      test('should handle different serverUrl values', () {
        when(() => mockAppConfig.serverUrl).thenReturn(mockUrl);

        final client = Client();
        clearInteractions(mockAppConfig);

        // Act
        final firstUrl = client.url;

        // Assert
        expect(firstUrl, equals(mockUrl));
        verify(() => mockAppConfig.serverUrl).called(1);
      });
    });

    group('inheritance and initialization', () {
      test('should extend AbstractNetwork and initialize properly', () {
        // Act
        final client = Client();

        // Assert
        expect(client, isA<AbstractNetwork>());
        verify(() => mockUrl.baseHost).called(greaterThan(0));
        verify(() => mockAppConfig.isLoggingEnable).called(greaterThan(0));
      });

      test('should initialize with correct base options', () {
        // Act
        final client = Client();

        // Assert
        expect(client.options.baseUrl, contains('https://api.example.com'));
        verify(() => mockUrl.baseHost).called(greaterThan(0));
      });

      test('should handle URL with port during initialization', () {
        // Arrange
        when(() => mockUrl.port).thenReturn(8443);
        final client = Client();

        // Assert
        expect(client.options.baseUrl, contains(':8443'));
      });

      test('should handle URL without port during initialization', () {
        // Arrange
        when(() => mockUrl.port).thenReturn(null);
        final client = Client();

        // Assert
        expect(client.options.baseUrl, isNot(contains(':8080')));
      });
    });

    group('logging configuration', () {
      test('should initialize with logging enabled', () {
        // Arrange
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);

        // Act
        final client = Client();

        // Assert
        expect(client.interceptors.isNotEmpty, isTrue);
        verify(() => mockAppConfig.isLoggingEnable).called(greaterThan(0));
      });

      test('should initialize with logging disabled', () {
        // Arrange
        when(() => mockAppConfig.isLoggingEnable).thenReturn(false);

        // Act
        final client = Client();

        // Assert
        expect(client.interceptors.isNotEmpty, isTrue); // Logger is still added
        verify(() => mockAppConfig.isLoggingEnable).called(greaterThan(0));
      });
    });

    group('edge cases', () {
      test('should handle missing AppConfig in DI', () async {
        // Arrange
        await AppDI.it.reset(); // Remove registered AppConfig

        // Act & Assert
        expect(Client.new, throwsA(isA<Error>()));
      });

      test('should handle multiple client instances with same config', () {
        // Act
        final client1 = Client();
        final client2 = Client();

        // Assert
        expect(client1.config, equals(client2.config));
        expect(client1.url, equals(client2.url));
        expect(client1.options.baseUrl, equals(client2.options.baseUrl));
      });

      test('should handle complex URL configurations', () {
        // Arrange
        when(
          () => mockUrl.baseHost,
        ).thenReturn('https://secure-api.example.com');
        when(() => mockUrl.port).thenReturn(9443);

        // Act
        final client = Client();

        // Assert
        expect(
          client.options.baseUrl,
          equals('https://secure-api.example.com:9443'),
        );
      });
    });

    group('configuration integration', () {
      test('should work with realistic configuration', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://prod-api.company.com');
        when(() => mockUrl.port).thenReturn(null);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(false);

        // Act
        final client = Client();
        final config = client.config;
        final url = client.url;

        // Assert
        expect(config, isNotNull);
        expect(url, isNotNull);
        expect(client.options.baseUrl, equals('https://prod-api.company.com'));
        expect(config.isLoggingEnable, isFalse);
      });
    });
  });
}
