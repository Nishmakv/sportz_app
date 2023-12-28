import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/get_gallery_data_source.dart';
import 'package:sportz_app/model.dart/get_gallery_model.dart';

part 'gallery_get_event.dart';
part 'gallery_get_state.dart';

class GalleryGetBloc extends Bloc<GalleryGetEvent, GalleryGetState> {
  GetGalleryDataSource galleryGet = GetGalleryDataSource();

  GalleryGetBloc() : super(GalleryGetInitial());
  @override
  Stream<GalleryGetState> mapEventToState(GalleryGetEvent event) async* {
    if (event is GetImageProcess) {
      yield* getGallerySuccess();
    }
  }

  Stream<GalleryGetState> getGallerySuccess() async* {
    yield GalleryGetLoading();
    try {
      print("worked");
      final dataResponse = await galleryGet.getGalleryData();
      if (dataResponse.isNotEmpty) {
        yield GalleryGetSuccess(getGalley: dataResponse);
      } else {
        yield GalleryGetFailure();
      }
    } catch (e) {
      print(e);
      yield GalleryGetFailure();
    }
  }
}
