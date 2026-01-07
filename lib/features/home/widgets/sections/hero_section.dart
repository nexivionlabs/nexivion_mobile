import 'package:flutter/material.dart';
import '../../../../core/animations/breath_animation.dart';
import '../../../../core/animations/breath_controller.dart';
import '../../../../core/animations/entrance_animation.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}


class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {

  late BreathController _breath;
  double _scrollFactor = 1.0;

  @override
  void initState() {
    super.initState();
    _breath = BreathController(vsync: this);
  }

  @override
  void dispose() {
    _breath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scroll) {
        if (scroll is ScrollUpdateNotification) {
          final offset = scroll.metrics.pixels;
          setState(() {
            _scrollFactor = (1 - offset / 300).clamp(0.0, 1.0);
          });
          _breath.slow();
        }

        if (scroll is ScrollEndNotification) {
          _breath.normal();
        }
        return false;
      },
      child: Transform.scale(
        scale: _scrollFactor,
        child: Opacity(
          opacity: _scrollFactor,
          child: EntranceAnimation(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // 🫁 ICON
                  BreathAnimation(
                    breath: _breath,
                    child: const Icon(
                      Icons.auto_awesome,
                      size: 64,
                      color: Colors.cyan,
                    ),
                  ),

                  const SizedBox(height: 32),

                  const Text(
                    "Build your Digital Future",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  // 🫁 BUTTON
                  MouseRegion(
                    onEnter: (_) => _breath.deep(),
                    onExit: (_) => _breath.normal(),
                    child: GestureDetector(
  onTapDown: (_) => _breath.deep(),
  onTapUp: (_) {
    _breath.normal();
    // TODO: click action (şimdilik boş)
  },
  onTapCancel: () => _breath.normal(),
  child: BreathAnimation(
    breath: _breath,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'Get Started',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
