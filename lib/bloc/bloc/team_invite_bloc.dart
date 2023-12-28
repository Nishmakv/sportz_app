import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/match_invitation_data_source.dart';

part 'team_invite_event.dart';
part 'team_invite_state.dart';

class TeamInviteBloc extends Bloc<TeamInviteEvent, TeamInviteState> {
  MatchInvitationDataSource matchInvitationDataSource =
      MatchInvitationDataSource();
  TeamInviteBloc() : super(TeamInviteInitial());
  @override
  Stream<TeamInviteState> mapEventToState(TeamInviteEvent event) async* {
    if (event is TeamInvitationProcess) {
      yield* inviteTeam(
        event.senderTeamId,
        event.receiverTeamId,
      );
    }
  }

  Stream<TeamInviteState> inviteTeam(
      int? senderTeamId, int? receiverTeamId) async* {
    yield TeamInviteLoading();
    try {
      final dataResponse = await matchInvitationDataSource.matchInvitation(
          senderTeamId: senderTeamId!, receiverTeamId: receiverTeamId!);
      if (dataResponse.isNotEmpty) {
        yield TeamInviteSuccess();
      } else {
        yield TeamInviteFailure();
      }
    } catch (e) {
      print(e);
      yield TeamInviteFailure();
    }
  }
}
