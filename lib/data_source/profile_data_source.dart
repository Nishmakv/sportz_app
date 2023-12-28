import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/profile_model.dart';
import 'package:sportz_app/utils/shared_preference.dart';
import 'package:sportz_app/utils/url.dart';

class ProfilelDataSource {
  Dio client = Dio();
  SharedPrefs sharedPrefs = SharedPrefs();

  Future<UserProfileModel> getUserProfile() async {
    String token = await sharedPrefs.getToken('userToken');
    UserProfileModel userProfileModel;
    print(token);
    final response = await client.get(
      User.userProfile,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "token $token"
        },
      ),
    );
    print(response.data['abstract']);
    // print('data:${userProfileModel.profile} ');
    userProfileModel = UserProfileModel.fromJson(response.data['abstract']);

    return userProfileModel;
  }
}
