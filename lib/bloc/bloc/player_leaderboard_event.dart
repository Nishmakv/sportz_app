part of 'player_leaderboard_bloc.dart';

sealed class PlayerLeaderboardEvent extends Equatable {
  const PlayerLeaderboardEvent();

  @override
  List<Object> get props => [];
}

class PlayerLeaderboardProcess extends PlayerLeaderboardEvent {
  const PlayerLeaderboardProcess();
}
