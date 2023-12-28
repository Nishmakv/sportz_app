import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/register_team_view_data_source.dart';

import 'package:sportz_app/model.dart/register_team_view.dart';

part 'get_players_event.dart';
part 'get_players_state.dart';

class GetPlayersBloc extends Bloc<GetPlayersEvent, GetPlayersState> {
  RegisterTeamViewDataSource getPlayers = RegisterTeamViewDataSource();
  GetPlayersBloc() : super(GetPlayersInitial());
  Stream<GetPlayersState> mapEventToState(GetPlayersEvent event) async* {
    if (event is GetPlayersProcess) {
      yield* getPlayersSuccess();
    }
  }

  Stream<GetPlayersState> getPlayersSuccess() async* {
    yield GetPlayersLoading();
    try {
      final dataResponse = await getPlayers.getPlayers();
      if (dataResponse.isNotEmpty) {
        yield GetPlayersSuccess(registerTeamView: dataResponse);
      } else {
        yield GetPlayersFailure();
      }
    } catch (e) {
      print(e);
      yield GetPlayersFailure();
    }
  }
}
