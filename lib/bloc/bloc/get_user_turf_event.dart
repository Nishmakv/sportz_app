part of 'get_user_turf_bloc.dart';

sealed class GetUserTurfEvent extends Equatable {
  const GetUserTurfEvent();

  @override
  List<Object> get props => [];
}

class GetUserTurfProcess extends GetUserTurfEvent {
  final double? longitude;
  final double? latitude;

  const GetUserTurfProcess({
    required this.longitude,
    required this.latitude,
  });
}
