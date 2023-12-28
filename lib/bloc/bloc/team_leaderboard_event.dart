part of 'team_leaderboard_bloc.dart';

sealed class TeamLeaderboardEvent extends Equatable {
  const TeamLeaderboardEvent();

  @override
  List<Object> get props => [];
}

class TeamLeaderboardProcess extends TeamLeaderboardEvent {
  const TeamLeaderboardProcess();
}
