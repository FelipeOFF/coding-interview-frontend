# 🚀 Welcome to coding-interview-frontend

This project is a Flutter application developed as part of a technical interview process for El Dorado. The application demonstrates mobile development best practices using Clean Architecture and unit testing.

---

## ✨ Features

- 🏗️ **Clean Architecture**: Organized layer structure for better maintainability
- 🧪 **Unit Testing**: Test coverage to ensure code quality
- 📱 **Responsive Interface**: Adaptive design for different screen sizes
- 🔄 **State Management**: Efficient state management implementation
- 🌐 **API Integration**: Communication with web services
- 🌍 **Internationalization**: Multi-language support with localized content
- ⚡ **Functional Programming**: Enhanced error handling with functional programming patterns
- 📊 **Cryptocurrency & Fiat Currency Support**: Support for various currencies including USDT and multiple fiat currencies

## 📋 Project Versions

- 🎯 **Flutter**: 3.32.8
- 🎨 **Dart**: 3.8.1
- ☕ **Java**: 18.0.2
- 🍎 **Pod**: 1.14.3
- ⚡ **FlutterGen**: 5.11.0

## 📚 Libraries Used

### Core Dependencies
- 🎨 **[fluttergen](https://pub.dev/packages/flutter_gen)**: Automatic code generator for quick access to project assets (images, fonts, colors, etc.)
- 💉 **[get_it](https://pub.dev/packages/get_it)**: Simple and powerful dependency injection container for Flutter/Dart, enabling efficient dependency management
- 🌐 **[dio](https://pub.dev/packages/dio)**: Robust HTTP client for Dart with support for interceptors, request/response transformation, timeout, and much more
- 📄 **[json_annotation](https://pub.dev/packages/json_annotation)**: Annotations for automatic generation of JSON serialization/deserialization code
- ❄️ **[freezed_annotation](https://pub.dev/packages/freezed_annotation)**: Annotations for generating immutable classes with copyWith, toString, equality and pattern matching
- 🌐 **[flutter_pretty_dio_logger](https://pub.dev/packages/flutter_pretty_dio_logger)**: Logger for Dio HTTP requests with beautiful formatting
- 📝 **[logger](https://pub.dev/packages/logger)**: Powerful logging utility for application debugging and monitoring

### Functional Programming & Utilities
- ⚡ **[fpdart](https://pub.dev/packages/fpdart)**: Functional programming in Dart with monads, functors, and algebraic data types for better error handling
- ⚖️ **[equatable](https://pub.dev/packages/equatable)**: Simplifies equality comparisons by overriding == and hashCode automatically
- 🌍 **[intl](https://pub.dev/packages/intl)**: Internationalization and localization support for date formatting, number formatting, and message translation

### Development Dependencies
- 🔧 **[build_runner](https://pub.dev/packages/build_runner)**: Code generation tool that works with various generators
- ❄️ **[freezed](https://pub.dev/packages/freezed)**: Code generator for unions/sealed classes and immutable classes
- 🔄 **[json_serializable](https://pub.dev/packages/json_serializable)**: Automatically generate JSON serialization code

## 🎨 Assets & Resources

The project includes various visual assets organized by category:
- 📱 **Screen Assets**: Application screenshots and UI mockups
- 💰 **Fiat Currencies**: Flag icons for BRL, COP, PEN, and VES currencies
- 🪙 **Cryptocurrency**: TRON USDT token icon for crypto transactions

## 🌍 Internationalization

The application supports multiple languages with:
- **Main Locale**: English (en)
- **Localization Files**: Located in `lib/res/l10n`
- **Generated Class**: `AppS` for easy access to localized strings
- **Flutter Intl**: Integrated for streamlined translation management

## 🚀 How to Run

1. **Clone the repository**
   ```bash
   git clone https://github.com/FelipeOFF/coding-interview-frontend.git
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (if needed)**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

## 🧪 Run Tests

```bash
flutter test
```

## 🏗️ Architecture

This project follows Clean Architecture principles with:
- **Separation of Concerns**: Clear boundaries between layers
- **Dependency Injection**: Using GetIt for efficient dependency management
- **Functional Error Handling**: Using fpdart for robust error management
- **Code Generation**: Automated serialization and immutable class generation
- **Comprehensive Logging**: Detailed logging for debugging and monitoring