import 'package:flutter/material.dart';

class TranslateAnimation extends StatelessWidget {
  const TranslateAnimation({
    Key? key,
    this.duration = const Duration(milliseconds: 800),
    required this.child,
    this.offset = 140.0,
    this.curve = Curves.fastOutSlowIn,
    this.offsetDirection = Axis.vertical,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final double offset;
  final Curve curve;
  final Axis offsetDirection;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      curve: curve,
      // ignore: prefer_int_literals
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, double value, child) {
        return Transform.translate(
            offset: offsetDirection == Axis.horizontal
                ? Offset(value * offset, 0)
                : Offset(0, value * offset),
            child: child);
      },
      child: child,
    );
  }
}

class ScaleAnimation extends StatelessWidget {
  const ScaleAnimation({
    Key? key,
    this.duration = const Duration(milliseconds: 800),
    required this.child,
    this.curve = Curves.fastOutSlowIn,
    this.initScale = 0.0,
    this.finalScale = 1.0,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final double initScale;
  final double finalScale;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      curve: curve,
      tween: Tween(begin: initScale, end: finalScale),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }
}
