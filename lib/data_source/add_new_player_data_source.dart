import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportz_app/utils/shared_preference.dart';

class AddNewPlayerDataSource {
  Dio client = Dio();
  XFile? image;
  SharedPrefs prefs = SharedPrefs();

  Future<List> addNewPlayer(
      {required String? playerName,
      required String? playerPosition,
      required File? playerPic,
      required String? playerSkill}) async {
    String fileName = playerPic!.path.split('/').last;
    String userId = await prefs.getUserId('user_id');

    print(playerName);
    FormData formData = FormData.fromMap({
      "player_name": playerName,
      "player_position": playerPosition,
      "player_pic":
          await MultipartFile.fromFile(image!.path, filename: fileName),
      "player_skill": playerSkill,
      "id":userId,
    });

    final response = await client.post(
      'http://192.168.1.25:9000/user/player/',
      // data: formData,
      data: {
         "player_name": playerName,
      "player_position": playerPosition,
      "player_pic":
          null,
      "player_skill": playerSkill,
      "id":userId,

      },
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    print(response);
    if (response.data['status'] == 'success') {
      return ['response'];
    } else {
      return [];
    }
  }
}
