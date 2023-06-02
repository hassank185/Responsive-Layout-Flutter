
import 'package:flutter/animation.dart';

class RailFabAnimation extends CurvedAnimation {
  RailFabAnimation({required super.parent})
      : super(
    curve: const Interval(3 / 5, 1),
  );
}