import 'package:dribbble_sushi_bar_challenge/core/widgets/count_picker.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/dish.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderedDishCard extends StatelessWidget {
  const OrderedDishCard({super.key, required this.dish, required this.quantity});

  final DishEntity dish;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
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
                  borderRadius: BorderRadius.circular(500),
                  boxShadow: kElevationToShadow[4],
                ),
                child: Image.asset(
                  dish.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Gap(24),
          Flexible(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(dish.name, style: Theme.of(context).textTheme.titleMedium),
                const Gap(8),
                Row(
                  // runSpacing: 8,
                  // alignment: WrapAlignment.spaceBetween,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        '\$${(dish.price * quantity).ceil().toString()}',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                            ),
                      ),
                    ),
                    CountPicker.small(
                      key: ValueKey<int>(quantity),
                      counter: quantity,
                      onAdd: () {},
                      onRemove: () {
                        // if lower than 1, remove card item
                      },
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
