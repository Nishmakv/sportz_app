import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/get_one_turf_data_source.dart';
import 'package:sportz_app/model.dart/get_turf_by_id.dart';
part 'get_one_turf_event.dart';
part 'get_one_turf_state.dart';

class GetOneTurfBloc extends Bloc<GetOneTurfEvent, GetOneTurfState> {
  GetOneTurfDataSource getOneTurf = GetOneTurfDataSource();
  GetOneTurfBloc() : super(GetOneTurfInitial());
  @override
  Stream<GetOneTurfState> mapEventToState(GetOneTurfEvent event) async* {
    if (event is GetOneTurfProcess) {
      yield* getOneTurfSuccess(event.id);
    }
  }

  Stream<GetOneTurfState> getOneTurfSuccess(int? id) async* {
    yield GetOneTurfLoading();
    try {
      final dataResponse = await getOneTurf.getOneTurf(id: id);
      if (dataResponse[0].name.isNotEmpty) {
        yield GetOneTurfSuccess(userTurfByIdModel: dataResponse);
      } else {
        yield GetOneTurfFailure();
      }
    } catch (e) {
      print(e);
      yield GetOneTurfFailure();
    }
  }
}
