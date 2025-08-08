import 'package:coding_interview_frontend/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Assets.elDoradoLogo.image()));
}
