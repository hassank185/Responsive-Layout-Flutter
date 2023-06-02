
import 'package:flutter/animation.dart';


class ScaleAnimation extends CurvedAnimation {
  ScaleAnimation({required super.parent})
      : super(
    curve: const Interval(
      3 / 5,
      4 / 5,
      curve: Curves.easeInOutCubicEmphasized,
    ),
    reverseCurve: Interval(
      3 / 5,
      1,
      curve: Curves.easeInOutCubicEmphasized.flipped,
    ),
  );
}