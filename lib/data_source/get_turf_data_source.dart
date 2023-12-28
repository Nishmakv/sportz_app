import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/turf_model.dart';
import 'package:sportz_app/utils/url.dart';

class GetTurfDataSource {
  Dio client = Dio();

  Future<List<TurfModel>>getTurf() async {
    List<TurfModel> turfModel = [];

    final response = await client.get(
      TurfOwner.turfGetUrl,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    // print('data:$turfModel');
    (response.data as List).forEach((element) {
      turfModel.add(TurfModel.fromJson(element));
       print(element);
    });
   
  
    return turfModel;
  }
}
