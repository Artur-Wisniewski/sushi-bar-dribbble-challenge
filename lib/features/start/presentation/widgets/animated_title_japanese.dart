import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/features/start/presentation/widgets/animated_sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class TitleJapanese extends StatelessWidget {
  const TitleJapanese({super.key, required this.height, required this.delay});

  final double height;

  double get signHeight => height / 5 - ((4 * 20) / 5);

  final Duration delay;

  Duration get fadeInDuration => 400.ms;

  Duration get slideDuration => 500.ms;

  Duration get delayBetweenSigns => 200.ms;

  Duration get firstSignDelay => delay;

  Duration get secondSignDelay => delay + delayBetweenSigns;

  Duration get thirdSignDelay => secondSignDelay + delayBetweenSigns;

  Duration get fourthSignDelay => thirdSignDelay + delayBetweenSigns;

  Duration get fifthSignDelay => fourthSignDelay + delayBetweenSigns;

  // TODO do it better with group intervals animation

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          AnimatedSign(
            imagePath: ImagePaths.sing1,
            signHeight: signHeight,
            delay: firstSignDelay,
          ),
          const Gap(20),
          AnimatedSign(
            imagePath: ImagePaths.sing2,
            signHeight: signHeight,
            delay: secondSignDelay,
          ),
          const Gap(20),
          AnimatedSign(
            imagePath: ImagePaths.sing3,
            signHeight: signHeight,
            delay: thirdSignDelay,
          ),
          const Gap(20),
          AnimatedSign(
            imagePath: ImagePaths.sing4,
            signHeight: signHeight,
            delay: fourthSignDelay,
          ),
          const Gap(20),
          AnimatedSign(
            imagePath: ImagePaths.sing5,
            signHeight: signHeight,
            delay: fifthSignDelay,
          ),
        ],
      ),
    );
  }
}
