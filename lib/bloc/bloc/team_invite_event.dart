part of 'team_invite_bloc.dart';

sealed class TeamInviteEvent extends Equatable {
  const TeamInviteEvent();

  @override
  List<Object> get props => [];
}
class TeamInvitationProcess extends TeamInviteEvent {
  int? senderTeamId;
  int? receiverTeamId;
   TeamInvitationProcess(
      {required this.senderTeamId, required this.receiverTeamId});
}

