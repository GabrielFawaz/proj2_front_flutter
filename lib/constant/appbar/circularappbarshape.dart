import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularAppBarShape extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.right, rect.top);
    path.lineTo(rect.right, rect.bottom + 10); // Adjust curvature depth
    path.quadraticBezierTo(rect.width / 2, rect.bottom + 40, rect.left, rect.bottom + 30); // Adjust curvature shape
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    super.paint(canvas, rect, textDirection: textDirection);

    // Apply background color to the app bar
    final Paint paint = Paint()..color = Colors.white60;
    canvas.drawPath(getOuterPath(rect, textDirection: textDirection)!, paint);
  }
}