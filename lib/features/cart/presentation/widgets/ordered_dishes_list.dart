import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/widgets/ordered_dish_card.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/managers/shopping_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderedDishesList extends StatelessWidget {
  const OrderedDishesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCartCubit, ShoppingCartState>(builder: (context, state) {
      return ListView(
        shrinkWrap: true,
        children: List.generate(state.order.length, (index) {
          final dish = state.order.keys.elementAt(index);
          final quantity = state.order[dish]!;
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: OrderedDishCard(dish: dish, quantity: quantity),
          );
        })
            .animate(
              interval: 150.ms,
              delay: 250.ms,
            )
            .fadeIn(
              duration: 600.ms,
              //curve: Curves.easeInOutBack,
            )
            .slideX(
              begin: 0.05,
              end: 0,
              duration: 600.ms,
              //curve: Curves.easeInOutBack,
            ),
      );
    });
  }
}
