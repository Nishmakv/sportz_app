import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/user_turf_model.dart';

class GetUserTurfDataSource {
  Dio client = Dio();

  Future<List<UserTurfModel>> getUserTurf({
    required double? longitude,
    required double? latitude,
  }) async {
    List<UserTurfModel> userTurfModel = [];
    final response = await client.get(
      'http://13.126.57.93:8000/admin_app/user_location_fetch/?longitude=$longitude&latitude=$latitude',
      options: Options(
        validateStatus: (status) => true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
   
  
    (response.data['message'] as List).forEach((element) {
      userTurfModel.add(UserTurfModel.fromJson(element));
   
    });

    return userTurfModel;
  }
}
