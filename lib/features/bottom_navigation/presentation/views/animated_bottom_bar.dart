import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/sizes.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/svg_images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/overlay_animated_counter_badge.dart';
import 'package:dribbble_sushi_bar_challenge/features/bottom_navigation/manager/bottom_bar_navigation_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/features/bottom_navigation/presentation/widgets/bottom_bar_item.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/manager/shopping_cart_cubit.dart';
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
  final BottomBarNavigationCubit bottomBarNavigationCubit = BottomBarNavigationCubit();

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
            bloc: bottomBarNavigationCubit,
            builder: (context, bottomBarState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedBottomBarItem(
                    isActive: bottomBarState.currentItem == BottomBarItems.home,
                    iconPath: SvgImagesPaths.bowlChopsticks,
                    onTap: () {
                      bottomBarNavigationCubit.changeItem(BottomBarItems.home);
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
                        counter: state.order.values.fold(0, (prev, element) => prev + element),
                        child: AnimatedBottomBarItem(
                          isActive: bottomBarState.currentItem == BottomBarItems.cart,
                          iconPath: SvgImagesPaths.cart,
                          onTap: () {
                            bottomBarNavigationCubit.changeItem(BottomBarItems.cart);
                            context.go(RoutesPaths.cart);
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
