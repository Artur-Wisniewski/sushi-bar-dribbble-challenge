part of 'book_table_cubit.dart';



class BookTableState extends Equatable {
  final int numberOfGuests;
  final String day;
  final String time;

  const BookTableState({required this.numberOfGuests, required this.day, required this.time});

  BookTableState copyWith({
    int? numberOfGuests,
    String? day,
    String? time,
  }) {
    return BookTableState(
      numberOfGuests: numberOfGuests ?? this.numberOfGuests,
      day: day ?? this.day,
      time: time ?? this.time,
    );
  }

  @override
  List<Object> get props => [numberOfGuests, day, time];
}
