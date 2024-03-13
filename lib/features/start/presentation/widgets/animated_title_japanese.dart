import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TitleJapanese extends StatelessWidget {
  const TitleJapanese(
      {super.key, required this.height, required this.delay, required this.interval, required this.animationDuration});

  final double height;

  final Duration delay;

  final Duration interval;
  final Duration animationDuration;

  double get signHeight => height / 5 - ((4 * 20) / 5);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: Paddings.mediumBottom,
            child: Image.asset(
              ImagePaths.sing1,
              height: signHeight,
            ),
          ),
          Padding(
            padding: Paddings.mediumBottom,
            child: Image.asset(
              ImagePaths.sing2,
              height: signHeight,
            ),
          ),
          Padding(
            padding: Paddings.mediumBottom,
            child: Image.asset(
              ImagePaths.sing3,
              height: signHeight,
            ),
          ),
          Padding(
            padding: Paddings.mediumBottom,
            child: Image.asset(
              ImagePaths.sing4,
              height: signHeight,
            ),
          ),
          Image.asset(
            ImagePaths.sing5,
            height: signHeight,
          ),
        ]
            .animate(
              interval: interval,
              delay: delay,
            )
            .slideX(
              begin: 0.7,
              end: 0,
              duration: animationDuration,
              curve: Curves.easeIn,
            )
            .fadeIn(
              duration: animationDuration,
            ),
      ),
    );
  }
}
