import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/sizes.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/springy_button.dart';
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
  late final AnimationController colorController;
  late final Animation<Color?> colorAnimation;

  Duration get fadeInDuration => 300.ms;

  Duration get slideInDuration => 300.ms;

  bool isInitialized = false;

  @override
  void initState() {
    colorController = AnimationController(vsync: this, duration: slideInDuration);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isInitialized) {
      colorAnimation = ColorTween(
        begin: Theme.of(context).primaryColor,
        end: Theme.of(context).colorScheme.secondary,
      ).animate(colorController);
      isInitialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SpringyButton(
      onPressed: () {
        colorController.forward();
        widget.onPressed.call();
      },
      child: AnimatedBuilder(
        builder: (BuildContext context, Widget? child) {
          return Container(
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
              );
        },
        animation: colorAnimation,
        child: Text(
          L10n.current.reserveTable,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }

  @override
  void dispose() {
    colorController.dispose();
    super.dispose();
  }
}
