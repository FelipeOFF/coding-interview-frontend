import 'package:coding_interview_frontend/app/app.dart';
import 'package:coding_interview_frontend/di/app_di.dart';
import 'package:flutter/material.dart';

void main() async {
  // Start DI
  await AppDI.setupDI();

  runApp(const App());
}
