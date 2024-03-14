import 'package:auto_size_text/auto_size_text.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class AnimatedTitleEnglish extends StatelessWidget {
  AnimatedTitleEnglish({super.key, required this.delay});

  final Duration delay;

  Duration get fadeInDuration => 300.ms;

  Duration get slideInDuration => 150.ms;

  Duration get firstDelay => delay;

  Duration get secondDelay => firstDelay + fadeInDuration;

  final textGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 8,
          child: AutoSizeText(
            L10n.current.japaneseRestaurant.split(' ')[0].split('').join('\n').toString(),
            style: Theme.of(context).textTheme.titleLarge,
            group: textGroup,
          )
              .animate(delay: firstDelay)
              .fadeIn(
                duration: fadeInDuration,
                curve: Curves.easeIn,
              )
              .slideX(
                begin: 1,
                end: 0,
                duration: slideInDuration,
                curve: Curves.easeIn,
              ),
        ),
        const Gap(20),
        Expanded(
          flex: 10,
          child: AutoSizeText(
            L10n.current.japaneseRestaurant.split(' ')[1].split('').join('\n').toString(),
            style: Theme.of(context).textTheme.titleLarge,
            group: textGroup,
          )
              .animate(delay: secondDelay)
              .fadeIn(
                duration: fadeInDuration,
                curve: Curves.easeIn,
              )
              .slideX(
                begin: 1,
                end: 0,
                duration: slideInDuration,
                curve: Curves.easeIn,
              ),
        ),
      ],
    );
  }
}
