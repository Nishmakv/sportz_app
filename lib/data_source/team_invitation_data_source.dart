import 'package:dio/dio.dart';
import 'package:sportz_app/utils/url.dart';

class TeamInviteDataSource {
  Dio client = Dio();

  Future<List> teamInvite({
    required String? senderTeam,
    required String? receiverTeam,
  }) async {
    try {
      final response = await client.post(
        'http://13.126.57.93:8000/user/match_invitation/',
        data: {
          {
            "is_accepted": false,
            "sender_team": senderTeam,
            "receiver_team": receiverTeam
          }
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print("Response Data: ${response}");
      if (response.data['status'] == 'success') {
        return ['response'];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
