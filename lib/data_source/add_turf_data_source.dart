import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sportz_app/utils/shared_preference.dart';
import 'package:sportz_app/utils/url.dart';

class AddTurfDataSource {
  Dio turf = Dio();
  SharedPrefs prefs = SharedPrefs();
  int? userId;

  Future<List> addTurf({
    required double? longitude,
    required double? latitude,
    required String? name,
    required File? image,
    required String? price,
    required List? amenities,
    required String? description,
    required String? location,
  }) async {
    try {
      userId = await prefs.getUserId('userId');
      String token = await prefs.getToken('ownerToken');
      String fileName = image!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "longitude": longitude,
        "latitude": latitude,
        "name": name,
        "image": await MultipartFile.fromFile(image.path, filename: fileName),
        "price": price,
        "amenities": amenities,
        "description": description,
        'location': location,
        "owner": "nishma"
      });
      final response = await turf.post(
        TurfOwner.turfUrl + userId.toString() + '/',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            "Authorisation":"token $token"
          },
        ),
      );
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
