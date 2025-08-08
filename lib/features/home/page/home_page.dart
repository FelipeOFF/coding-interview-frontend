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
        // Custom background with circular shape
        CustomPaint(
          size: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          painter: CircularBackgroundPainter(),
        ),
        // Your content goes here
        Container(
          // Add your page content here
        ),
      ],
    ),
  );
}

class CircularBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color =
          const Color(0xFFFFA726) // Orange color similar to your image
      ..style = PaintingStyle.fill;

    final backgroundPaint = Paint()
      ..color =
          const Color(0xFFE8F4F8) // Light blue background
      ..style = PaintingStyle.fill;

    // Fill the entire canvas with light blue background
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      backgroundPaint,
    );

    final path = Path();

    // Create a large circle that extends from the right side
    // Adjust these values to match your design
    final centerX = size.width * 0.75; // Position circle more to the right
    final centerY = size.height * 0.3; // Position circle in upper portion
    final radius = size.width * 0.8; // Large radius to create the curved edge

    // Create the circular path
    path.addOval(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
    );

    // Clip to only show the part that intersects with the screen
    final clipPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Use the intersection of the circle and screen bounds
    final finalPath = Path.combine(PathOperation.intersect, path, clipPath);

    canvas.drawPath(finalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
