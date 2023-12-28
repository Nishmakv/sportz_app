import 'package:dio/dio.dart';
import 'package:sportz_app/utils/shared_preference.dart';
import 'package:sportz_app/utils/url.dart';

class BookingSuccessDataSource {
  Dio client = Dio();
  SharedPrefs sharedPrefs = SharedPrefs();

  Future<List> bookigSuccess({
    required int id,
    required String date,
    required String startTime,
    required String endTime,
    required double price,
  }) async {
    try {
      String token = await sharedPrefs.getToken('userToken');
      int userId = await sharedPrefs.getUserId('user_id');
      print(date);
      print(startTime);
      print(price);
      print(endTime);
      print("endTime${User.bookingSuccess + id.toString() + '/'}");
      print("tttt${token}");
      final response = await client.post(
        // ignore: prefer_interpolation_to_compose_strings
        User.bookingSuccess + id.toString() + '/',

        data: {
          "date": date,
          "start_time": startTime,
          "end_time": endTime,
          "price": price,
          "Payment_type": "Offline_payment",
        },

        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authosization': "token $token"
          },
        ),
      );

      // print("Response Data: ${response}");
      print(response);
      if (response.data['status'] == 'success') {
        return response.data['status'];
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
