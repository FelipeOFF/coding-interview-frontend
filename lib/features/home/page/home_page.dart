import 'package:coding_interview_frontend/common/base/base_state_page.dart';
import 'package:coding_interview_frontend/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStatePage<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        CustomPaint(
          size: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          painter: CircularBackgroundPainter(),
        ),
        Container(),
      ],
    ),
  );
}

class CircularBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFA726)
      ..style = PaintingStyle.fill;

    final backgroundPaint = Paint()
      ..color = const Color(0xFFE8F4F8)
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      backgroundPaint,
    );

    final path = Path();

    final centerX = size.width * 1.8;
    final centerY = size.height * 0.4;
    final radius = size.width * 1.3;

    path.addOval(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
    );

    final clipPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final finalPath = Path.combine(PathOperation.intersect, path, clipPath);

    canvas.drawPath(finalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
