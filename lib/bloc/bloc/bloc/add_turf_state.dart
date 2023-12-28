part of 'add_turf_bloc.dart';

abstract class AddTurfState extends Equatable {
  const AddTurfState();
  
  @override
  List<Object> get props => [];
}

final class AddTurfInitial extends AddTurfState {}
final class AddTurfLoading extends AddTurfState {}
final class AddTurfSuccess extends AddTurfState {}
final class AddTurfFailure extends AddTurfState {}
