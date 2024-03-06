import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_bar_navigation_state.dart';

class BottomBarNavigationCubit extends Cubit<BottomBarNavigationState> {
  BottomBarNavigationCubit() : super(const BottomBarNavigationState(currentItem: BottomBarItems.home));

  void changeItem(BottomBarItems item) {
    emit(state.copyWith(currentItem: item));
  }

  void markNavigateOutsideShell(bool isNavigatedOutsideShell) {
    emit(state.copyWith(isNavigatedOutsideShell: isNavigatedOutsideShell));
  }
}
