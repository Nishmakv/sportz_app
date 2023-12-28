part of 'match_invitation_bloc.dart';

sealed class MatchInvitationEvent extends Equatable {
  const MatchInvitationEvent();

  @override
  List<Object> get props => [];
}

class MatchInvitationProcess extends MatchInvitationEvent {
  int? senderTeamId;
  int? receiverTeamId;
   MatchInvitationProcess(
      {required this.senderTeamId, required this.receiverTeamId});
}
