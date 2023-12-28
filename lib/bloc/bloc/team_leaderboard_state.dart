part of 'team_leaderboard_bloc.dart';

sealed class TeamLeaderboardState extends Equatable {
  const TeamLeaderboardState();

  @override
  List<Object> get props => [];
}

final class TeamLeaderboardInitial extends TeamLeaderboardState {}

final class TeamLeaderboardLoading extends TeamLeaderboardState {}

// ignore: must_be_immutable
final class TeamLeaderboardSuccess extends TeamLeaderboardState {
  List<TeamLeaderboard> teamLeaderboardModel = [];
  TeamLeaderboardSuccess({required this.teamLeaderboardModel});
}

final class TeamLeaderboardFailure extends TeamLeaderboardState {}
