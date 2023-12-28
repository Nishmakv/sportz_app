import 'package:dio/dio.dart';
import 'package:sportz_app/utils/url.dart';

class MatchInvitationDataSource {
  Dio client = Dio();

  Future<List> matchInvitation({
    required int senderTeamId,
    required int receiverTeamId,
  }) async {
    try {
      final response = await client.post(
        'http://13.126.57.93:8000/user/match_invitation/',
        data: {
          "is_accepted": false,
          "sender_team": senderTeamId,
          "receiver_team": receiverTeamId,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      
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
