import 'package:flutter/material.dart';
import 'dart:math' as math;

class AppCustomPaint extends StatelessWidget {
  AppCustomPaint({
    this.child,
    this.radius,
    this.radians,
  });
  final double radius;
  final double radians;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ClipRect(
      child: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: CustomPaint(
          painter: ShapePainter(250, 0),
          child: Container(
            child: child,
          ),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final double radius;
  final double radians;
  ShapePainter(this.radius, this.radians);

  @override
  void paint(Canvas canvas, Size size) {
    /// Main Lines

    /// paint brush
    var paint1 = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    /// path to follow
    var path1 = Path();
    var angle = (math.pi);

    /// Get center of screen
    Offset center = Offset(size.width * 1 / 2, size.height * 1 / 3);

    /// move paint brush to center
    path1.moveTo(center.dx, center.dy);

    /// get endpoint (x, y) to paint from center using angle. The  radius will be the line to paint

    /// center to top left
    double x = (radius) * math.cos(radians + angle * -1 / 4) + center.dx;
    double y = (radius) * math.sin(radians + angle * -1 / 4) + center.dy;
    path1.lineTo(x, y);

    /// center to right down
    path1.moveTo(center.dx, center.dy);
    x = (radius) * math.cos(radians + angle * 1 / 4) + center.dx;
    y = (radius) * math.sin(radians + angle * 1 / 4) + center.dy;
    path1.lineTo(x, y);

    /// center to left down
    path1.moveTo(center.dx, center.dy);
    x = (radius) * math.cos(radians + angle * 3 / 4) + center.dx;
    y = (radius) * math.sin(radians + angle * 3 / 4) + center.dy;
    path1.lineTo(x, y);

    /// left to bottom center
    path1.moveTo(x, y);
    path1.lineTo(
        center.dx,
        center.dy +
            radius *
                math.sqrt(
                    2)); // square diagonal = side (this case radius) * sqrt(2)

    /// close path and actually draw
    path1.close();
    canvas.drawPath(path1, paint1);

    /// ________________DRAW SQUARE FUNCTION________________
    /// To draw rotated squares
    drawSquare(
        {double circleRadius,
        Offset center2,
        int circleRadians = 0,
        PaintingStyle brushStyle = PaintingStyle.stroke,
        Color colour = Colors.white}) {
      /// The center handles where the square is drawn.
      /// The half of the width of the corresponding text container is the circleRadius

      double x;
      double y;
      var paint2 = Paint()
        ..color = colour
        ..strokeWidth = 1
        ..style = brushStyle
        ..strokeCap = StrokeCap.round;

      /// path to follow
      var path2 = Path();
      var angle2 = (math.pi);

      /// move to center
      x = (circleRadius) * math.cos(circleRadians + 0) + center2.dx;
      y = (circleRadius) * math.sin(circleRadians + 0) + center2.dy;
      path2.moveTo(x, y);

      /// repeat with different angle
      x = (circleRadius) * math.cos(circleRadians + angle2 * 2 / 4) +
          center2.dx;
      y = (circleRadius) * math.sin(circleRadians + angle2 * 2 / 4) +
          center2.dy;
      path2.lineTo(x, y);

      /// repeat with different angle
      x = (circleRadius) * math.cos(circleRadians + angle2 * 4 / 4) +
          center2.dx;
      y = (circleRadius) * math.sin(circleRadians + angle2 * 4 / 4) +
          center2.dy;
      path2.lineTo(x, y);

      /// repeat with different angle
      x = (circleRadius) * math.cos(circleRadians + angle2 * 6 / 4) +
          center2.dx;
      y = (circleRadius) * math.sin(circleRadians + angle2 * 6 / 4) +
          center2.dy;
      path2.lineTo(x, y);

      /// close path and actually draw
      path2.close();
      canvas.drawPath(path2, paint2);
    }

    /// --------------------------------------------------------------------
    ///                   Rotated Squares
    ///
    /// draw square for 'Chess' text
    drawSquare(
        circleRadius: 75,
        center2: Offset((size.width * 1 / 2) - 75, size.height * 1 / 3));

    /// draw square for 'by' text
    drawSquare(
        circleRadius: 25,
        center2: Offset((size.width * 1 / 2), size.height * 1 / 3 - 25));

    /// draw square for 'iando' text
    drawSquare(
        circleRadius: 37.5,
        center2: Offset((size.width * 1 / 2 + 37.5), size.height * 1 / 3));

    /// draw square for 'Prophet' text
    drawSquare(
        circleRadius: 100,
        center2: Offset((size.width * 1 / 2), size.height * 1 / 3 + 100));

    Offset referenceBottomBoard =
        Offset(size.width * 1 / 2 - 150, center.dy + 250 * math.sqrt(2));

    double locationX = referenceBottomBoard.dx;
    double locationY = referenceBottomBoard.dy;

    for (int i = 0; i < 3; i++) {
      if (i == 1) continue;
      drawSquare(
          circleRadius: 50,
          center2: Offset(locationX + 100 + i * 100, locationY - 100),
          brushStyle: PaintingStyle.fill);
    }

    for (int i = -2; i < 2; i++) {
      drawSquare(
          circleRadius: 50,
          center2: Offset(locationX + 150 + i * 100, locationY - 50));
    }

    for (int i = 0; i < 4; i++) {
      drawSquare(
          circleRadius: 50,
          center2: Offset(locationX + i * 100, locationY),
          brushStyle: PaintingStyle.fill);
    }

    for (int i = 0; i < 3; i++) {
      drawSquare(
          circleRadius: 50,
          center2: Offset(locationX + 50 + i * 100, locationY + 50));
    }

    for (int i = -1; i < 2; i++) {
      if (i == 1) continue;
      drawSquare(
          circleRadius: 50,
          center2: Offset(locationX + 100 + i * 100, locationY + 100),
          brushStyle: PaintingStyle.fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
