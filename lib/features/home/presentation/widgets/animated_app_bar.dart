import 'package:dribbble_sushi_bar_challenge/core/constants/gaps.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedAppBar extends StatelessWidget {
  const AnimatedAppBar({
    super.key,
    required this.appBarPlayDuration,
    required this.appBarAnimationController,
  });

  final Duration appBarPlayDuration;
  final AnimationController appBarAnimationController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'San Francisco',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Gaps.small,
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Theme.of(context).colorScheme.secondary,
              size: 28,
            )
          ],
        )
            .animate(
              controller: appBarAnimationController,
            )
            .fadeIn(
              duration: appBarPlayDuration,
            )
            .slideX(
              duration: appBarPlayDuration,
              begin: -0.1,
              end: 0,
              curve: Curves.easeInOutSine,
            ),
        const RoundIconButton.primary(icon: Icons.search)
            .animate(
              controller: appBarAnimationController,
            )
            .fadeIn(
              duration: appBarPlayDuration,
            )
            .slideX(
              duration: appBarPlayDuration,
              begin: 0.3,
              end: 0,
              curve: Curves.easeInOutSine,
            ),
      ],
    );
  }
}
