part of 'gallery_get_bloc.dart';

sealed class GalleryGetEvent extends Equatable {
  const GalleryGetEvent();

  @override
  List<Object> get props => [];
}
class GetImageProcess extends GalleryGetEvent {
 

   const GetImageProcess();
}
