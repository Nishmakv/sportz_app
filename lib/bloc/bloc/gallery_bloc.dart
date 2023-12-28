import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/gallery_data_source.dart';
import 'package:sportz_app/model.dart/get_gallery_model.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryDataSource gallery = GalleryDataSource();
  GalleryBloc() : super(GalleryInitial());
  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {
    if (event is AddImageProcess) {
      yield* addImageSuccess(event.image, event.description);
    }
  }

  Stream<GalleryState> addImageSuccess(
      File? image, String? description) async* {
    yield GalleryLoading();
    final dataResponse =
        await gallery.addImage(image: image, description: description);
    if (dataResponse.isNotEmpty) {
      yield GallerySuccess();
    } else {
      yield GalleryFailure();
    }
  }
}
