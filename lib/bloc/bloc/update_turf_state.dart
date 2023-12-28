part of 'update_turf_bloc.dart';

sealed class UpdateTurfState extends Equatable {
  const UpdateTurfState();
  
  @override
  List<Object> get props => [];
}

final class UpdateTurfInitial extends UpdateTurfState {}
final class UpdateTurfLoading extends UpdateTurfState {}
final class UpdateTurfSuccess extends UpdateTurfState {}
final class UpdateTurfFailure extends UpdateTurfState {}
