part of 'get_one_turf_bloc.dart';

sealed class GetOneTurfEvent extends Equatable {
  const GetOneTurfEvent();

  @override
  List<Object> get props => [];
}

class GetOneTurfProcess extends GetOneTurfEvent {
  final int? id;

  const GetOneTurfProcess({
    required this.id
  });
}
