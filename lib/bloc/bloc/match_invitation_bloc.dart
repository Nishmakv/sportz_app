import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/match_invitation_data_source.dart';

part 'match_invitation_event.dart';
part 'match_invitation_state.dart';

class MatchInvitationBloc
    extends Bloc<MatchInvitationEvent, MatchInvitationState> {
  MatchInvitationDataSource matchInvitationDataSource =
      MatchInvitationDataSource();
  MatchInvitationBloc() : super(MatchInvitationInitial());
   @override
  Stream<MatchInvitationState> mapEventToState(
      MatchInvitationEvent event) async* {
    if (event is MatchInvitationProcess) {
      yield* inviteTeam(
      event.senderTeamId,event.receiverTeamId
      );
    }
  }
   Stream<MatchInvitationState> inviteTeam(int?senderTeamId,int?receiverTeamId) async* {
    yield MatchInvitationLoading();
    try {
      final dataResponse = await matchInvitationDataSource.matchInvitation(senderTeamId: senderTeamId!,receiverTeamId: receiverTeamId! );
      if (dataResponse.isNotEmpty) {
        yield MatchInvitationSuccess();
      } else {
        yield MatchInvitationFailure();
      }
    } catch (e) {
      print(e);
      yield MatchInvitationFailure();
    }
  }
  
}
