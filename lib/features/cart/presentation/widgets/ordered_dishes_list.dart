import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/widgets/ordered_dish_card.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/managers/shopping_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderedDishesList extends StatelessWidget {
  const OrderedDishesList({
    super.key,
    required this.animationDelay,
    required this.exitAnimationController,
    required this.animationInterval,
    required this.animationDuration,
  });

  final Duration animationDelay;
  final Duration animationInterval;
  final Duration animationDuration;
  final AnimationController exitAnimationController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipper: _OrderedDishesListClipper(),
      child: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
        builder: (context, state) {
          return ListView(
            shrinkWrap: true,
            padding: Paddings.listPadding,
            children: List.generate(state.order.length, (index) {
              final dish = state.order.keys.elementAt(index);
              final quantity = state.order[dish]!;
              return Padding(
                padding: Paddings.mediumBottom,
                child: OrderedDishCard(
                  dish: dish,
                  quantity: quantity,
                ),
              );
            })
                .animate(
                  interval: animationInterval,
                  delay: animationDelay,
                )
                .fadeIn(
                  duration: animationDuration,
                  curve: Curves.easeInOutSine,
                )
                .slideX(
                  begin: 0.05,
                  end: 0,
                  duration: animationDuration,
                  curve: Curves.easeInOutSine,
                ),
          );
        },
      ),
    )
        .animate(
          controller: exitAnimationController,
          autoPlay: false,
        )
        .slideX(
          begin: 0,
          end: -0.1,
          duration: animationDuration,
          curve: Curves.easeInOutSine,
        )
        .fadeOut(
          duration: animationDuration,
          curve: Curves.easeInOutSine,
        );
  }
}

class _OrderedDishesListClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    return RRect.fromRectAndCorners(
      Rect.fromLTWH(16, 0, size.width - 32, size.height),
      topLeft: Radii.medium,
      topRight: Radii.medium,
      bottomLeft: Radii.big,
      bottomRight: Radii.big,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
    return false;
  }
}
