part of 'register_player_list_bloc.dart';

sealed class RegisterPlayerListEvent extends Equatable {
  const RegisterPlayerListEvent();

  @override
  List<Object> get props => [];
}

class RegisterPlayerProcess extends RegisterPlayerListEvent {
 

   const RegisterPlayerProcess();
}

