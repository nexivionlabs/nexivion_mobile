import 'package:flutter/material.dart';

class BreathButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const BreathButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  State<BreathButton> createState() => _BreathButtonState();
}

class _BreathButtonState extends State<BreathButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0.96,
      upperBound: 1.02,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.94 : 1,
        duration: const Duration(milliseconds: 120),
        child: ScaleTransition(
          scale: _controller,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 36,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
