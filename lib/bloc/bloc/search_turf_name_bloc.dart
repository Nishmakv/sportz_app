import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/search_turf_name_data_source.dart';
import 'package:sportz_app/model.dart/search_turf_name_model.dart';

part 'search_turf_name_event.dart';
part 'search_turf_name_state.dart';

class SearchTurfNameBloc
    extends Bloc<SearchTurfNameEvent, SearchTurfNameState> {
  SearchTurfNameDataSource searchTurfNameDataSource =
      SearchTurfNameDataSource();
  SearchTurfNameBloc() : super(SearchTurfNameInitial());
   @override
  Stream<SearchTurfNameState> mapEventToState(SearchTurfNameEvent event) async* {
    if (event is SearchTurfNameProcess) {
      yield* searchTurfNameSuccess(
          event.name);
    }
  }
  Stream<SearchTurfNameState> searchTurfNameSuccess(String? name
    ) async* {
    yield SearchTurfNameLoading();
    final dataResponse = await searchTurfNameDataSource.searchTurf(
    name: name,
   
    );
    print('dataResponse ${dataResponse}');
    if (dataResponse.isNotEmpty) {
      yield SearchTurfNameSuccess(searchTurfModel: dataResponse);
    } else {
      yield SearchTurfNameFailure();
    }
  }
}
