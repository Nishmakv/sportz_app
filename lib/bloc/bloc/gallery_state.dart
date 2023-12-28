part of 'gallery_bloc.dart';

sealed class GalleryState extends Equatable {
  const GalleryState();

  @override
  List<Object> get props => [];
}

final class GalleryInitial extends GalleryState {}

final class GalleryLoading extends GalleryState {}

// ignore: must_be_immutable
final class GallerySuccess extends GalleryState {
  
}

final class GalleryFailure extends GalleryState {}
