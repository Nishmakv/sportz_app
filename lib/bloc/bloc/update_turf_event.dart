part of 'update_turf_bloc.dart';

sealed class UpdateTurfEvent extends Equatable {
  const UpdateTurfEvent();

  @override
  List<Object> get props => [];
}

class UpdateTurfProcess extends UpdateTurfEvent {
  final int id;
  final double longitude;
  final double latitude;
  final String name;
  final String price;
  final File image;
  final List amenities;
  final String location;

  final String description;
  const UpdateTurfProcess(
      {required this.id,
      required this.longitude,
      required this.latitude,
      required this.name,
      required this.price,
      required this.image,
      required this.amenities,
      required this.description,
      required this.location});
}
