import 'package:bloc/bloc.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/data/dishes_data_source.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/category.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/dish.dart';
import 'package:equatable/equatable.dart';

part 'dishes_state.dart';

class DishesCubit extends Cubit<DishesState> {
  DishesCubit() : super(const DishesState(dishes: []));

  void init() {
    _loadDishes();
    _setCategories();
  }

  void _loadDishes() {
    emit(state.copyWith(dishes: DishesDataSource.getDishes()));
  }

  void _setCategories() {
    final categories = state.dishes.map((dish) => dish.category).toSet().toList()
      ..insert(0, const CategoryEntity('All'));
    emit(state.copyWith(
      currentCategory: categories.first,
      categories: categories,
    ));
    print('Categories: $categories');
  }

  void setCategory(CategoryEntity category) {
    emit(state.copyWith(currentCategory: category));
  }
}
