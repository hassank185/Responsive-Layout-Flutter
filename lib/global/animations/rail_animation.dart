
import 'package:flutter/animation.dart';

class RailAnimation extends CurvedAnimation {
  RailAnimation({required super.parent})
      : super(
    curve: const Interval(0 / 5, 4 / 5),
    reverseCurve: const Interval(3 / 5, 1),
  );
}
