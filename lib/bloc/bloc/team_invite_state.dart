part of 'team_invite_bloc.dart';

sealed class TeamInviteState extends Equatable {
  const TeamInviteState();
  
  @override
  List<Object> get props => [];
}

final class TeamInviteInitial extends TeamInviteState {}
final class TeamInviteLoading extends TeamInviteState {}
final class TeamInviteSuccess extends TeamInviteState {}
final class TeamInviteFailure extends TeamInviteState {}
