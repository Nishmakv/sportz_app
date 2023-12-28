import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/player_leaderboard.dart';
import 'package:sportz_app/model.dart/player_leaderboard.dart';

part 'player_leaderboard_event.dart';
part 'player_leaderboard_state.dart';

class PlayerLeaderboardBloc
    extends Bloc<PlayerLeaderboardEvent, PlayerLeaderboardState> {
  PlayerLeaderboardDataSource playerLeaderboard = PlayerLeaderboardDataSource();
  PlayerLeaderboardBloc() : super(PlayerLeaderboardInitial());
   @override
  Stream<PlayerLeaderboardState> mapEventToState(PlayerLeaderboardEvent event) async* {
    if (event is PlayerLeaderboardProcess) {
      yield* playerLeaderboardSuccess();
    }
  }
  Stream<PlayerLeaderboardState> playerLeaderboardSuccess() async* {
    yield PlayerLeaderboardLoading();
    try {
      final dataResponse = await playerLeaderboard.getPlayerLeaderboard();
      if (dataResponse.isNotEmpty) {
        yield PlayerLeaderboardSuccess(playerLeaderboardModel: dataResponse);
      } else {
        yield PlayerLeaderboardFailure();
      }
    } catch (e) {
      print(e);
      yield PlayerLeaderboardFailure();
    }
  }
}
