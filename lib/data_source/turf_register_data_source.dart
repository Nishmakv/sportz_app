import 'package:dio/dio.dart';
import 'package:sportz_app/utils/url.dart';

class RegisterDataSource {
  Dio client = Dio();

  Future<List> turfOwnerRegister({
    required String? organizationname,
    required String? username,
    required String? email,
    required String? password,
    required String? phonenumber,
  }) async {
    try {
      final response = await client.post(
        RegisterUrl.registerUrl,
        data: {
          "abstract": {
            "username": username,
            "email": email,
            "password": password,
            "phone_no": phonenumber,
            "usertype": "owner"
          },
          "Organization_name": organizationname,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print("Response Data: ${response}");
      if (response.data['status']=='success') {
        // if(response.data['token']!=null){
        return ['response'];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
