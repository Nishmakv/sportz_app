import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/user_booking_history._data_source.dart';

import '../../model.dart/booking_history_model.dart';

part 'booking_history_event.dart';
part 'booking_history_state.dart';

class BookingHistoryBloc
    extends Bloc<BookingHistoryEvent, BookingHistoryState> {
  BookingHistoryDataSource bookingHistoryDataSource =
      BookingHistoryDataSource();
  BookingHistoryBloc() : super(BookingHistoryInitial());
  @override
  Stream<BookingHistoryState> mapEventToState(
      BookingHistoryEvent event) async* {
    if (event is BookingHistoryProcess) {
      yield* bookingSuccess();
    }
  }
   Stream<BookingHistoryState> bookingSuccess() async* {
    yield BookingHistoryLoading();
    try {
      final dataResponse = await bookingHistoryDataSource.getBookingHistory();
      if (dataResponse.isNotEmpty) {
        yield BookingHistorySuccess(bookingHistoryModel: dataResponse);
      } else {
        yield BookingHistoryFailure();
      }
    } catch (e) {
      print(e);
      yield BookingHistoryFailure();
    }
  }
}
