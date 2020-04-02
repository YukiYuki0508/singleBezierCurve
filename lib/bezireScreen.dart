import 'package:bezier/SingleBezierCurve.dart';
import 'package:flutter/material.dart';

class BezierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topLeft, children: <Widget>[
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
        Container(
            padding: EdgeInsets.all(32.0),
            height: 350.0,
            child: SingleBezierCurve())
      ])
    ]);
  }
}
