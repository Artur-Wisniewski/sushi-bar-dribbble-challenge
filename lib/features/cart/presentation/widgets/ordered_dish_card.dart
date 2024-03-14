import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/gaps.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/count_picker.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/text_swapper.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/dish.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/managers/shopping_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderedDishCard extends StatelessWidget {
  const OrderedDishCard({super.key, required this.dish, required this.quantity});

  final DishEntity dish;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.mediumAll,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadii.medium,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadii.circular,
                  boxShadow: kElevationToShadow[4],
                ),
                child: Image.asset(
                  dish.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Gaps.big,
          Flexible(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  dish.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Gaps.small,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextSwapper(
                        text: '\$${(dish.price * quantity).ceil().toString()}',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                            ),
                      ),
                    ),
                    CountPicker.small(
                      counter: quantity,
                      onAdd: () => context.read<ShoppingCartCubit>().addDish(dish),
                      onRemove: () => context.read<ShoppingCartCubit>().removeDish(dish),
                      price: dish.price,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
