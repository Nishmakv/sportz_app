import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/add_turf_data_source.dart';

part 'add_turf_event.dart';
part 'add_turf_state.dart';

class AddTurfBloc extends Bloc<AddTurfEvent, AddTurfState> {
  AddTurfDataSource user = AddTurfDataSource();

  AddTurfBloc() : super(AddTurfInitial());
  @override
  Stream<AddTurfState> mapEventToState(AddTurfEvent event) async* {
    if (event is AddTurfProcess) {
      yield* addTurfSuccess(event.longitude, event.latitude, event.name,
          event.price, event.image, event.amenities, event.description,event.location);
    }
  }

  Stream<AddTurfState> addTurfSuccess(
      double? longitude,
      double? latitide,
      String? name,
      String? price,
      File? image,
      List? amenities,
      String? description,
      String?location) async* {
    yield AddTurfLoading();
  final dataResponse = await user.addTurf(
        longitude: longitude,
        latitude: latitide,
        name: name,
        image: image,
        price: price,
        amenities: amenities,
        description: description,
        location: location);
    if (dataResponse.isNotEmpty) {
      yield AddTurfSuccess();
    } else {
      yield AddTurfFailure();
    }
  }
}
