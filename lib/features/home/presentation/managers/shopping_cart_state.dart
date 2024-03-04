part of 'shopping_cart_cubit.dart';

typedef Quantity = int;

enum OrderType {
  delivery,
  table;

  bool get isDelivery => this == OrderType.delivery;

  bool get isTable => this == OrderType.table;
}

class ShoppingCartState extends Equatable {
  final Map<DishEntity, Quantity> order;

  final OrderType orderType;

  double get totalCost =>
      order.entries.fold<double>(0, (previousValue, element) => previousValue + element.key.price * element.value);

  int get totalOrderedItems => order.values.fold(0, (prev, element) => prev + element);

  const ShoppingCartState({
    required this.order,
    this.orderType = OrderType.delivery,
  });

  ShoppingCartState copyWith({
    Map<DishEntity, Quantity>? order,
    OrderType? orderType,
  }) {
    return ShoppingCartState(
      order: order ?? this.order,
      orderType: orderType ?? this.orderType,
    );
  }

  @override
  List<Object> get props => [order, orderType];
}
