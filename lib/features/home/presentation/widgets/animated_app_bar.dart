import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class AnimatedAppBar extends StatelessWidget {
  const AnimatedAppBar({
    super.key,
    required this.appBarPlayDuration,
  });

  final Duration appBarPlayDuration;

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
            const Gap(8),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
              size: 28,
            )
          ],
        )
            .animate()
            .fadeIn(
              duration: appBarPlayDuration,
            )
            .slideX(
              duration: appBarPlayDuration,
              begin: -0.1,
              end: 0,
              curve: Curves.easeInOutSine,
            ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(300),
            border: Border.all(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 2,
            ),
          ),
          child: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ) .animate()
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
