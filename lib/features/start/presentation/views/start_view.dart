import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/rive_animations_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/models/rive_animations/noodles_animation.dart';
import 'package:dribbble_sushi_bar_challenge/features/start/presentation/widgets/animated_fade_button.dart';
import 'package:dribbble_sushi_bar_challenge/features/start/presentation/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';

class StartView extends StatefulWidget {
  const StartView({super.key, required this.image});

  final AssetImage image;

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  double get noodleAnimationSize => MediaQuery.of(context).size.height * 1.05;

  double get noodleAnimationXOffset => MediaQuery.of(context).size.width * -0.25;

  double get noodleAnimationYOffset => MediaQuery.of(context).size.height * -0.1;

  double get signColumnHeight => MediaQuery.of(context).size.height * 0.67 - 60 - 32;

  double get signColumnYOffset => MediaQuery.of(context).size.height * 0.30;

  Duration get englishTitleDelay => 500.ms;

  Duration get japaneseTitleDelay => englishTitleDelay + 500.ms;

  Duration get buttonDelay => japaneseTitleDelay + 500.ms;

  @override
  void initState() {
    loadImage(ImagePaths.wavesBackground);
    super.initState();
  }

  Future<void> loadImage(String imageUrl) async {
    try {
      await precacheImage(AssetImage(imageUrl), context);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: widget.image,
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
                ).animate().fadeIn(duration: 500.ms, delay: 200.ms).slideY(
                      begin: 0.03,
                      end: 0,
                      duration: 500.ms,
                      delay: 200.ms,
                    ),
              ),
            ),
            Positioned(
              right: 50,
              top: signColumnYOffset,
              child: MainTitle(height: signColumnHeight),
            )
          ],
        ),
      ).animate().fadeIn(duration: 300.ms),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedFadeButton(delay: buttonDelay),
      ),
    );
  }
}
