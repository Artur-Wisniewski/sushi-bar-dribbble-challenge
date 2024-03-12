import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'book_table_state.dart';

class BookTableCubit extends Cubit<BookTableState> {
  BookTableCubit() : super(const BookTableState(numberOfGuests: 1, day: '1 dec', time: '12 PM'));

  void incrementNumberOfGuests() {
    emit(state.copyWith(numberOfGuests: state.numberOfGuests + 1));
  }

  void decrementNumberOfGuests() {
    if (state.numberOfGuests > 1) {
      emit(state.copyWith(numberOfGuests: state.numberOfGuests - 1));
    }
  }

  pickDay(String dayName) {
    emit(state.copyWith(day: dayName));
  }

  pickTime(String time) {
    emit(state.copyWith(time: time));
  }
}
