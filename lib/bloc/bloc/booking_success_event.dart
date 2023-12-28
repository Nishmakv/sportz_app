part of 'booking_success_bloc.dart';

sealed class BookingSuccessEvent extends Equatable {
  const BookingSuccessEvent();

  @override
  List<Object> get props => [];
}

class BookingSuccessProcess extends BookingSuccessEvent {
  final int id;
  final String startTime;
  final String date;
  final String endTime;
  final double price;

  const BookingSuccessProcess({
    required this.id,
    required this.startTime,
    required this.date,
    required this.endTime,
    required this.price,
  });
}
