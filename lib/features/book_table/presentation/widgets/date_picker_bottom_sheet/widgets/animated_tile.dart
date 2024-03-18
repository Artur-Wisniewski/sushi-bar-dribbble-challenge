import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:flutter/material.dart';

class AnimatedTile extends StatelessWidget {
  const AnimatedTile(
      {super.key, required this.animationDuration, required this.isPicked, required this.onTap, required this.text});

  final Duration animationDuration;
  final bool isPicked;
  final VoidCallback onTap;
  final String text;

  Color getColor(bool isPicked, BuildContext context) {
    if (isPicked) {
      return Theme.of(context).scaffoldBackgroundColor;
    } else {
      return Theme.of(context).colorScheme.secondaryContainer;
    }
  }

  TextStyle getTextStyle(bool isPicked, BuildContext context) {
    if (isPicked) {
      return Theme.of(context).textTheme.titleSmall!;
    } else {
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: animationDuration,
        margin: Paddings.smallRight,
        padding: Paddings.mediumHorizontalSmallVertical,
        decoration: BoxDecoration(
          color: getColor(isPicked, context),
          borderRadius: BorderRadii.medium,
        ),
        child: AnimatedDefaultTextStyle(
          style: getTextStyle(isPicked, context),
          duration: animationDuration,
          child: Text(text),
        ),
      ),
    );
  }
}
