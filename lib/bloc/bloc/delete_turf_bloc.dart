import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/detele_data_source.dart';

part 'delete_turf_event.dart';
part 'delete_turf_state.dart';

class DeleteTurfBloc extends Bloc<DeleteTurfEvent, DeleteTurfState> {
  DeleteTurfDataSource user = DeleteTurfDataSource();
  DeleteTurfBloc() : super(DeleteTurfInitial());
  @override
  Stream<DeleteTurfState> mapEventToState(DeleteTurfEvent event) async* {
    if (event is DeleteTurfProcess) {
      yield* deleteTurfSuccess(event.id);
    }
  }

  Stream<DeleteTurfState> deleteTurfSuccess(int? id) async* {
    yield DeleteTurfLoading();

    final dataResponse = await user.deleteTurf(id: id);
    print(dataResponse);
    if (dataResponse.isNotEmpty) {
      yield DeleteTurfSuccess();
    } else {
      yield DeleteTurfFailure();
    }
  }
}
