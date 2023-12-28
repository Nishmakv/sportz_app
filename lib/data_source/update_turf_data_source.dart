import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sportz_app/utils/url.dart';

class UpdateTurfDataSource {
  Dio turf = Dio();

  Future<List> updateTurf({
    required int?id,
    required double? longitude,
    required double? latitude,
    required String? name,
    required File? image,
    required String? price,
    required List? amenities,
    required String? description,
  }) async {
    try {
      String fileName = image!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "id":id,
        "longitude": 75,
        "latitude": 75,
        "name": name,
        "image": await MultipartFile.fromFile(image.path, filename: fileName),
        "price": price,
        "amenities": amenities,
        "description": description,
        'location': 'koxhikode',  
        "owner": "nishma"
      });
      final response = await turf.patch(
        TurfOwner.turfUrl,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
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
