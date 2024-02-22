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

  Duration get fadeInDuration => 300.ms;

  Duration get slideDuration => 150.ms;

  Duration get firstSignDelay => delay;

  Duration get secondSignDelay => delay + 100.ms;

  Duration get thirdSignDelay => secondSignDelay + 100.ms;

  Duration get fourthSignDelay => thirdSignDelay + 100.ms;

  Duration get fifthSignDelay => fourthSignDelay + 100.ms;

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
