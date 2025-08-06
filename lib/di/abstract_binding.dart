import 'package:get_it/get_it.dart';

abstract class AbstractBinding {
  const AbstractBinding();

  Future<void> binding(GetIt it);
}
