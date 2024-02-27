import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/category.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/managers/dishes_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/widgets/animated_app_bar.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/widgets/animated_category_list.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/widgets/dish_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final DishesCubit dishesCubit = DishesCubit();

  final scrollController = ScrollController();

  double get cardDishWidth => MediaQuery.of(context).size.width * 2 / 3;

  static const double paddingBetweenCards = 20;

  @override
  void initState() {
    super.initState();
    dishesCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: dishesCubit,
      child: SafeArea(
        child: Column(
          children: [
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AnimatedAppBar(
                appBarPlayDuration: 800.ms,
              ),
            ),
            BlocBuilder<DishesCubit, DishesState>(
              bloc: dishesCubit,
              builder: (context, state) {
                return AnimatedCategoryList(
                  categories: state.categories,
                  categoryListDelayDuration: 100.ms,
                  categoryListPlayDuration: 750.ms,
                  pickedCategory: state.currentCategory ?? const CategoryEntity('All'),
                  onCategoryPicked: (category) {
                    dishesCubit.setCategory(category);
                  },
                );
              },
            ),
            const Gap(16),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                child: BlocConsumer<DishesCubit, DishesState>(
                  bloc: dishesCubit,
                  listenWhen: (previous, current) => previous.currentCategory != current.currentCategory,
                  listener: (context, state) {
                    final index = state.dishes.indexWhere((dish) => dish.category == state.currentCategory);
                    scrollController.animateTo(
                      index * (cardDishWidth + paddingBetweenCards),
                      duration: 500.ms,
                      curve: Curves.easeInOut,
                    );
                  },
                  builder: (context, state) {
                    return Row(
                      children: List.generate(
                        state.dishes.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: paddingBetweenCards),
                            child: DishCard(
                              dish: state.dishes[index],
                              scrollController: scrollController,
                              cardDishWidth: cardDishWidth,
                            ),
                          );
                        },
                      )
                          .animate(
                            delay: 1500.ms,
                            interval: 250.ms,
                          )
                          .fadeIn(duration: 700.ms)
                          .slideX(
                            begin: 0.05,
                            end: 0,
                            duration: 700.ms,
                          ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
