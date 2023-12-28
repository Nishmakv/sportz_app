part of 'player_leaderboard_bloc.dart';

sealed class PlayerLeaderboardState extends Equatable {
  const PlayerLeaderboardState();

  @override
  List<Object> get props => [];
}

final class PlayerLeaderboardInitial extends PlayerLeaderboardState {}

final class PlayerLeaderboardLoading extends PlayerLeaderboardState {}

final class PlayerLeaderboardSuccess extends PlayerLeaderboardState {
  List<PlayerLeaderBoard> playerLeaderboardModel = [];
  PlayerLeaderboardSuccess({required this.playerLeaderboardModel});
}

final class PlayerLeaderboardFailure extends PlayerLeaderboardState {}
