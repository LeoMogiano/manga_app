import 'package:flutter/material.dart';


 BoxDecoration customGradientDec() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.05, 0.5], // Puntos de parada
        colors: [
          Colors.black,
          Colors.grey[400]!,
        ],
      ),
    );
  }


  class DotsPainterBg extends StatelessWidget {
  const DotsPainterBg({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DotsPainter(),
      child: child,
    );
  }
}

class DotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[900]! // Color de los puntos
      ..style = PaintingStyle.fill;

    const double spacing = 10.0; // Espaciado entre puntos
    const double radius = 1.0; // Radio de los puntos

    // Calcula la posición vertical donde el color blanco comienza
    final double whiteStartY = size.height * 0.10; // 10% del alto total

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = whiteStartY; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}