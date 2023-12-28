part of 'booking_success_bloc.dart';

sealed class BookingSuccessState extends Equatable {
  const BookingSuccessState();
  
  @override
  List<Object> get props => [];
}

final class BookingSuccessInitial extends BookingSuccessState {}
final class BookingSuccessLoading extends BookingSuccessState {}
final class BookingSuccessSuccess extends BookingSuccessState {}
final class BookingSuccessFailure extends BookingSuccessState {}
