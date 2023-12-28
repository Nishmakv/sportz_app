import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/booking_history_model.dart';
import 'package:sportz_app/utils/shared_preference.dart';

class BookingHistoryDataSource {
  Dio client = Dio();

  Future<List<BookingHistoryModel>> getBookingHistory() async {
    List<BookingHistoryModel> bookingHistoryModel = [];
    SharedPrefs prefs = SharedPrefs();
    String token = await prefs.getToken('userToken');

    final response = await client.get(
      'http://13.126.57.93:8000/user/booking-history/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'token $token'
        },
      ),
    );
    print(response);
    (response.data as List).forEach((element) {
      bookingHistoryModel.add(BookingHistoryModel.fromJson(element));

      //  print(element);
    });

    return bookingHistoryModel;
  }
}
