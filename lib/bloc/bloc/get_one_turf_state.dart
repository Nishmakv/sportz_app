part of 'get_one_turf_bloc.dart';

sealed class GetOneTurfState extends Equatable {
  const GetOneTurfState();

  @override
  List<Object> get props => [];
}

final class GetOneTurfInitial extends GetOneTurfState {}

final class GetOneTurfLoading extends GetOneTurfState {}

final class GetOneTurfSuccess extends GetOneTurfState {
 List< UserTurfByIdModel> userTurfByIdModel;
  GetOneTurfSuccess({required this.userTurfByIdModel});
}

final class GetOneTurfFailure extends GetOneTurfState {}
