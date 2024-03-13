import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedSign extends StatelessWidget {
  const AnimatedSign({
    super.key,
    required this.imagePath,
    required this.signHeight,
    required this.delay,
  });

  final String imagePath;
  final double signHeight;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: signHeight,
    )
        .animate()
        .slideX(
          begin: 0.7,
          end: 0,
          delay: delay,
          duration: 400.ms,
          curve: Curves.easeIn,
        )
        .fadeIn(
          delay: delay,
          duration: 400.ms,
        );
  }
}
