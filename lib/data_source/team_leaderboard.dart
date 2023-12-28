import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/team_leaderboard.dart';

class TeamLeaderboardDataSource {
  Dio client = Dio();

  Future<List<TeamLeaderboard>> getTeamLeaderboard() async {
    List<TeamLeaderboard> teamLeaderboardModel = [];
    final response = await client.get(
      'http://13.126.57.93:8000/admin_app/leader_board/',
      options: Options(
        validateStatus: (status) => true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    // print(userTurfModel);
    print(response);
    (response.data['message'] as List).forEach((element) {
      teamLeaderboardModel.add(TeamLeaderboard.fromJson(element));
      print(element);
    });

    return teamLeaderboardModel;
  }
}
