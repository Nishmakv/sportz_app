import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/turf_booking_data_source.dart';
import 'package:sportz_app/model.dart/discount_price_model.dart';

part 'turf_book_event.dart';
part 'turf_book_state.dart';

class TurfBookBloc extends Bloc<TurfBookEvent, TurfBookState> {
  TurfBookingDataSource turfBooking = TurfBookingDataSource();
  TurfBookBloc() : super(TurfBookInitial());
  @override
  Stream<TurfBookState> mapEventToState(TurfBookEvent event) async* {
    if (event is TurfBookProcess) {
      yield* turfBookingSuccess(
          event.startTime, event.date, event.endTime, event.price);
    }
  }

  Stream<TurfBookState> turfBookingSuccess(
      String? startTime, String date, String endTime, double? price) async* {
    yield TurfBookLoading();
    final dataResponse = await turfBooking.turfBooking(
      startTime: startTime!,
      endTime: endTime,
      price: price!,
      date: date,
    );
    print('dataResponse 11111${dataResponse}');
    if (dataResponse.price != 0) {
      print("aaaaaaa");
      yield TurfBookSuccess(discountPriceModel: dataResponse);
    } else {
      yield TurfBookFailure();
    }
  }
}
