part of 'turf_book_bloc.dart';

sealed class TurfBookState extends Equatable {
  const TurfBookState();

  @override
  List<Object> get props => [];
}

final class TurfBookInitial extends TurfBookState {}

final class TurfBookLoading extends TurfBookState {}

// ignore: must_be_immutable
final class TurfBookSuccess extends TurfBookState {
  DiscountPriceModel? discountPriceModel;
  TurfBookSuccess({required this.discountPriceModel});
}

final class TurfBookFailure extends TurfBookState {}
