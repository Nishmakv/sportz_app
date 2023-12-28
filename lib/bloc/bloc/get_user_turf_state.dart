part of 'get_user_turf_bloc.dart';

sealed class GetUserTurfState extends Equatable {
  const GetUserTurfState();
  
  @override
  List<Object> get props => [];
}

final class GetUserTurfInitial extends GetUserTurfState {}
final class GetUserTurfLoading extends GetUserTurfState {}
// ignore: must_be_immutable
final class GetUserTurfSuccess extends GetUserTurfState {
  List<UserTurfModel> userTurfModel = [];
  GetUserTurfSuccess({ required this.userTurfModel});
}
final class GetUserTurfFailure extends GetUserTurfState {}
