import 'package:flutter/animation.dart';


class SizeAnimation extends CurvedAnimation {
  SizeAnimation({required super.parent})
      : super(
    curve: const Interval(
      0 / 5,
      3 / 5,
      curve: Curves.easeInOutCubicEmphasized,
    ),
    reverseCurve: Interval(
      2 / 5,
      1,
      curve: Curves.easeInOutCubicEmphasized.flipped,
    ),
  );
}