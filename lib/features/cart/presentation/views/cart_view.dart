import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/widgets/animated_order_button.dart';
import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/widgets/ordered_dishes_list.dart';
import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/widgets/serve_option_switcher.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/managers/shopping_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> with TickerProviderStateMixin {
  Duration calculateAnimatedOrderButtonDelay(int numberOfDifferentOrderedDishes) =>
      250.ms + (numberOfDifferentOrderedDishes > 0 ? ((150.ms * numberOfDifferentOrderedDishes.clamp(0, 3))) : 0.ms);

  late final AnimationController _exitAnimationController = AnimationController(vsync: this);

  @override
  dispose() {
    _exitAnimationController.dispose();
    super.dispose();
  }

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
              exitAnimationController: _exitAnimationController,
              initialOrderType: context.read<ShoppingCartCubit>().state.orderType,
            ),
            const Gap(32),
            Expanded(
              child: OrderedDishesList(
                animationDelay: 250.ms,
                exitAnimationController: _exitAnimationController,
              ),
            ),
            BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
              builder: (context, state) {
                return AnimatedOrderButton(
                  totalCost: state.totalCost,
                  animationDelay: calculateAnimatedOrderButtonDelay(2),
                  orderType: state.orderType,
                  onTap: () {
                    if (state.orderType == OrderType.table) {
                      _exitAnimationController.forward();
                      // animate out
                      // navigate to table booking
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
