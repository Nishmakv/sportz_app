part of 'gallery_get_bloc.dart';

sealed class GalleryGetState extends Equatable {
  const GalleryGetState();

  @override
  List<Object> get props => [];
}

final class GalleryGetInitial extends GalleryGetState {}

final class GalleryGetLoading extends GalleryGetState {}

// ignore: must_be_immutable
final class GalleryGetSuccess extends GalleryGetState {
  List<GetGalleryModel> getGalley = [];
  GalleryGetSuccess({required this.getGalley});
}

final class GalleryGetFailure extends GalleryGetState {}
