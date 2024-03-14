// appBar: ,

import 'package:dribbble_sushi_bar_challenge/core/constants/gaps.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/round_button.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnimatedAppBar({super.key, required this.onLeadingButton, required this.animationDuration});

  static const paddingLeft = 16.0;
  static const height = 70.0;
  static const backButtonWidth = 44.0;

  final VoidCallback onLeadingButton;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        L10n.current.bookTable,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 24,
        ),
      )
          .animate()
          .fadeIn(
            duration: animationDuration,
          )
          .slideY(
            begin: -0.4,
            end: 0,
            duration: animationDuration,
            curve: Curves.easeInOutSine,
          ),
      centerTitle: true,
      toolbarHeight: height,
      leadingWidth: paddingLeft + backButtonWidth,
      leading: Row(
        children: [
          Gaps.medium,
          RoundIconButton.primary(
            icon: Icons.arrow_back,
            onPressed: onLeadingButton,
          )
              .animate()
              .fadeIn(
                duration: animationDuration,
              )
              .slideX(
                begin: -0.4,
                end: 0,
                duration: animationDuration,
                curve: Curves.easeInOutSine,
              ),
        ],
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
