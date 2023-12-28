part of 'match_invitation_bloc.dart';

sealed class MatchInvitationState extends Equatable {
  const MatchInvitationState();
  
  @override
  List<Object> get props => [];
}

final class MatchInvitationInitial extends MatchInvitationState {}
final class MatchInvitationLoading extends MatchInvitationState {}
final class MatchInvitationSuccess extends MatchInvitationState {}
final class MatchInvitationFailure extends MatchInvitationState {}
