part of 'add_new_player_bloc.dart';

sealed class AddNewPlayerEvent extends Equatable {
  const AddNewPlayerEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class AddNewPlayerProcess extends AddNewPlayerEvent {
  final String playerName;
  final String playerPosition;
  final File playerPic;
  final String playerSkill;

  AddNewPlayerProcess({
    required this.playerName,
    required this.playerPosition,
    required this.playerPic,
    required this.playerSkill,
  });
}
