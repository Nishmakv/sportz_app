import 'package:dio/dio.dart';
import 'package:sportz_app/utils/url.dart';

class UserForgotPasswordDataSource {
  Dio client = Dio();

  Future<List> userForgotPassword({

    required String? email,
   
  }) async {
    try {
      final response = await client.post(
       'https://f950-116-68-110-250.ngrok-free.app/forgot-pass/',
        data: {
         
            "email": email,
          
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
