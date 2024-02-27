import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/dish.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/manager/shopping_cart_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/widgets/count_picker.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DishCard extends StatelessWidget {
  DishCard({super.key, required this.dish, required this.scrollController});

  final DishEntity dish;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: MediaQuery.of(context).size.width * 2 / 3,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                SizedBox(
                  height: constraints.maxHeight * 0.45,
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Positioned(
                        right: -50,
                        child: AnimatedBuilder(
                          animation: scrollController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: scrollController.offset / 400,
                              child: child,
                            );
                          },
                          child: Image.asset(
                            dish.imagePath,
                            fit: BoxFit.contain,
                            height: constraints.maxHeight * 0.45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(56), // TODO - replace with a better solution
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: dish.isNew
                      ? Badge(label: Text(L10n.current.aNew))
                      : const SizedBox(
                          height: 32,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    dish.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
                builder: (BuildContext context, ShoppingCartState state) {
                  return CountPicker(
                    counter: state.order[dish] ?? 0,
                    price: dish.price,
                    onAdd: () => BlocProvider.of<ShoppingCartCubit>(context).addDish(dish),
                    onRemove: () => BlocProvider.of<ShoppingCartCubit>(context).removeDish(dish),
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
