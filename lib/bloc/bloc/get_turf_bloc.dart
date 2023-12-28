import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/get_turf_data_source.dart';
import 'package:sportz_app/model.dart/turf_model.dart';
part 'get_turf_event.dart';
part 'get_turf_state.dart';

class GetTurfBloc extends Bloc<GetTurfEvent, GetTurfState> {
  GetTurfDataSource user = GetTurfDataSource();

  GetTurfBloc() : super(GetTurfInitial());
  @override
  Stream<GetTurfState> mapEventToState(GetTurfEvent event) async* {
    if (event is GetTurfProcess) {
      yield* getTurfSuccess();
    }
  }

  Stream<GetTurfState> getTurfSuccess() async* {
    yield GetTurfLoading();
    try {
      final dataResponse = await user.getTurf();
      if (dataResponse.isNotEmpty) {
        yield GetTurfSuccess(turfModel: dataResponse);
      } else {
        yield GetTurfFailure();
      }
    } catch (e) {
      print(e);
      yield GetTurfFailure();
    }
  }
}
