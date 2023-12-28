import 'package:dio/dio.dart';
import 'package:sportz_app/model.dart/discount_price_model.dart';

class TurfBookingDataSource {
  Dio client = Dio();
  DiscountPriceModel? discountPriceModel;
  Future<DiscountPriceModel> turfBooking({
    required String date,
    required String startTime,
    required String endTime,
    required double price,
  }) async {
    print(startTime);
    final response = await client.post(
      'https://05b9-116-68-110-250.ngrok-free.app/dynamic_discount/dynamic_discount',
      data: {
        // 'user': 1,
        'start_time': startTime,
        'date': date,
        'end_time': endTime,
        'price': price.toInt()
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    print(response);
    discountPriceModel = DiscountPriceModel.fromJson(response.data['data']);
    print(discountPriceModel?.startTime);
    print(discountPriceModel?.price);
    print(discountPriceModel?.discountAmount);
    return discountPriceModel!;
  }
}
