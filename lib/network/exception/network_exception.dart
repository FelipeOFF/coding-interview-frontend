class NetworkException implements Exception {
  const NetworkException(this.message, [this.cause]);

  final String message;
  final Object? cause;

  @override
  String toString() {
    if (cause != null) {
      return 'NetworkException: $message\nCause: $cause';
    }
    return 'NetworkException: $message';
  }
}
