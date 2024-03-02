import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/widgets/animated_order_button.dart';
import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/widgets/ordered_dishes_list.dart';
import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/widgets/serve_option_switcher.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/managers/shopping_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  Duration calculateAnimatedOrderButtonDelay(int numberOfDifferentOrderedDishes) =>
      250.ms + (numberOfDifferentOrderedDishes > 0 ? ((150.ms * numberOfDifferentOrderedDishes.clamp(0, 3))) : 0.ms);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            const Gap(16),
            ServeOptionSwitcher(
              onSwitch: (OrderType orderType) {
                context.read<ShoppingCartCubit>().changeOrderType(orderType);
              },
              initialOrderType: context.read<ShoppingCartCubit>().state.orderType,
            ),
            const Gap(32),
            Expanded(child: OrderedDishesList(animationDelay: 250.ms)),
            BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
              builder: (context, state) {
                return AnimatedOrderButton(
                  totalCost: state.totalCost,
                  animationDelay: calculateAnimatedOrderButtonDelay(2),
                  orderType: state.orderType,
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
