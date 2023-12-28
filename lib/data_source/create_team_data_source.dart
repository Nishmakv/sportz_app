import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/team_id_model.dart';
import 'package:sportz_app/utils/shared_preference.dart';
import 'package:sportz_app/utils/url.dart';

class CreateTeamDataSource {
  Dio turf = Dio();
  SharedPrefs prefs = SharedPrefs();

  Future<TeamById> addTeam({
    required double? longitude,
    required double? latitude,
    required String? name,
    required File? image,
    required String? skill,
    required int? strength,
  }) async {
    TeamById teamById;

    String token = await prefs.getToken('userToken');
    String userId = await prefs.getUserId('user_id');
    final response = await turf.post(
      User.createTeamUrl,
      data: {
        "team_name": name,
        "team_skill": skill,
        "team_pic": null,
        "id": userId,
        "team_strength": strength,
        "team_longitude": longitude,
        "team_latitude": latitude
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'token $token',
        },
      ),
    );
    print(response);

    teamById = TeamById.fromJson(response.data['data']);
    print(teamById);
    return teamById;
  }
}
