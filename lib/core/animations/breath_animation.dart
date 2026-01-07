import 'package:flutter/material.dart';
import 'breath_controller.dart';

class BreathAnimation extends StatelessWidget {
  final BreathController breath;
  final Widget child;
  final double minScale;
  final double maxScale;

  const BreathAnimation({
    super.key,
    required this.breath,
    required this.child,
    this.minScale = 0.95,
    this.maxScale = 1.05,
  });

  @override
  Widget build(BuildContext context) {
    final animation = Tween<double>(
      begin: minScale,
      end: maxScale,
    ).animate(
      CurvedAnimation(
        parent: breath.controller,
        curve: Curves.easeInOut,
      ),
    );

    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }
}
