import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_bar_navigation_state.dart';

class BottomBarNavigationCubit extends Cubit<BottomBarNavigationState> {
  BottomBarNavigationCubit() : super(const BottomBarNavigationState(BottomBarItems.home));

  void changeItem(BottomBarItems item) {
    emit(BottomBarNavigationState(item));
  }
}
