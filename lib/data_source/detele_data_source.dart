import 'package:dio/dio.dart';
import 'package:sportz_app/utils/url.dart';

class DeleteTurfDataSource {
  Dio client = Dio();

  Future<List> deleteTurf({required int? id}) async {
    try {
      final response = await client.delete(
        TurfOwner.turfDeleteUrl + id.toString() + '/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      print("Response Data: ${response}");

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
