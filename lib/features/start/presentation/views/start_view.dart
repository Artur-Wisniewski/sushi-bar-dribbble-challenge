import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/rive_animations_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/sizes.dart';
import 'package:dribbble_sushi_bar_challenge/core/helpers/load_image.dart';
import 'package:dribbble_sushi_bar_challenge/core/models/rive_animations/noodles_animation.dart';
import 'package:dribbble_sushi_bar_challenge/core/styles/colors.dart';
import 'package:dribbble_sushi_bar_challenge/features/start/presentation/widgets/animated_bottom_button.dart';
import 'package:dribbble_sushi_bar_challenge/features/start/presentation/widgets/title.dart';
import 'package:dribbble_sushi_bar_challenge/setup/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> with TickerProviderStateMixin {
  late final AnimationController _titleController;
  late final AnimationController _noodlesController;

  Duration get screenFadeInDuration => 300.ms;

  Duration get noodleAppearDuration => 500.ms;

  Duration get noodleAppearDelay => 200.ms;

  Duration get disappearAnimationDuration => 900.ms;

  Duration get buttonAnimationDelay => 400.ms;

  double get noodleAnimationSize => MediaQuery.of(context).size.height * 1.00;

  double get noodleAnimationXOffset => MediaQuery.of(context).size.width * -0.25;

  double get noodleAnimationYOffset => MediaQuery.of(context).size.height * -0.1;

  double get signColumnHeight =>
      MediaQuery.of(context).size.height * 0.74 -
      Sizes.bottomBarHeight -
      Paddings.mediumAll.bottom -
      Paddings.mediumAllBottomBig.bottom -
      16;

  double get signColumnYOffset => MediaQuery.of(context).size.height * 0.26;

  Duration get englishTitleDelay => 500.ms + noodleAppearDelay;

  Duration get japaneseTitleDelay => englishTitleDelay + 600.ms;

  Duration get buttonDelay => japaneseTitleDelay + japaneseLettersInterval * 3 + japaneseLetterAnimationDuration;

  Duration get japaneseLettersInterval => 140.ms;

  Duration get japaneseLetterAnimationDuration => 400.ms;

  @override
  void initState() {
    _titleController = AnimationController(vsync: this);
    _noodlesController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    loadImage(context: context, imageUrl: ImagePaths.wavesBackground);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.scaffoldBackground,
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
                )
                    .animate()
                    .fadeIn(
                      duration: noodleAppearDuration,
                      delay: noodleAppearDelay,
                    )
                    .slideY(
                      begin: 0.03,
                      end: 0,
                      duration: noodleAppearDuration,
                      delay: noodleAppearDelay,
                    ),
              ),
            )
                .animate(
                  autoPlay: false,
                  controller: _noodlesController,
                )
                .slideX(
                  begin: 0,
                  end: -1,
                  duration: disappearAnimationDuration,
                ),
            Positioned(
              right: 50,
              top: signColumnYOffset,
              child: MainTitle(
                height: signColumnHeight,
                englishTitleDelay: englishTitleDelay,
                japaneseTitleDelay: japaneseTitleDelay,
                japaneseLettersInterval: japaneseLettersInterval,
                japaneseLetterAnimationDuration: japaneseLetterAnimationDuration,
              ),
            )
                .animate(
                  autoPlay: false,
                  controller: _titleController,
                )
                .slideX(
                  begin: 0.00,
                  end: 3,
                  duration: disappearAnimationDuration,
                ),
          ],
        ),
      ).animate().fadeIn(duration: screenFadeInDuration),
      bottomNavigationBar: Padding(
        padding: Paddings.mediumAllBottomBig,
        child: AnimatedBottomButton(
          delay: buttonDelay,
          onPressed: () {
            _titleController.forward();
            _noodlesController.forward();
            Future.delayed(
              buttonAnimationDelay,
              () => context.go(RoutesPaths.home),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noodlesController.dispose();
    super.dispose();
  }
}
