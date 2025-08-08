import 'package:coding_interview_frontend/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static final AppNavigation _instance = AppNavigation._();

  static AppNavigation get instance => _instance;

  final GlobalKey<NavigatorState> root = GlobalKey<NavigatorState>();

  GoRouter get route => GoRouter(
    navigatorKey: root,
    routes: [
      GoRoute(
        path: AppRouter.initialRouter,
        builder: (context, state) => const SplashPage(),
      ),
    ],
  );
}

class AppRouter {
  const AppRouter._();

  static const String initialRouter = '/';
}
