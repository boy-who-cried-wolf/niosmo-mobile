import 'package:flutter/material.dart';
import 'dart:math' as math;

class BackgroundPattern extends StatelessWidget {
  final Widget child;

  const BackgroundPattern({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background grid pattern
        Positioned.fill(
          child: CustomPaint(
            painter: GridPatternPainter(),
          ),
        ),
        // Wave pattern
        Positioned.fill(
          child: CustomPaint(
            painter: WavePatternPainter(),
          ),
        ),
        // Content
        child,
      ],
    );
  }
}

class GridPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    const spacing = 20.0;
    
    // Draw vertical lines
    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        paint,
      );
    }
    
    // Draw horizontal lines
    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WavePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF9EFF00).withOpacity(0.1)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();
    var x = 0.0;
    path.moveTo(x, size.height / 2);

    while (x < size.width) {
      x += 10;
      path.lineTo(
        x,
        size.height / 2 + math.sin(x / 30) * 50,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} 