part of 'get_turf_bloc.dart';

sealed class GetTurfState extends Equatable {
  const GetTurfState();

  @override
  List<Object> get props => [];
}

final class GetTurfInitial extends GetTurfState {}

final class GetTurfLoading extends GetTurfState {}

// ignore: must_be_immutable
final class GetTurfSuccess extends GetTurfState {
   List<TurfModel> turfModel = [];
  GetTurfSuccess({ required this.turfModel});
}

final class GetTurfFailure extends GetTurfState {}
