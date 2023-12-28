import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/add_players_model.dart';
import 'package:sportz_app/utils/url.dart';

class GetEachPlayerDataSource {
  Dio client = Dio();

  Future<AddPlayersModel> getPlayers({required int?id}) async {
    AddPlayersModel addPlayers;

    final response = await client.get(
    User.createTeamUrl+id.toString()+'/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    // print('data:$turfModel');
    addPlayers = AddPlayersModel.fromJson(response.data['data']);

    return addPlayers;
  }
}
