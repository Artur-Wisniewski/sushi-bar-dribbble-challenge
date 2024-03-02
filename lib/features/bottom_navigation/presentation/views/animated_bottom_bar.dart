import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/sizes.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/svg_images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/overlay_animated_counter_badge.dart';
import 'package:dribbble_sushi_bar_challenge/features/bottom_navigation/manager/bottom_bar_navigation_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/features/bottom_navigation/presentation/widgets/bottom_bar_item.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/managers/shopping_cart_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/setup/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AnimatedBottomBar extends StatefulWidget {
  const AnimatedBottomBar({super.key});

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
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
          child: BlocBuilder<BottomBarNavigationCubit, BottomBarNavigationState>(
            builder: (context, bottomBarState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedBottomBarItem(
                    isActive: bottomBarState.currentItem == BottomBarItems.home,
                    iconPath: SvgImagesPaths.bowlChopsticks,
                    onTap: () {
                      context.read<BottomBarNavigationCubit>().changeItem(BottomBarItems.home);
                      context.go(RoutesPaths.home);
                    },
                  ),
                  AnimatedBottomBarItem(
                    isActive: bottomBarState.currentItem == BottomBarItems.other,
                    iconPath: SvgImagesPaths.rhombusSplit,
                  ),
                  BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
                    builder: (context, state) {
                      return OverlayAnimatedBadge(
                        counter: state.totalOrderedItems,
                        child: AnimatedBottomBarItem(
                          isActive: bottomBarState.currentItem == BottomBarItems.cart,
                          iconPath: SvgImagesPaths.cart,
                          onTap: () {
                            context.read<BottomBarNavigationCubit>().changeItem(BottomBarItems.cart);
                            Future.delayed(750.ms, () => context.go(RoutesPaths.cart));
                          },
                        ),
                      );
                    },
                  ),
                  AnimatedBottomBarItem(
                    isActive: bottomBarState.currentItem == BottomBarItems.profile,
                    iconPath: SvgImagesPaths.account,
                  ),
                ].animate(interval: 80.ms).fadeIn(duration: 450.ms).slideY(begin: 1, end: 0, duration: 300.ms),
              );
            },
          )),
    );
  }
}
