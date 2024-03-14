import 'package:dribbble_sushi_bar_challenge/core/constants/gaps.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/features/bottom_navigation/presentation/manager/bottom_bar_navigation_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/widgets/animated_order_button.dart';
import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/widgets/ordered_dishes_list.dart';
import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/widgets/serve_option_switcher.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/managers/shopping_cart_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/setup/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> with TickerProviderStateMixin {
  Duration get tabAnimationDuration => 750.ms;

  Duration get orderedDishesListAnimationDelay => 250.ms;

  Duration get bottomBarAnimationDelay => 250.ms;

  Duration get exitAnimationDuration => 750.ms;

  Duration get orderedDishesListAnimationInterval => 150.ms;

  Duration get orderedDishesListAnimationDuration => 600.ms;

  late final AnimationController _exitAnimationController = AnimationController(vsync: this);

  @override
  void initState() {
    super.initState();
    _exitAnimationController.addStatusListener(_onExitAnimationStatusChange);
  }

  Future<void> _onExitAnimationStatusChange(AnimationStatus status) async {
    if (status == AnimationStatus.completed) {
      if (context.read<BottomBarNavigationCubit>().state.isNavigatedOutsideShell) {
        await context.push(RoutesPaths.bookTable);
        _exitAnimationController.reverse();
      }
    }
  }

  Duration _calculateAnimatedOrderButtonDelay(int numberOfDifferentOrderedDishes) {
    if (numberOfDifferentOrderedDishes > 0) {
      return orderedDishesListAnimationDelay +
          ((orderedDishesListAnimationInterval * numberOfDifferentOrderedDishes.clamp(1, 3)));
    }
    return orderedDishesListAnimationDelay;
  }

  Future<void> _onOrderButton(ShoppingCartState state) async {
    if (state.orderType == OrderType.table) {
      _exitAnimationController.forward();
      Future.delayed(bottomBarAnimationDelay, () {
        context.read<BottomBarNavigationCubit>().markNavigateOutsideShell(true);
      });
    }
  }

  void _onBottomBarChange(context, state) {
    if (state.currentItem != BottomBarItems.cart) {
      _exitAnimationController.forward();
    }
  }

  void _onServeOptionSwitch(OrderType orderType) {
    context.read<ShoppingCartCubit>().changeOrderType(orderType);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BottomBarNavigationCubit, BottomBarNavigationState>(
      listener: _onBottomBarChange,
      child: SafeArea(
        child: Column(
          children: [
            Gaps.medium,
            Padding(
              padding: Paddings.mediumAllBottomNone,
              child: ServeOptionSwitcher(
                onSwitch: _onServeOptionSwitch,
                exitAnimationController: _exitAnimationController,
                initialOrderType: context.read<ShoppingCartCubit>().state.orderType,
                animationDuration: tabAnimationDuration,
              ),
            ),
            Gaps.big,
            Expanded(
              child: Stack(
                children: [
                  OrderedDishesList(
                    animationDelay: orderedDishesListAnimationDelay,
                    exitAnimationController: _exitAnimationController,
                    animationInterval: orderedDishesListAnimationInterval,
                    animationDuration: orderedDishesListAnimationDuration,
                  ),
                  Positioned(
                    bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    child: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
                      builder: (context, state) {
                        return AnimatedOrderButton(
                          totalCost: state.totalCost,
                          animationDelay: _calculateAnimatedOrderButtonDelay(state.order.length),
                          orderType: state.orderType,
                          exitAnimationController: _exitAnimationController,
                          onTap: () => _onOrderButton(state),
                          animationDuration: exitAnimationDuration,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    _exitAnimationController.dispose();
    _exitAnimationController.removeStatusListener(_onExitAnimationStatusChange);
    super.dispose();
  }
}
