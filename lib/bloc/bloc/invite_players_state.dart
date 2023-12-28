part of 'invite_players_bloc.dart';

sealed class InvitePlayersState extends Equatable {
  const InvitePlayersState();
  
  @override
  List<Object> get props => [];
}

final class InvitePlayersInitial extends InvitePlayersState {}
final class InvitePlayersLoading extends InvitePlayersState {}
final class InvitePlayersSuccess extends InvitePlayersState {}
final class InvitePlayersFailure extends InvitePlayersState {}

