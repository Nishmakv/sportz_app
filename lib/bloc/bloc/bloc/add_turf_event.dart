part of 'add_turf_bloc.dart';

abstract class AddTurfEvent extends Equatable {
  const AddTurfEvent();

  @override
  List<Object> get props => [];
}

class AddTurfProcess extends AddTurfEvent {
  final double longitude;
  final double latitude;
  final String name;
  final String price;
  final File image;
  final String description;
  final List amenities;
  final String location;

 
  const AddTurfProcess(
      {required this.longitude,
      required this.latitude,
      required this.name,
      required this.price,
      required this.image,
      required this.amenities,
      required this.description,
      required this.location});
}
