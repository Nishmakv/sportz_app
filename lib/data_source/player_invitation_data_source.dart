import 'package:dio/dio.dart';
import 'package:sportz_app/utils/url.dart';

class PlayerInvitationDataSource {
  Dio client = Dio();

  Future<List> playerInvitation({
    required int teamId,
    required int playerId,
  }) async {
    try {
      final response = await client.post(
        'http://13.126.57.93:8000/user/player_invitation/',
        data: {
          "is_accepted": false,
          "team": teamId,
          "player": playerId,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      // print("Response Data: ${response}");-
      print(response);
      if (response.data['status'] == 'success') {
        return ['response'];
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
