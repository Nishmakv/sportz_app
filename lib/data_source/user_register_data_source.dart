import 'package:dio/dio.dart';
import 'package:sportz_app/utils/url.dart';

class UserRegisterDataSource {
  Dio client = Dio();

  Future<List> userRegister({
    required String? username,
    required String? email,
    required String? password,
    required String? phonenumber,
  }) async {
    try {
      final response = await client.post(
        User.userRegisterUrl,
        data: {
          "abstract": {
            "username": username,
            "email": email,
            "password": password,
            "phone_no": phonenumber,
          }
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      // print("Response Data: ${response}");
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
