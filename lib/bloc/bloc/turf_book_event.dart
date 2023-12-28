part of 'turf_book_bloc.dart';

sealed class TurfBookEvent extends Equatable {
  const TurfBookEvent();

  @override
  List<Object> get props => [];
}

class TurfBookProcess extends TurfBookEvent {
  final String startTime;
  final String date;
  final String endTime;
  final double price;
  const TurfBookProcess({
    required this.startTime,
    required this.date,
    required this.endTime,
    required this.price,
  });
}
