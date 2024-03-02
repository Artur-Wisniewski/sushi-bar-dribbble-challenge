import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/dish.dart';
import 'package:equatable/equatable.dart';

part 'shopping_cart_state.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  ShoppingCartCubit() : super(const ShoppingCartState(order: {}));

  void addDish(DishEntity dish) {
    final newOrder = Map<DishEntity, int>.from(state.order);
    newOrder.update(dish, (value) => value + 1, ifAbsent: () => 1);
    emit(state.copyWith(order: UnmodifiableMapView(newOrder)));
  }

  void removeDish(DishEntity dish) {
    final newOrder = Map<DishEntity, int>.from(state.order);
    newOrder.update(dish, (value) => value - 1, ifAbsent: () => 0);
    newOrder.removeWhere((key, value) => value <= 0);
    emit(state.copyWith(order: UnmodifiableMapView(newOrder)));
  }

  void changeOrderType(OrderType orderType) {
    emit(state.copyWith(orderType: orderType));
  }
}
