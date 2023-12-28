part of 'get_players_bloc.dart';

sealed class GetPlayersEvent extends Equatable {
  const GetPlayersEvent();

  @override
  List<Object> get props => [];
}

class GetPlayersProcess extends GetPlayersEvent {
 

   const GetPlayersProcess();
}
