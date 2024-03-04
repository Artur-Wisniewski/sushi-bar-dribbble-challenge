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
  });

  final Duration animationDelay;
  final AnimationController exitAnimationController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: List.generate(state.order.length, (index) {
            final dish = state.order.keys.elementAt(index);
            final quantity = state.order[dish]!;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: OrderedDishCard(
                dish: dish,
                quantity: quantity,
              ),
            );
          })
              .animate(
                interval: 150.ms,
                delay: animationDelay,
              )
              .fadeIn(
                duration: 600.ms,
                curve: Curves.easeInOutSine,
              )
              .slideX(
                begin: 0.05,
                end: 0,
                duration: 600.ms,
                curve: Curves.easeInOutSine,
              ),
        )
            .animate(
              controller: exitAnimationController,
              autoPlay: false,
            )
            .slideX(
              begin: 0,
              end: -0.1,
              duration: 600.ms,
              curve: Curves.easeInOutSine,
            )
            .fadeOut(
              duration: 600.ms,
              curve: Curves.easeInOutSine,
            );
      },
    );
  }
}
