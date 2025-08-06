class Environment {
  const Environment._();

  /// The build type between local or prod
  static const String buildType = String.fromEnvironment('APP_BUILD_TYPE');
}
