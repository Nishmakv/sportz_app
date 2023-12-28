part of 'add_new_player_bloc.dart';

sealed class AddNewPlayerState extends Equatable {
  const AddNewPlayerState();
  
  @override
  List<Object> get props => [];
}

final class AddNewPlayerInitial extends AddNewPlayerState {}
final class AddNewPlayerLoading extends AddNewPlayerState {}
final class AddNewPlayerSuccess extends AddNewPlayerState {}
final class AddNewPlayerFailure extends AddNewPlayerState {}
