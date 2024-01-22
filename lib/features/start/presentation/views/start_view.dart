import 'package:dribbble_sushi_bar_challenge/core/constants/rive_animations_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/models/rive_animations/noodles_animation.dart';
import 'package:dribbble_sushi_bar_challenge/features/start/presentation/widgets/animated_fade_button.dart';
import 'package:dribbble_sushi_bar_challenge/features/start/presentation/widgets/animated_title_japanese.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';

import '../../../../core/constants/images_paths.dart';
import '../widgets/animated_title_english.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  double get noodleAnimationSize => MediaQuery.of(context).size.height * 1.05;

  double get noodleAnimationXOffset => MediaQuery.of(context).size.width * -0.25;

  double get noodleAnimationYOffset => MediaQuery.of(context).size.height * -0.1;

  double get signHeight => 84;

  double get signColumnHeight => signHeight * 5 + 5 * 20;

  Duration get englishTitleDelay => 500.ms;

  Duration get japaneseTitleDelay => englishTitleDelay + 500.ms;

  Duration get buttonDelay => japaneseTitleDelay + 500.ms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImagePaths.wavesBackground),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: noodleAnimationXOffset,
              top: noodleAnimationYOffset,
              child: SizedBox(
                height: noodleAnimationSize,
                width: noodleAnimationSize,
                child: RiveAnimation.asset(
                  RiveAnimationsPaths.japaneseRestaurantAnimations,
                  animations: const [NoodlesAnimation.animationName],
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topLeft,
                  onInit: (_) => setState(() {}),
                ),
              ),
            ),
            Positioned(
              right: 170,
              top: 240,
              child: SizedBox(
                height: signColumnHeight + 5,
                child: AnimatedTitleEnglish(
                  delay: 500.ms,
                ),
              ),
            ),
            Positioned(
              right: 50,
              top: 245,
              child: TitleJapanese(
                height: signColumnHeight,
                startDelay: 1000.ms,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedFadeButton(delay: buttonDelay),
      ),
    );
  }
}
