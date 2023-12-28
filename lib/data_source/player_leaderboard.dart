import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/player_leaderboard.dart';

class PlayerLeaderboardDataSource {
  Dio client = Dio();

  Future<List<PlayerLeaderBoard>> getPlayerLeaderboard() async {
    List<PlayerLeaderBoard> playerLeaderboardModel = [];
    final response = await client.get(
      'http://13.126.57.93:8000/admin_app/player_leaderboard/',
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
      playerLeaderboardModel.add(PlayerLeaderBoard.fromJson(element));
      print(element);
    });

    return playerLeaderboardModel;
  }
}
