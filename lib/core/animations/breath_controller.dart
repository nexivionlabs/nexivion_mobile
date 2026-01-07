import 'package:flutter/material.dart';

class BreathController {
  final AnimationController controller;

  BreathController({required TickerProvider vsync})
      : controller = AnimationController(
          vsync: vsync,
          duration: const Duration(seconds: 3),
        )..repeat(reverse: true);

  void slow() {
    controller.duration = const Duration(seconds: 5);
    controller.repeat(reverse: true);
  }

  void normal() {
    controller.duration = const Duration(seconds: 3);
    controller.repeat(reverse: true);
  }

  void deep() {
    controller.duration = const Duration(seconds: 2);
    controller.repeat(reverse: true);
  }

  void dispose() {
    controller.dispose();
  }
}
