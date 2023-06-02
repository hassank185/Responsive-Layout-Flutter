
import 'package:flutter/animation.dart';


class ShapeAnimation extends CurvedAnimation {
  ShapeAnimation({required super.parent})
      : super(
    curve: const Interval(
      2 / 5,
      3 / 5,
      curve: Curves.easeInOutCubicEmphasized,
    ),
  );
}