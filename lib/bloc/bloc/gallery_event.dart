part of 'gallery_bloc.dart';

sealed class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object> get props => [];
}

class AddImageProcess extends GalleryEvent {
  final File image;
  final String description;
  const AddImageProcess({required this.image, required this.description});
}
