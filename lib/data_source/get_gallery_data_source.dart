import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/get_gallery_model.dart';
import 'package:sportz_app/utils/shared_preference.dart';
import 'package:sportz_app/utils/url.dart';

class GetGalleryDataSource {
  Dio client = Dio();
  SharedPrefs sharedPrefs = SharedPrefs();

  Future<List<GetGalleryModel>> getGalleryData() async {
    List<GetGalleryModel> getGallery = [];
    String token = await sharedPrefs.getToken('userToken');
    print("dat source");
    final response = await client.get(
      User.userGetGalleryUrl,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'token 5f6dd5f36861518402a6e924ba54f953659b302b',
        },
      ),
    );
    print(response);
    // print('data:$turfModel');
    (response.data['data'] as List).forEach((element) {
      getGallery.add(GetGalleryModel.fromJson(element));
      //  print(element);
    });

    return getGallery;
  }
}
