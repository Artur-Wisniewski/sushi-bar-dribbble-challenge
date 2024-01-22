import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedFadeButton extends StatelessWidget {
  const AnimatedFadeButton({super.key, required this.delay});

  final Duration delay;

  Duration get fadeInDuration => 300.ms;

  Duration get slideInDuration => 300.ms;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size.fromHeight(60.0),
        backgroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200.0),
        ),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2.0,
        ),
      ),
      onPressed: () {},
      child: Text(
        L10n.current.reserveTable,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    )
        .animate()
        .slideY(
          begin: 0.3,
          end: 0,
          delay: delay,
          duration: slideInDuration,
          curve: Curves.easeIn,
        )
        .fadeIn(
          delay: delay,
          duration: fadeInDuration,
          curve: Curves.easeIn,
        );
  }
}
