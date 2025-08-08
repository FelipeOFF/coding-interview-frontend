import 'package:flutter/material.dart';

class CustomPaintBackground extends StatelessWidget {
  const CustomPaintBackground({super.key});

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: Size(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    ),
    painter: CircularBackgroundPainter(context: context),
  );
}

class CircularBackgroundPainter extends CustomPainter {
  CircularBackgroundPainter({required this.context, super.repaint});

  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Theme.of(context).colorScheme.primary
      ..style = PaintingStyle.fill;

    final backgroundPaint = Paint()
      ..color = Theme.of(context).scaffoldBackgroundColor
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
