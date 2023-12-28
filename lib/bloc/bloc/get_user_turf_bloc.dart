import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/user_turf_get_data_source.dart';
import 'package:sportz_app/model.dart/user_turf_model.dart';

part 'get_user_turf_event.dart';
part 'get_user_turf_state.dart';

class GetUserTurfBloc extends Bloc<GetUserTurfEvent, GetUserTurfState> {
  GetUserTurfDataSource getUserTurf = GetUserTurfDataSource();
  GetUserTurfBloc() : super(GetUserTurfInitial());
  @override
  Stream<GetUserTurfState> mapEventToState(GetUserTurfEvent event) async* {
    if (event is GetUserTurfProcess) {
      yield* getUserTurfSuccess(event.longitude,event.latitude);
    }
  }
   Stream<GetUserTurfState> getUserTurfSuccess(
    double?longitude,
    double?latitude,
   ) async* {
    yield GetUserTurfLoading();
    try {
      final dataResponse = await getUserTurf.getUserTurf(
       longitude:longitude,
       latitude: latitude
      );
      if (dataResponse.isNotEmpty) {
        yield GetUserTurfSuccess(userTurfModel: dataResponse);
      } else {
        yield GetUserTurfFailure();
      }
    } catch (e) {
      print(e);
      yield GetUserTurfFailure();
    }
  }


}
