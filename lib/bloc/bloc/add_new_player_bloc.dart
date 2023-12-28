import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportz_app/data_source/add_new_player_data_source.dart';
import 'package:sportz_app/screens/team_screen.dart';

part 'add_new_player_event.dart';
part 'add_new_player_state.dart';

class AddNewPlayerBloc extends Bloc<AddNewPlayerEvent, AddNewPlayerState> {
  AddNewPlayerDataSource addNewPlayer = AddNewPlayerDataSource();
  AddNewPlayerBloc() : super(AddNewPlayerInitial());
   @override
  Stream<AddNewPlayerState> mapEventToState(AddNewPlayerEvent event) async* {
    if (event is AddNewPlayerProcess) {
      yield* addNewPlayerSuccess(
          event.playerName, event.playerPosition,event.playerPic,event.playerSkill);
    }
  }
   Stream<AddNewPlayerState> addNewPlayerSuccess(String? playerName, String? playerPosition,File?playerPic,String?playerSkill) async* {
    yield AddNewPlayerLoading();
    final dataResponse = await addNewPlayer.addNewPlayer(
      
    playerName: playerName,
    playerPosition: playerPosition,
    playerPic:playerPic,
    playerSkill: playerSkill,
      // abstract: 'helo',
    );
    print('dataResponse ${dataResponse}');
    if (dataResponse.isNotEmpty) {
      yield AddNewPlayerSuccess();
    } else {
      yield AddNewPlayerFailure();
    }
  }
}
