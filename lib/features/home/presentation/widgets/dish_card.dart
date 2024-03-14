import 'package:auto_size_text/auto_size_text.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/gaps.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/dish.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/managers/shopping_cart_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/count_picker.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishCard extends StatelessWidget {
  const DishCard({
    super.key,
    required this.dish,
    required this.scrollController,
    required this.cardDishWidth,
  });

  final DishEntity dish;
  final ScrollController scrollController;
  final double cardDishWidth;

  double get rotationAngle => scrollController.offset / 400;

  double get imageRightShift => -cardDishWidth / 4;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: cardDishWidth,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadii.medium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.medium,
                  SizedBox(
                    height: constraints.maxHeight * 0.5,
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Positioned(
                          right: imageRightShift,
                          child: AnimatedBuilder(
                            animation: scrollController,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: rotationAngle,
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
                  Padding(
                    padding: Paddings.mediumHorizontal,
                    child: dish.isNew ? Badge(label: Text(L10n.current.aNew)) : const SizedBox(height: 32),
                  ),
                  Flexible(
                    child: Padding(
                      padding: Paddings.mediumAll,
                      child: AutoSizeText(
                        dish.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: Paddings.mediumAll,
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
