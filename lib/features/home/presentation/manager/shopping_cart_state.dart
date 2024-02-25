part of 'shopping_cart_cubit.dart';

typedef Quantity = int;

class ShoppingCartState extends Equatable {
  final Map<DishEntity, Quantity> order;

  const ShoppingCartState({required this.order});

  @override
  List<Object> get props => [order];
}
