import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/get_turf_by_id.dart';
import 'package:sportz_app/utils/url.dart';

class GetOneTurfDataSource {
  Dio client = Dio();

  Future<List<UserTurfByIdModel>> getOneTurf({required int? id}) async {
    List<UserTurfByIdModel> userTurfByIdModel = [];
    final response = await client.get(
      User.getTurfById + id.toString() + '/',
      options: Options(
        validateStatus: (status) => true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    // print(userTurfModel);
    print(response);
    (response.data as List).forEach((element) {
      userTurfByIdModel.add(UserTurfByIdModel.fromJson(element));
      print(element);
    });

    return userTurfByIdModel;
  }
}
