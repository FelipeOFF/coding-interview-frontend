import 'package:logger/logger.dart';

class PermissiveFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => true;
}

final logger = Logger(
  printer: PrettyPrinter(methodCount: 0),
  filter: PermissiveFilter(),
);
