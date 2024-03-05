// appBar: ,

import 'package:dribbble_sushi_bar_challenge/core/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AnimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnimatedAppBar({super.key});

  static const paddingLeft = 16.0;
  static const height = 70.0;
  static const backButtonWidth = 44.0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        'Book a Table',
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 24,
        ),
      )
          .animate()
          .fadeIn(
            duration: 500.ms,
          )
          .slideY(
            begin: -0.4,
            end: 0,
            duration: 500.ms,
            curve: Curves.easeInOutSine,
          ),
      centerTitle: true,
      toolbarHeight: height,
      leadingWidth: paddingLeft + backButtonWidth,
      leading: Row(
        children: [
          const Gap(paddingLeft),
          RoundIconButton(
            icon: Icons.arrow_back,
            onPressed: () {
              context.pop();
            },
          )
              .animate()
              .fadeIn(
                duration: 500.ms,
              )
              .slideX(
                begin: -0.4,
                end: 0,
                duration: 500.ms,
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
