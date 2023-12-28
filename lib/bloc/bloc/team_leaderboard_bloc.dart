import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/team_leaderboard.dart';
import 'package:sportz_app/model.dart/team_leaderboard.dart';

part 'team_leaderboard_event.dart';
part 'team_leaderboard_state.dart';

class TeamLeaderboardBloc
    extends Bloc<TeamLeaderboardEvent, TeamLeaderboardState> {
  TeamLeaderboardDataSource teamLeaderboard = TeamLeaderboardDataSource();
  TeamLeaderboardBloc() : super(TeamLeaderboardInitial());
  @override
  Stream<TeamLeaderboardState> mapEventToState(TeamLeaderboardEvent event) async* {
    if (event is TeamLeaderboardProcess) {
      yield* teamLeaderboardSuccess();
    }
  }
  Stream<TeamLeaderboardState> teamLeaderboardSuccess() async* {
    yield TeamLeaderboardLoading();
    try {
      final dataResponse = await teamLeaderboard.getTeamLeaderboard();
      if (dataResponse.isNotEmpty) {
        yield TeamLeaderboardSuccess(teamLeaderboardModel: dataResponse);
      } else {
        yield TeamLeaderboardFailure();
      }
    } catch (e) {
      print(e);
      yield TeamLeaderboardFailure();
    }
  }
}
