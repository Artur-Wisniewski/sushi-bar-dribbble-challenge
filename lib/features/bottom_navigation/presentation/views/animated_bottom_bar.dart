import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/sizes.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/svg_images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/overlay_animated_counter_badge.dart';
import 'package:dribbble_sushi_bar_challenge/features/bottom_navigation/presentation/manager/bottom_bar_navigation_cubit.dart';
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

class _AnimatedBottomBarState extends State<AnimatedBottomBar> with SingleTickerProviderStateMixin {
  late final AnimationController _fadeOutAnimationController = AnimationController(
    vsync: this,
    duration: animationDuration,
  );

  Duration get animationDuration => 500.ms;

  Duration get changeItemDuration => 750.ms;

  Duration get showItemInterval => 120.ms;

  Duration get fadeInItemDuration => 650.ms;

  Duration get fadeOutItemsDuration => 500.ms;

  Duration get slideInItemDuration => 500.ms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.mediumAllBottomBig,
      child: BlocConsumer<BottomBarNavigationCubit, BottomBarNavigationState>(
        listener: (context, state) {
          if (state.isNavigatedOutsideShell) {
            _fadeOutAnimationController.forward();
          } else {
            _fadeOutAnimationController.reverse();
          }
        },
        listenWhen: (previous, current) {
          return previous.isNavigatedOutsideShell != current.isNavigatedOutsideShell;
        },
        builder: (context, bottomBarState) {
          return AnimatedContainer(
            height: Sizes.bottomBarHeight,
            decoration: BoxDecoration(
              color: bottomBarState.isNavigatedOutsideShell
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadii.circular,
            ),
            duration: animationDuration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedBottomBarItem(
                  isActive: bottomBarState.currentItem == BottomBarItems.home,
                  iconPath: SvgImagesPaths.bowlChopsticks,
                  onTap: () {
                    context.read<BottomBarNavigationCubit>().changeItem(BottomBarItems.home);
                    Future.delayed(changeItemDuration, () => context.go(RoutesPaths.home));
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
                          Future.delayed(changeItemDuration, () => context.go(RoutesPaths.cart));
                        },
                      ),
                    );
                  },
                ),
                AnimatedBottomBarItem(
                  isActive: bottomBarState.currentItem == BottomBarItems.profile,
                  iconPath: SvgImagesPaths.account,
                ),
              ]
                  .animate(
                    interval: showItemInterval,
                  )
                  .fadeIn(
                    duration: fadeInItemDuration,
                  )
                  .slideY(
                    begin: 0.7,
                    end: 0,
                    duration: slideInItemDuration,
                  ),
            )
                .animate(
                  controller: _fadeOutAnimationController,
                  autoPlay: false,
                )
                .fadeOut(
                  duration: fadeOutItemsDuration,
                ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _fadeOutAnimationController.dispose();
    super.dispose();
  }
}
