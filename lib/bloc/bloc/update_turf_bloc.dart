import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/update_turf_data_source.dart';

part 'update_turf_event.dart';
part 'update_turf_state.dart';

class UpdateTurfBloc extends Bloc<UpdateTurfEvent, UpdateTurfState> {
  UpdateTurfDataSource updateTurf = UpdateTurfDataSource();
  UpdateTurfBloc() : super(UpdateTurfInitial());
   @override
  Stream<UpdateTurfState> mapEventToState(UpdateTurfEvent event) async* {
    if (event is UpdateTurfProcess) {
      yield* updateTurfSuccess(event.id,event.longitude, event.latitude, event.name,
          event.price, event.image, event.amenities, event.description);
    }
  }
   Stream<UpdateTurfState> updateTurfSuccess(
    int?id,
      double? longitude,
      double? latitide,
      String? name,
      String? price,
      File? image,
      List? amenities,
      
      String? description) async* {
    yield UpdateTurfLoading();
    final dataResponse = await updateTurf.updateTurf(
      id: id,
        longitude: longitude,
        latitude: latitide,
        name: name,
        image: image,
        price: price,
        amenities: amenities,
        description: description);
    if (dataResponse.isNotEmpty) {
      yield UpdateTurfSuccess();
    } else {
      yield UpdateTurfFailure();
    }
  }

}
