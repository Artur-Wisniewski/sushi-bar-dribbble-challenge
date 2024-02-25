import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/sizes.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/svg_images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/overlay_animated_counter_badge.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/svg_icon.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/manager/shopping_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedBottomBar extends StatefulWidget {
  const AnimatedBottomBar({super.key});

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  static const double iconSize = 22;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.mediumBottom,
      child: Container(
          height: Sizes.bottomBarHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadii.circular,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SvgIcon(
                SvgImagesPaths.bowlChopsticks,
                size: iconSize,
                isHighlighted: true,
              ),
              const SvgIcon(
                SvgImagesPaths.rhombusSplit,
                size: iconSize,
              ),
              BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
                builder: (context, state) {
                  return OverlayAnimatedBadge(
                    counter: state.order.values.fold(0, (prev, element) => prev + element),
                    child: const SvgIcon(
                      SvgImagesPaths.cart,
                      size: iconSize,
                    ),
                  );
                },
              ),
              const SvgIcon(
                SvgImagesPaths.account,
                size: iconSize,
              ),
            ].animate(interval: 80.ms).fadeIn(duration: 450.ms).slideY(begin: 1, end: 0, duration: 300.ms),
          )),
    );
  }
}
