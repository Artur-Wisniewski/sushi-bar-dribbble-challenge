part of 'dishes_cubit.dart';

class DishesState extends Equatable {
  const DishesState({required this.dishes, this.currentCategory, this.categories = const []});

  final List<DishEntity> dishes;
  final CategoryEntity? currentCategory;
  final List<CategoryEntity> categories;

  DishesState copyWith({
    List<DishEntity>? dishes,
    CategoryEntity? currentCategory,
    List<CategoryEntity>? categories,
  }) {
    return DishesState(
      dishes: dishes ?? this.dishes,
      currentCategory: currentCategory ?? this.currentCategory,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [dishes, currentCategory, categories];
}
