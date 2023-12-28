part of 'get_each_player_bloc.dart';

sealed class GetEachPlayerEvent extends Equatable {
  const GetEachPlayerEvent();

  @override
  List<Object> get props => [];
}

class GetEachPlayersProcess extends GetEachPlayerEvent {
  final int id;

  const GetEachPlayersProcess({
    required this.id
  });
}
