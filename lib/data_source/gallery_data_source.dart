import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sportz_app/utils/shared_preference.dart';
import 'package:sportz_app/utils/url.dart';

class GalleryDataSource {
  Dio turf = Dio();
  SharedPrefs prefs = SharedPrefs();

  Future<List> addImage(
      {required File? image, required String? description}) async {
    try {
      String token = await prefs.getToken('userToken');
      int userId = await prefs.getUserId('userId');
      print("$userId $token $description");
      String fileName = image!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(image.path, filename: fileName),
        "description": description,
        "user": userId,
      });
      final response = await turf.post(
        User.userGallery,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            "Authorization": 'token $token',
          },
        ),
      );

      print(response);
      print(userId);
      if (response.data['status'] == 'success') {
        return ["response.data"];
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
