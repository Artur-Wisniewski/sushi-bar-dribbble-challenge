import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/sizes.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/text_swapper.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/managers/shopping_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedOrderButton extends StatefulWidget {
  const AnimatedOrderButton({
    super.key,
    required this.totalCost,
    required this.animationDelay,
    required this.orderType,
    required this.onTap,
    required this.exitAnimationController,
  });

  final Duration animationDelay;
  final double totalCost;
  final OrderType orderType;
  final VoidCallback onTap;
  final AnimationController exitAnimationController;

  @override
  State<AnimatedOrderButton> createState() => _AnimatedOrderButtonState();
}

class _AnimatedOrderButtonState extends State<AnimatedOrderButton> with TickerProviderStateMixin {
  late final AnimationController _entryAnimationController = AnimationController(vsync: this);

  @override
  void initState() {
    widget.exitAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        _entryAnimationController.reverse();
      }
      if(status == AnimationStatus.reverse) {
        _entryAnimationController.forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _entryAnimationController.reverse();
          widget.onTap();
        },
        child: Container(
          alignment: Alignment.center,
          height: Sizes.bottomBarHeight,
          padding: Paddings.mediumAll,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadii.circular,
          ),
          child: TextSwapper(
            text: widget.orderType.isDelivery ? 'Order \$${widget.totalCost.toStringAsFixed(0)}' : 'Book a table',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        )
            .animate(
              controller: _entryAnimationController,
              delay: widget.animationDelay,
            )
            .scaleXY(
              begin: 0.5,
              end: 1,
              duration: 750.ms,
              curve: Curves.ease,
            )
            .slideY(
              begin: 1.23,
              end: 0,
              duration: 750.ms,
              curve: Curves.ease,
            ));
  }

  @override
  dispose() {
    _entryAnimationController.dispose();
    super.dispose();
  }
}
