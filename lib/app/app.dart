import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:coding_interview_frontend/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
    localizationsDelegates: const [
      AppS.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppS.delegate.supportedLocales,
    routerConfig: AppNavigation.instance.route,
  );
}
