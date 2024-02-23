import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/sizes.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedBottomButton extends StatefulWidget {
  const AnimatedBottomButton({
    super.key,
    required this.delay,
    required this.onPressed,
  });

  final Duration delay;
  final VoidCallback onPressed;

  @override
  State<AnimatedBottomButton> createState() => _AnimatedBottomButtonState();
}

class _AnimatedBottomButtonState extends State<AnimatedBottomButton> with TickerProviderStateMixin {
  late final AnimationController scaleController;
  late final AnimationController colorController;
  late final Animation<Color?> colorAnimation;

  Duration get fadeInDuration => 300.ms;

  Duration get slideInDuration => 300.ms;

  Duration get scaleDuration => 150.ms;

  Duration get scaleDownDelay => scaleDuration;

  Offset get scaleDownSizeEndOffset => const Offset(0.95, 0.95);

  Offset get scaleBeginOffset => const Offset(1, 1);

  Offset get scaleUpSizeEndOffset => const Offset(1.1, 1.1);

  @override
  void initState() {
    colorController = AnimationController(vsync: this, duration: 300.ms);
    scaleController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    colorAnimation = ColorTween(
      begin: Theme.of(context).primaryColor,
      end: Theme.of(context).colorScheme.secondary,
    ).animate(colorController);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    scaleController.dispose();
    colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTap: () {
            scaleController.forward().then((value) => scaleController.value = 0);
            Future.delayed(scaleDuration, () {
              colorController.forward();
              widget.onPressed.call();
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: Sizes.bottomBarHeight,
            padding: Paddings.mediumAll,
            decoration: BoxDecoration(
              color: colorAnimation.value,
              borderRadius: BorderRadii.circular,
            ),
            child: child,
          )
              .animate()
              .slideY(
                begin: 0.3,
                end: 0,
                delay: widget.delay,
                duration: slideInDuration,
                curve: Curves.easeIn,
              )
              .fadeIn(
                delay: widget.delay,
                duration: fadeInDuration,
                curve: Curves.easeIn,
              )
              .animate(
                autoPlay: false,
                controller: scaleController,
              )
              .scale(
                duration: scaleDuration,
                begin: scaleBeginOffset,
                end: scaleDownSizeEndOffset,
              )
              .then(delay: scaleDownDelay)
              .scale(
                duration: scaleDuration,
                begin: scaleBeginOffset,
                end: scaleUpSizeEndOffset,
              ),
        );
      },
      animation: colorAnimation,
      child: Text(
        L10n.current.reserveTable,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
