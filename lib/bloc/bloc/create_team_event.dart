part of 'create_team_bloc.dart';

sealed class CreateTeamEvent extends Equatable {
  const CreateTeamEvent();

  @override
  List<Object> get props => [];
}

class AddTeamProcess extends CreateTeamEvent {
  final double longitude;
  final double latitude;
  final String name;
  final String skill;
  final File image;
  final int strength;

  const AddTeamProcess({
    required this.longitude,
    required this.latitude,
    required this.name,
    required this.skill,
    required this.image,
    required this.strength,
  });
}
