part of 'create_team_bloc.dart';

sealed class CreateTeamState extends Equatable {
  const CreateTeamState();

  @override
  List<Object> get props => [];
}

final class CreateTeamInitial extends CreateTeamState {}

final class CreateTeamLoading extends CreateTeamState {}

final class CreateTeamSuccess extends CreateTeamState {
  TeamById teamById;
  CreateTeamSuccess({required this.teamById});
}

final class CreateTeamFailure extends CreateTeamState {}
