import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/get_each_players_data_source.dart';
import 'package:sportz_app/model.dart/add_players_model.dart';

part 'get_each_player_event.dart';
part 'get_each_player_state.dart';

class GetEachPlayerBloc extends Bloc<GetEachPlayerEvent, GetEachPlayerState> {
  GetEachPlayerDataSource getEachPlayer = GetEachPlayerDataSource();

  GetEachPlayerBloc() : super(GetEachPlayerInitial());
  Stream<GetEachPlayerState> mapEventToState(GetEachPlayerEvent event) async* {
    if (event is GetEachPlayersProcess){
      yield* getEachPlayersSuccess(event.id);
    }
  }
   
  Stream<GetEachPlayerState> getEachPlayersSuccess(int?id) async* {
    yield GetEachPlayerLoading();
    try {
      final dataResponse = await getEachPlayer.getPlayers(id:id);
      if (dataResponse.id!=null) {
        yield GetEachPlayerSuccess(addPlayers: dataResponse);
      } else {
        yield GetEachPlayerFailure();
      }
    } catch (e) {
      print(e);
      yield GetEachPlayerFailure();
    }
  }


}
