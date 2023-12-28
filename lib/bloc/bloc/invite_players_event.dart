part of 'invite_players_bloc.dart';

sealed class InvitePlayersEvent extends Equatable {
  const InvitePlayersEvent();

  @override
  List<Object> get props => [];
}

class InvitePlayersProcess extends InvitePlayersEvent {
  int? teamId;
  int? playerId;
   InvitePlayersProcess({required this.teamId, required this.playerId});
}
