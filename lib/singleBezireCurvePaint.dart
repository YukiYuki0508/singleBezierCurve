import 'dart:ui';

import 'package:flutter/material.dart';

class SingleBezierCurvePaint extends CustomPainter {
  final List coordinateX;
  final List coordinateY;
  final double yHeight;
  final Paint wavePainter;
  SingleBezierCurvePaint({
    @required this.coordinateX,
    @required this.coordinateY,
    @required this.yHeight,
  }) : wavePainter = Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5;
  List waveCoordinateList = [];

  @override
  void paint(Canvas canvas, Size size) {
    _paintWaveLine(canvas, size);
  }

  _paintWaveLine(Canvas canvas, Size size) {
    waveCoordinateList = [];
    for (var i = 0; i < coordinateX.length; i++) {
      waveCoordinateList.add([coordinateX[i], coordinateY[i]]);
    }

    Path path = Path();
    path.moveTo(0.0, yHeight / 2.0);
    waveCoordinateList.forEach((value) {
      double y = value[1];
      if (y < 0.0) {
        y = 0.0;
      } else if (y >= yHeight) {
        y = yHeight;
      } else {
        y = value[1];
      }
      return path.lineTo(value[0], y);
    });
    path.lineTo(size.width, yHeight / 2.0);
    canvas.drawPath(path, wavePainter);
  }

  @override
  bool shouldRepaint(SingleBezierCurvePaint oldDelegate) {
    return false;
  }
}
