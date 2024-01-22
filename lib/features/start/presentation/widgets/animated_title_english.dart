import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedTitleEnglish extends StatelessWidget {
  const AnimatedTitleEnglish({super.key, required this.delay});

  final Duration delay;

  Duration get fadeInDuration => 300.ms;

  Duration get slideInDuration => 150.ms;

  Duration get firstDelay => delay;

  Duration get secondDelay => firstDelay + fadeInDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          'Japanese'.split('').join('\n').toString(),
          style: Theme.of(context).textTheme.titleLarge,
        )
            .animate()
            .fadeIn(
              delay: firstDelay,
              duration: fadeInDuration,
              curve: Curves.easeIn,
            )
            .slideX(
              begin: 1,
              end: 0,
              delay: firstDelay,
              duration: slideInDuration,
              curve: Curves.easeIn,
            ),
        AutoSizeText(
          'restaurant'.split('').join('\n').toString(),
          style: Theme.of(context).textTheme.titleLarge,
        )
            .animate()
            .fadeIn(
              delay: secondDelay,
              duration: fadeInDuration,
              curve: Curves.easeIn,
            )
            .slideX(
              begin: 1,
              end: 0,
              delay: secondDelay,
              duration: slideInDuration,
              curve: Curves.easeIn,
            ),
      ],
    );
  }
}
