part of 'delete_turf_bloc.dart';

sealed class DeleteTurfState extends Equatable {
  const DeleteTurfState();
  
  @override
  List<Object> get props => [];
}

final class DeleteTurfInitial extends DeleteTurfState {}
final class DeleteTurfLoading extends DeleteTurfState {}
final class DeleteTurfSuccess extends DeleteTurfState {}
final class DeleteTurfFailure extends DeleteTurfState {}
