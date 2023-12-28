import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/register_player_list_model.dart';

class RegisterPlayerListDataSource {
  Dio client = Dio();

  Future<List<RegisterPlayerList>> registerPlayer() async {
    List<RegisterPlayerList> registerPlayerList = [];

    final response = await client.get(
      'http://13.126.57.93:8000/user/player/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    // print('data:$turfModel');
    (response.data['data'] as List).forEach((element) {
      registerPlayerList.add(RegisterPlayerList.fromJson(element));
      print(element);
    });

    return registerPlayerList;
  }
}
