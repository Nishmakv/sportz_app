import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sportz_app/utils/shared_preference.dart';

class UpdateProfileDataSource {
  Dio turf = Dio();
  SharedPrefs prefs = SharedPrefs();

  Future<List> editProfile({
    required String? name,
    File? image,
    required String? phoneNumber,
    required String? email,
  }) async {
    try {
      print(name);
      print(image);
      print(phoneNumber);
      print(email);

      String token = await prefs.getToken('userToken');
      print(token);
      String fileName = image!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "abstract": {
          "phone_no": phoneNumber,
          "email": email,
        },
        "profile": {
          "profile_name": name,
          "profile_pic": null,
        }
      });
      final response = await turf.put(
        'http://13.126.57.93:8000/user/profile/',
        // data:
        // formData,
        data: {
          "abstract": {
            "email": email,
            "phone_no": phoneNumber
          },
          "profile": {"profile_name": name, "profile_pic": null}
        },
        options: Options(
          headers: {
            // 'Content-Type': 'multipart/form-data',
            'Content-Type': 'application/json',
            "Accept": "application/json",
            "Authorization": "token $token"
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
