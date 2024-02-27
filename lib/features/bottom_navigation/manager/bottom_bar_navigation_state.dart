part of 'bottom_bar_navigation_cubit.dart';

enum BottomBarItems {
  home,
  other,
  cart,
  profile,
}

class BottomBarNavigationState extends Equatable {
  const BottomBarNavigationState(this.currentItem);

  final BottomBarItems currentItem;

  @override
  List<Object?> get props => [currentItem];
}
