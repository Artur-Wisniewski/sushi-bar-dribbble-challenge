import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/sizes.dart';
import 'package:dribbble_sushi_bar_challenge/core/styles/colors.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/springy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedBottomButton extends StatefulWidget {
  const AnimatedBottomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.changeColorDuration = const Duration(milliseconds: 400),
  });

  final String label;
  final VoidCallback? onPressed;
  final Duration changeColorDuration;

  @override
  State<AnimatedBottomButton> createState() => _AnimatedBottomButtonState();
}

class _AnimatedBottomButtonState extends State<AnimatedBottomButton> {
  late bool _isEnabled = widget.onPressed != null;

  @override
  void didUpdateWidget(covariant AnimatedBottomButton oldWidget) {
    if (oldWidget.onPressed != widget.onPressed) {
      setState(() {
        _isEnabled = widget.onPressed != null;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SpringyButton(
      onPressed: () {
        if (_isEnabled) widget.onPressed!.call();
      },
      child: AnimatedContainer(
        alignment: Alignment.center,
        height: Sizes.bottomBarHeight,
        padding: Paddings.mediumAll,
        decoration: BoxDecoration(
          color: _isEnabled ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
          borderRadius: BorderRadii.circular,
        ),
        duration: widget.changeColorDuration,
        child: AnimatedDefaultTextStyle(
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: _isEnabled ? Theme.of(context).colorScheme.secondary : AppColors.greyMedium,
              ),
          duration: widget.changeColorDuration,
          child: Text(widget.label),
        ).animate().fadeIn(duration: 150.ms),
      ),
    );
  }
}
