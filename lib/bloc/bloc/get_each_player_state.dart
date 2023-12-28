part of 'get_each_player_bloc.dart';

sealed class GetEachPlayerState extends Equatable {
  const GetEachPlayerState();

  @override
  List<Object> get props => [];
}

final class GetEachPlayerInitial extends GetEachPlayerState {}

final class GetEachPlayerLoading extends GetEachPlayerState {}

final class GetEachPlayerSuccess extends GetEachPlayerState {
  AddPlayersModel addPlayers;
  GetEachPlayerSuccess({required this.addPlayers});
}

final class GetEachPlayerFailure extends GetEachPlayerState {}
