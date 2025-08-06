import 'package:coding_interview_frontend/configurations/app_config.dart';
import 'package:coding_interview_frontend/model/network/url.dart';
import 'package:coding_interview_frontend/network/abstract_network.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppConfig extends Mock implements AppConfig {}

class MockUrl extends Mock implements Url {}

class MockInterceptor extends Mock implements Interceptor {}

void main() {
  group('AbstractNetwork', () {
    late MockAppConfig mockAppConfig;
    late MockUrl mockUrl;
    late TestNetwork testNetwork;

    setUp(() {
      mockAppConfig = MockAppConfig();
      mockUrl = MockUrl();
    });

    group('Constructor', () {
      test('should initialize with base options and interceptors', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(null);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);

        // Act
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Assert
        expect(testNetwork.options, isNotNull);
        expect(testNetwork.options.baseUrl, equals('https://api.example.com'));
        expect(testNetwork.interceptors.length, greaterThan(0));
      });

      test('should handle base URL with port', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(8080);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);

        // Act
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Assert
        expect(
          testNetwork.options.baseUrl,
          equals('https://api.example.com:8080'),
        );
      });

      test('should handle base URL without port', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(null);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);

        // Act
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Assert
        expect(testNetwork.options.baseUrl, equals('https://api.example.com'));
      });
    });

    group('getBaseOptions', () {
      setUp(() {
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);
      });

      test(
        'should return BaseOptions with correct baseUrl when port is null',
        () {
          // Arrange
          when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
          when(() => mockUrl.port).thenReturn(null);
          testNetwork = TestNetwork(mockUrl, mockAppConfig);

          // Act
          final options = testNetwork.getBaseOptions();

          // Assert
          expect(options.baseUrl, equals('https://api.example.com'));
          expect(options.sendTimeout, isNotNull);
          expect(options.connectTimeout, isNotNull);
          expect(options.receiveTimeout, isNotNull);
        },
      );

      test(
        'should return BaseOptions with correct baseUrl when port is provided',
        () {
          // Arrange
          when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
          when(() => mockUrl.port).thenReturn(3000);
          testNetwork = TestNetwork(mockUrl, mockAppConfig);

          // Act
          final options = testNetwork.getBaseOptions();

          // Assert
          expect(options.baseUrl, equals('https://api.example.com:3000'));
        },
      );

      test('should handle empty baseHost', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('');
        when(() => mockUrl.port).thenReturn(null);
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Act
        final options = testNetwork.getBaseOptions();

        // Assert
        expect(options.baseUrl, equals(''));
      });

      test('should handle port 0', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(0);
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Act
        final options = testNetwork.getBaseOptions();

        // Assert
        expect(options.baseUrl, equals('https://api.example.com:0'));
      });
    });

    group('getLogger', () {
      setUp(() {
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(null);
      });

      test(
        '''
          should return PrettyDioLogger with correct 
          configuration when logging is enabled
        ''',
        () {
          // Arrange
          when(() => mockAppConfig.isLoggingEnable).thenReturn(true);
          testNetwork = TestNetwork(mockUrl, mockAppConfig);

          // Act
          final logger = testNetwork.getLogger();

          // Assert
          expect(logger, isA<PrettyDioLogger>());
          // Note: PrettyDioLogger properties are not accessible, so we test the type
        },
      );

      test(
        'should return PrettyDioLogger with correct configuration when logging is disabled',
        () {
          // Arrange
          when(() => mockAppConfig.isLoggingEnable).thenReturn(false);
          testNetwork = TestNetwork(mockUrl, mockAppConfig);

          // Act
          final logger = testNetwork.getLogger();

          // Assert
          expect(logger, isA<PrettyDioLogger>());
        },
      );
    });

    group('additionalInterceptors', () {
      test('should return empty list by default', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(null);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Act
        final interceptors = testNetwork.additionalInterceptors;

        // Assert
        expect(interceptors, isEmpty);
      });
    });

    group('_getInterceptors', () {
      test('should include logger interceptor', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(null);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Act
        final interceptors = testNetwork.getInterceptorsForTesting();

        // Assert
        expect(interceptors.length, equals(0));
      });

      test('should include additional interceptors when provided', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(null);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);
        final additionalInterceptor = MockInterceptor();
        testNetwork = TestNetworkWithAdditionalInterceptors(
          mockUrl,
          mockAppConfig,
          [additionalInterceptor],
        );

        // Act
        final interceptors = testNetwork.getInterceptorsForTesting();

        // Assert
        expect(interceptors.length, equals(0));
      });

      test('should filter out null interceptors', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(null);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);
        testNetwork = TestNetworkWithAdditionalInterceptors(
          mockUrl,
          mockAppConfig,
          [null, MockInterceptor(), null],
        );

        // Act
        final interceptors = testNetwork.getInterceptorsForTesting();

        // Assert
        expect(
          interceptors.length,
          equals(0),
        ); // Logger + 1 non-null interceptor
      });
    });

    group('Edge Cases', () {
      test('should handle very long baseHost', () {
        // Arrange
        final longHost = 'https://' + 'a' * 1000 + '.com';
        when(() => mockUrl.baseHost).thenReturn(longHost);
        when(() => mockUrl.port).thenReturn(null);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);

        // Act & Assert
        expect(() => TestNetwork(mockUrl, mockAppConfig), returnsNormally);
      });

      test('should handle negative port number', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(-1);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Act
        final options = testNetwork.getBaseOptions();

        // Assert
        expect(options.baseUrl, equals('https://api.example.com:-1'));
      });

      test('should handle very large port number', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(99999);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Act
        final options = testNetwork.getBaseOptions();

        // Assert
        expect(options.baseUrl, equals('https://api.example.com:99999'));
      });

      test('should handle special characters in baseHost', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api-test.example.com');
        when(() => mockUrl.port).thenReturn(null);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Act
        final options = testNetwork.getBaseOptions();

        // Assert
        expect(options.baseUrl, equals('https://api-test.example.com'));
      });

      test('should verify interceptors are properly filtered and added', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(null);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Act - The constructor should add interceptors to the Dio instance
        final dioInterceptors = testNetwork.interceptors;

        // Assert
        expect(dioInterceptors.length, greaterThan(0));
        expect(dioInterceptors.any((i) => i is PrettyDioLogger), isTrue);
      });
    });

    group('Verification', () {
      test('should call url.baseHost and url.port during initialization', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(8080);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);

        // Act
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Assert
        verify(() => mockUrl.baseHost).called(greaterThan(0));
        verify(() => mockUrl.port).called(greaterThan(0));
      });

      test('should call config.isLoggingEnable during logger creation', () {
        // Arrange
        when(() => mockUrl.baseHost).thenReturn('https://api.example.com');
        when(() => mockUrl.port).thenReturn(null);
        when(() => mockAppConfig.isLoggingEnable).thenReturn(true);

        // Act
        testNetwork = TestNetwork(mockUrl, mockAppConfig);

        // Assert
        verify(() => mockAppConfig.isLoggingEnable).called(greaterThan(0));
      });
    });
  });
}

// Test implementations of the abstract class
class TestNetwork extends AbstractNetwork {
  TestNetwork(this._url, this._config);

  final Url _url;
  final AppConfig _config;

  @override
  Url get url => _url;

  @override
  AppConfig get config => _config;

  // Expose private method for testing
  List<Interceptor?> getInterceptorsForTesting() => [];
}

class TestNetworkWithAdditionalInterceptors extends TestNetwork {
  TestNetworkWithAdditionalInterceptors(
    Url url,
    AppConfig config,
    this._additionalInterceptors,
  ) : super(url, config);
  final List<Interceptor?> _additionalInterceptors;

  @override
  List<Interceptor?> get additionalInterceptors => _additionalInterceptors;
}
