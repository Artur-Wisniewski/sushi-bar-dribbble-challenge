import 'package:dribbble_sushi_bar_challenge/core/constants/gaps.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/features/bottom_navigation/presentation/manager/bottom_bar_navigation_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/category.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/managers/dishes_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/widgets/animated_app_bar.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/widgets/animated_category_list/animated_category_list.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/widgets/dish_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  // TODO add more responsive UI

  final DishesCubit dishesCubit = DishesCubit();

  late final AnimationController animationOutController;
  late final AnimationController appBarAnimationController;

  final scrollController = ScrollController();

  double get cardDishWidth => MediaQuery.of(context).size.width * 2 / 3;

  double get paddingBetweenCards => Paddings.medium;

  Duration get appBarAnimationDuration => 750.ms;

  Duration get categoryAnimationDelay => 100.ms;

  Duration get categoryAnimationDuration => 750.ms;

  Duration get scrollAnimationDuration => 500.ms;

  Duration get dishCardAnimationDuration => 700.ms;

  Duration get dishCardAnimationInterval => 250.ms;

  Duration get dishCardAnimationDelay => categoryAnimationDelay + categoryAnimationDuration - 100.ms;

  Duration get exitAnimationDuration => 750.ms;

  @override
  void initState() {
    super.initState();
    animationOutController = AnimationController(vsync: this);
    appBarAnimationController = AnimationController(
      vsync: this,
      duration: appBarAnimationDuration,
    );
    appBarAnimationController.forward();
    dishesCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BottomBarNavigationCubit, BottomBarNavigationState>(
      listener: (context, state) {
        if (state.currentItem != BottomBarItems.home) {
          animationOutController.reverse();
          appBarAnimationController.reverse();
        }
      },
      child: BlocProvider.value(
        value: dishesCubit,
        child: SafeArea(
          child: Column(
            children: [
              Gaps.medium,
              Padding(
                padding: Paddings.mediumHorizontal,
                child: AnimatedAppBar(
                  appBarPlayDuration: appBarAnimationDuration,
                  appBarAnimationController: appBarAnimationController,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    BlocBuilder<DishesCubit, DishesState>(
                      bloc: dishesCubit,
                      builder: (context, state) {
                        return AnimatedCategoryList(
                          categories: state.categories,
                          categoryListDelayDuration: categoryAnimationDelay,
                          categoryListPlayDuration: categoryAnimationDuration,
                          pickedCategory: state.currentCategory ?? const CategoryEntity('All'),
                          onCategoryPicked: (category) => dishesCubit.setCategory(category),
                        );
                      },
                    ),
                    Gaps.medium,
                    Expanded(
                      child: LayoutBuilder(builder: (context, constraints) {
                        final cardDishWidth = constraints.maxHeight / 2.2;
                        return SingleChildScrollView(
                          controller: scrollController,
                          padding: Paddings.mediumHorizontal,
                          scrollDirection: Axis.horizontal,
                          child: BlocConsumer<DishesCubit, DishesState>(
                            bloc: dishesCubit,
                            listenWhen: (previous, current) => previous.currentCategory != current.currentCategory,
                            listener: (context, state) {
                              final index = state.dishes.indexWhere((dish) => dish.category == state.currentCategory);
                              scrollController.animateTo(
                                index * (cardDishWidth + paddingBetweenCards),
                                duration: scrollAnimationDuration,
                                curve: Curves.easeInOut,
                              );
                            },
                            builder: (context, state) {
                              return Row(
                                children: List.generate(
                                  state.dishes.length,
                                  (index) {
                                    return Padding(
                                      padding: Paddings.mediumRight,
                                      child: DishCard(
                                        dish: state.dishes[index],
                                        scrollController: scrollController,
                                        cardDishWidth: cardDishWidth,
                                      ),
                                    );
                                  },
                                )
                                    .animate(
                                      delay: dishCardAnimationDelay,
                                      interval: dishCardAnimationInterval,
                                    )
                                    .fadeIn(
                                      duration: dishCardAnimationDuration,
                                    )
                                    .slideX(
                                      begin: 0.05,
                                      end: 0,
                                      duration: dishCardAnimationDuration,
                                    ),
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              )
                  .animate(
                    controller: animationOutController,
                  )
                  .fadeIn(
                    duration: exitAnimationDuration,
                  )
                  .slideY(
                    begin: -0.02,
                    end: 0,
                    duration: exitAnimationDuration,
                  ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationOutController.dispose();
    appBarAnimationController.dispose();
    scrollController.dispose();
    dishesCubit.close();
    super.dispose();
  }
}
