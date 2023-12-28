part of 'delete_turf_bloc.dart';

sealed class DeleteTurfEvent extends Equatable {
  const DeleteTurfEvent();

  @override
  List<Object> get props => [];
}

class DeleteTurfProcess extends DeleteTurfEvent {
  final int? id;

  const DeleteTurfProcess({required this.id});
}
