import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/player_invitation_data_source.dart';

part 'invite_players_event.dart';
part 'invite_players_state.dart';

class InvitePlayersBloc extends Bloc<InvitePlayersEvent, InvitePlayersState> {
  PlayerInvitationDataSource playerInvitationDataSource =
      PlayerInvitationDataSource();
  InvitePlayersBloc() : super(InvitePlayersInitial());
   @override
  Stream<InvitePlayersState> mapEventToState(
      InvitePlayersEvent event) async* {
    if (event is InvitePlayersProcess) {
      yield* invitePlayer(
      event.teamId,event.playerId
      );
    }
  }
   Stream<InvitePlayersState> invitePlayer(int?teamId,int?playerId) async* {
    yield InvitePlayersLoading();
    try {
      final dataResponse = await playerInvitationDataSource.playerInvitation(teamId: teamId!,playerId: playerId! );
      if (dataResponse.isNotEmpty) {
        yield InvitePlayersSuccess();
      } else {
        yield InvitePlayersFailure();
      }
    } catch (e) {
      print(e);
      yield InvitePlayersFailure();
    }
  }
  
}
