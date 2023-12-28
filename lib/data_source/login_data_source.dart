import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/user_type_model.dart';
import 'package:sportz_app/utils/shared_preference.dart';
import 'package:sportz_app/utils/url.dart';

class LoginDataSource {
  Dio client = Dio();
  SharedPrefs prefs = SharedPrefs(); 

  Future<UserTypeModel> userLogin({
    required String? username,
    required String? password,
  }) async {
    UserTypeModel userTypeModel;
    print(username);
    print(password);
    final response = await client.post(
      LoginUrl.loginUrl,
      data: {
        "username": username,
        "password": password,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    print(response.data['token']);

    userTypeModel = UserTypeModel.fromJson(response.data);
    if (response.data['user_type'] == 'owner'){
      prefs.saveToken('ownerToken', 'token');
    } else {
      prefs.saveToken(
        'userToken',
        response.data['token'],
      );
    }
    prefs.saveToken(
      'userType',
      response.data['user_type'],
    );
    prefs.saveUserId(
      'userId',
      response.data['user_id'],
    );

    return userTypeModel;
  }
}
