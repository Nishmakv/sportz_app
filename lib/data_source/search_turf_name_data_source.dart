import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/search_turf_name_model.dart';

class SearchTurfNameDataSource {
  Dio client = Dio();
  List<SearchTurfModel> searchTurfModel = [];

  Future<List<SearchTurfModel>> searchTurf({
    required String? name,
  }) async {
    print(name);
    final response = await client.post(
      'https://05b9-116-68-110-250.ngrok-free.app/turf_search_response/turf_search_response',
      data: [
        {"name": name}
      ],
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    print(response);

    (response.data as List).forEach((element) {
      searchTurfModel.add(SearchTurfModel.fromJson(element));
    });

    return searchTurfModel;
  }
}
