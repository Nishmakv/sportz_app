part of 'booking_history_bloc.dart';

sealed class BookingHistoryState extends Equatable {
  const BookingHistoryState();

  @override
  List<Object> get props => [];
}

final class BookingHistoryInitial extends BookingHistoryState {}

final class BookingHistoryLoading extends BookingHistoryState {}

final class BookingHistorySuccess extends BookingHistoryState {
  List<BookingHistoryModel> bookingHistoryModel = [];
  BookingHistorySuccess({required this.bookingHistoryModel});
}

final class BookingHistoryFailure extends BookingHistoryState {}
