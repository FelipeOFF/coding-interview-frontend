import 'package:coding_interview_frontend/gen/assets.gen.dart';
import 'package:coding_interview_frontend/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future<void>.delayed(const Duration(seconds: 2));

      if (mounted) {
        GoRouter.of(context).go(AppRouter.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Assets.elDoradoLogo.image()));
}
