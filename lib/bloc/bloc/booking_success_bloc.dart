import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/booking_success_data_source.dart';

part 'booking_success_event.dart';
part 'booking_success_state.dart';

class BookingSuccessBloc
    extends Bloc<BookingSuccessEvent, BookingSuccessState> {
  BookingSuccessDataSource bookingSuccess = BookingSuccessDataSource();
  BookingSuccessBloc() : super(BookingSuccessInitial());
  @override
  Stream<BookingSuccessState> mapEventToState(
      BookingSuccessEvent event) async* {
    if (event is BookingSuccessProcess) {
      yield* userBookingSuccess(
          event.startTime, event.date, event.endTime, event.price, event.id);
    }
  }

  Stream<BookingSuccessState> userBookingSuccess(String? startTime, String date,
      String endTime, double? price, int id) async* {
    yield BookingSuccessLoading();
    final dataResponse = await bookingSuccess.bookigSuccess(
      startTime: startTime!,
      endTime: endTime,
      price: price!,
      date: date,
      id: id,
    );
    print('dataResponse ${dataResponse}');
    if (dataResponse.isNotEmpty) {
      yield BookingSuccessSuccess();
    } else {
      yield BookingSuccessFailure();
    }
  }
}
