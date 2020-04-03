import 'package:flutter/material.dart';
import 'package:bezier/singleBezireCurvePaint.dart';

class SingleBezierCurve extends StatelessWidget {
  final double _addControllerX1_1 = 0.0;
  final double _addControllerY1_1 = 350.0 / 2.0;
  final double _addControllerX2_1 = 50.0;
  final double _addControllerY2_1 = 350.0 / 2.0;
  final double _addControllerX3_1 = 311.0 / 2.0 - 50.0;
  final double _addControllerY3_1 = 5.0;
  final double _addControllerX4_1 = 311.0 / 2.0;
  final double _addControllerY4_1 = 5.0;
  final double _addControllerX5_1 = 311.0 / 2.0;
  final double _addControllerY5_1 = 5.0;
  final double _addControllerX6_1 = 311.0 / 2.0 + 50.0;
  final double _addControllerY6_1 = 5.0;
  final double _addControllerX7_1 = 311.0 - 50.0;
  final double _addControllerY7_1 = 350.0 / 2.0;
  final double _addControllerX8_1 = 311.0;
  final double _addControllerY8_1 = 350.0 / 2.0;

  final double yHeight = 350.0;

  final double nn = 0.5;

  createBezierCoordinateSet() {
    List coordinateSet_1;
    coordinateSet_1 = createSingleWaveCoordinateList(
        _addControllerX1_1,
        _addControllerY1_1,
        _addControllerX2_1,
        _addControllerY2_1,
        _addControllerX3_1,
        _addControllerY3_1,
        _addControllerX4_1,
        _addControllerY4_1,
        _addControllerX5_1,
        _addControllerY5_1,
        _addControllerX6_1,
        _addControllerY6_1,
        _addControllerX7_1,
        _addControllerY7_1,
        _addControllerX8_1,
        _addControllerY8_1);
    List _addCoordinateX_1 = coordinateSet_1[0];
    List _addCoordinateY_1 = coordinateSet_1[1];
    return [_addCoordinateX_1, _addCoordinateY_1];
  }

  dragContainer() {
    List coordinateSet = createBezierCoordinateSet();
    return CustomPaint(
      painter: SingleBezierCurvePaint(
        coordinateX: coordinateSet[0],
        coordinateY: coordinateSet[1],
        yHeight: yHeight,
      ),
    );
  }

  double bezierFunction(double x1, double x2, double x3, double x4, double t) {
    double ans;
    ans = t * t * t * x4 +
        3.0 * t * t * (1.0 - t) * x3 +
        3.0 * t * (1.0 - t) * (1.0 - t) * x2 +
        (1.0 - t) * (1.0 - t) * (1.0 - t) * x1;
    return ans;
  }

  List createHarfCoordinateList(double x1, double x2, double x3, double x4,
      double y1, double y2, double y3, double y4, int n) {
    List listA;
    List listA1;
    List listA2;
    listA = [];
    listA1 = [];
    listA2 = [];
    for (var i = 0; i < (n + 1); i++) {
      double t;
      t = 1.0 / n.toDouble() * i.toDouble();
      double ans1;
      double ans2;
      ans1 = bezierFunction(x1, x2, x3, x4, t);
      ans2 = bezierFunction(y1, y2, y3, y4, t);
      listA1.add(ans1);
      listA2.add(ans2);
    }
    listA.add(listA1);
    listA.add(listA2);
    return listA;
  }

  List createSingleWaveCoordinateList(
      double x1,
      double y1,
      double x2,
      double y2,
      double x3,
      double y3,
      double x4,
      double y4,
      double x5,
      double y5,
      double x6,
      double y6,
      double x7,
      double y7,
      double x8,
      double y8) {
    List total;
    total = [];
    List itemListX;
    List itemListY;
    itemListX = [];
    itemListY = [];
    int n1 = (x4 / nn).floor();
    int n2 = ((x8 - x4) / nn).floor();
    List coordinateList1 =
        createHarfCoordinateList(x1, x2, x3, x4, y1, y2, y3, y4, n1);
    List coordinateList2 =
        createHarfCoordinateList(x5, x6, x7, x8, y5, y6, y7, y8, n2);
    itemListX.addAll(coordinateList1[0]);
    itemListX.addAll(coordinateList2[0]);
    itemListY.addAll(coordinateList1[1]);
    itemListY.addAll(coordinateList2[1]);
    total.add(itemListX);
    total.add(itemListY);
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: dragContainer(),
    );
  }
}
