part of 'get_players_bloc.dart';

sealed class GetPlayersState extends Equatable {
  const GetPlayersState();
  
  @override
  List<Object> get props => [];
}

final class GetPlayersInitial extends GetPlayersState {}
final class GetPlayersLoading extends GetPlayersState {}
final class GetPlayersSuccess extends GetPlayersState {
   List<RegisterTeamViewModel> registerTeamView = [];
  GetPlayersSuccess({ required this.registerTeamView});
}
final class GetPlayersFailure extends GetPlayersState {}
